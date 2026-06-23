import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/widgets/custom_error_widget.dart';

class DioErrorPresenter {
  DioErrorPresenter._();

  static void show(DioException error) {
    CustomErrorWidget.show(message: resolveMessage(error));
  }

  static void showMessage(String message) {
    CustomErrorWidget.show(message: message);
  }

  static String resolveMessage(DioException error) {
    final response = error.response;
    final data = response?.data;
    final path = _requestPath(error);

    if (data is Map) {
      final errorCode = data['error_code']?.toString();
      final detail = _readDetail(data);

      switch (errorCode) {
        case 'UNAUTHORIZED':
          return LocaleKeys.error_unauthorized.tr();
        case 'RATE_LIMITED':
          return LocaleKeys.error_rate_limited.tr();
        case 'CONFLICT':
          return _resolveConflictMessage(path);
        case 'VALIDATION_ERROR':
          return detail ?? LocaleKeys.error_validation.tr();
        case 'LICENSE_EXPIRED':
          return LocaleKeys.error_forbidden.tr();
      }

      if (detail != null && detail.isNotEmpty) {
        return detail;
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return LocaleKeys.error_timeout.tr();
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        if (error.error is SocketException ||
            error.message?.toLowerCase().contains('socket') == true) {
          return LocaleKeys.error_network.tr();
        }
        return LocaleKeys.error_network.tr();
      case DioExceptionType.badCertificate:
        return LocaleKeys.error_network.tr();
      case DioExceptionType.cancel:
        return LocaleKeys.error_unknown.tr();
      case DioExceptionType.badResponse:
        return _resolveStatusMessage(response?.statusCode, path);
    }
  }

  static String _requestPath(DioException error) {
    return error.requestOptions.uri.path;
  }

  static String _resolveConflictMessage(String path) {
    if (path.contains('/register/')) {
      return LocaleKeys.phone_already_registered.tr();
    }
    return LocaleKeys.error_conflict.tr();
  }

  static String _resolveStatusMessage(int? statusCode, String path) {
    switch (statusCode) {
      case 401:
        return isLoginRequest(path)
            ? LocaleKeys.error_unauthorized.tr()
            : LocaleKeys.error_session_expired.tr();
      case 403:
        return LocaleKeys.error_forbidden.tr();
      case 404:
        return LocaleKeys.error_not_found.tr();
      case 409:
        return _resolveConflictMessage(path);
      case 429:
        return LocaleKeys.error_rate_limited.tr();
      case final code? when code >= 500:
        return LocaleKeys.error_server.tr();
      default:
        return LocaleKeys.error_unknown.tr();
    }
  }

  static String? _readDetail(Map data) {
    final detail = data['detail'];
    if (detail == null) return null;

    if (detail is String && detail.trim().isNotEmpty) {
      return detail.trim();
    }

    if (detail is List && detail.isNotEmpty) {
      final first = detail.first;
      if (first is Map) {
        final msg = first['msg'] ?? first['message'];
        if (msg != null && msg.toString().trim().isNotEmpty) {
          return msg.toString().trim();
        }
      }
      return detail.first.toString();
    }

    return detail.toString();
  }

  static bool isLoginRequest(String path) {
    return path.contains('/auth/login');
  }

  static bool isPublicAuthRequest(String path) {
    return path.contains('/auth/login') ||
        path.contains('/auth/register/') ||
        path.contains('/auth/refresh');
  }

  static bool isRefreshRequest(String path) {
    return path.contains('/auth/refresh');
  }

  static bool shouldSkipFlash(DioException error) {
    return isRefreshRequest(error.requestOptions.uri.path);
  }
}
