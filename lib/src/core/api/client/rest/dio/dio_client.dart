import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:uiren/src/core/api/client/endpoints.dart';
import 'package:uiren/src/core/api/client/rest/dio/dio_error_message.dart';
import 'package:uiren/src/core/router/router_navigation.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'package:uiren/src/core/main-models/login_dto.dart';

class DioInterceptor {
  final Dio api;
  Dio get getDio => api;

  String? accessToken;
  bool _isRefreshing = false;
  final StorageServiceImpl _storageService = StorageServiceImpl();

  DioInterceptor(this.api) {
    accessToken = _storageService.getAccessToken();
    var talker = getIt<Talker>();
    talker.log("Token: $accessToken", logLevel: LogLevel.info);

    api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.connectTimeout = const Duration(seconds: 30);
          options.receiveTimeout = const Duration(seconds: 30);
          final userAgent = Platform.isAndroid ? 'Android' : 'IOS';
          options.headers['Accept'] = 'application/json';
          options.headers['User-Agent'] = userAgent;
          options.baseUrl = EndPoints.baseUrl;
          options.headers['Accept-Language'] =
              _storageService.getLanguageCode() ?? 'ru';

          if (accessToken != null &&
              !DioErrorPresenter.isPublicAuthRequest(options.uri.path)) {
            options.headers['Authorization'] = 'JWT $accessToken';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (DioErrorPresenter.isRefreshRequest(error.requestOptions.uri.path)) {
            DioErrorPresenter.showMessage(
              DioErrorPresenter.resolveMessage(error),
            );
            await _clearTokensAndRedirectToAuth();
            return handler.next(error);
          }

          if (_isLicenseError(
              error.response?.statusCode, error.response?.data["error_code"])) {
            BuildContext? context = rootNavigatorKey.currentContext;
            if (context != null) {
              while (context.canPop()) {
                context.pop();
              }
              context.push('/login');
            }
            DioErrorPresenter.show(error);
            return handler.next(error);
          }

          if (_isAuthError(error.response?.statusCode)) {
            try {
              final path = error.requestOptions.uri.path;

              if (DioErrorPresenter.isLoginRequest(path) ||
                  DioErrorPresenter.isPublicAuthRequest(path)) {
                DioErrorPresenter.show(error);
                return handler.next(error);
              }

              if (!_isRefreshing) {
                _isRefreshing = true;
                final refreshResult = await _handleTokenRefresh(error);
                _isRefreshing = false;

                if (refreshResult) {
                  final retryResponse = await _retry(error.requestOptions);
                  return handler.resolve(retryResponse);
                } else {
                  return _handleAuthError(error, handler);
                }
              } else {
                await Future.delayed(const Duration(milliseconds: 500));
                if (accessToken != null) {
                  final retryResponse = await _retry(error.requestOptions);
                  return handler.resolve(retryResponse);
                } else {
                  return _handleAuthError(error, handler);
                }
              }
            } catch (e) {
              log('Error during token refresh: $e');
              _isRefreshing = false;
              return _handleAuthError(error, handler);
            }
          }

          if (!DioErrorPresenter.shouldSkipFlash(error)) {
            DioErrorPresenter.show(error);
          }
          return handler.next(error);
        },
      ),
    );

    api.interceptors.add(
      TalkerDioLogger(
        talker: getIt<Talker>(),
        settings: TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: false,
          printResponseMessage: true,
        ),
      ),
    );
  }

  bool _isLicenseError(
    int? statusCode,
    String? message,
  ) =>
      statusCode == 403 && message == "LICENSE_EXPIRED";

  bool _isAuthError(int? statusCode) => statusCode == 401;

  Future<void> _handleAuthError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    log('Authentication error occurred');
    DioErrorPresenter.show(error);

    final path = error.requestOptions.uri.path;
    if (!DioErrorPresenter.isPublicAuthRequest(path)) {
      await _clearTokensAndRedirectToAuth();
    }

    return handler.next(error);
  }

  Future<void> _clearTokensAndRedirectToAuth() async {
    accessToken = null;
    await _storageService.deleteAccessToken();
    await _storageService.deleteRefreshToken();

    BuildContext? context = rootNavigatorKey.currentContext;
    if (context != null) {
      while (context.canPop()) {
        context.pop();
      }
      context.go('/login');
    }
  }

  Future<bool> _handleTokenRefresh(DioException error) async {
    try {
      final refreshDio = Dio();
      refreshDio.options.baseUrl = EndPoints.baseUrl;

      final refreshToken = _storageService.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        log('not available');
        return false;
      }

      final response = await refreshDio.post(EndPoints.refreshToken,
          data: {'refresh_token': refreshToken},
          options: Options(headers: {
            'Accept': 'application/json',
            'User-Agent': Platform.isAndroid ? 'Android' : 'IOS',
            'Accept-Language': _storageService.getLanguageCode() ?? 'ru',
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        inspect(response.data);
        var data = LoginDto.fromJson(response.data);
        accessToken = data.access_token;
        var newRefreshToken = data.refresh_token;
        await _storageService.setAccessToken(accessToken);
        await _storageService.setRefreshToken(newRefreshToken);
        return true;
      }
    } catch (e) {
      log('Token refresh failed: $e');
    }
    return false;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        if (accessToken != null) 'Authorization': 'JWT $accessToken',
      },
    );

    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
