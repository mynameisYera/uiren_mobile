import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/api/client/endpoints.dart';
import 'package:uiren/src/core/api/client/rest/dio/dio_client.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/core/main-models/login_dto.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'package:uiren/src/features/auth/data/datasources/remote/auth_error_mapper.dart';
import 'package:uiren/src/features/auth/domain/requests/login/login_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/complete_registration_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/request_otp_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/verify_otp_request.dart';

import 'i_auth_remote.dart';

@named
@LazySingleton(as: IAuthRemote)
class AuthRemoteImpl implements IAuthRemote {
  final Dio _dio = DioInterceptor(Dio()).getDio;

  Future<Either<DomainException, T>> _post<T>(
    String path,
    Map<String, dynamic> data,
    T Function(Map<String, dynamic> json) parser,
  ) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
          parser(Map<String, dynamic>.from(response.data as Map)),
        );
      }

      return Left(
        UnknownException(message: 'Error: ${response.data}'),
      );
    } catch (error) {
      return Left(mapAuthDioException(error));
    }
  }

  Future<void> _saveTokens(Map<String, dynamic> json) async {
    final data = LoginDto.fromJson(json);
    await StorageServiceImpl().setAccessToken(data.access_token);
    await StorageServiceImpl().setRefreshToken(data.refresh_token);
  }

  @override
  Future<Either<DomainException, String>> login(LoginRequest request) async {
    final result = await _post<LoginDto>(
      EndPoints.login,
      {
        'phone': request.identifier,
        'password': request.password,
      },
      LoginDto.fromJson,
    );

    return result.fold(
      Left.new,
      (data) async {
        await _saveTokens({
          'access_token': data.access_token,
          'refresh_token': data.refresh_token,
          'token_type': data.token_type,
        });
        return const Right('success');
      },
    );
  }

  @override
  Future<Either<DomainException, int>> requestOtp(
    RequestOtpRequest request,
  ) async {
    final result = await _post<Map<String, dynamic>>(
      EndPoints.registerRequestOtp,
      {'phone': request.phone},
      (json) => json,
    );

    return result.map(
      (json) => (json['expires_in'] as num?)?.toInt() ?? 300,
    );
  }

  @override
  Future<Either<DomainException, void>> verifyOtp(
    VerifyOtpRequest request,
  ) async {
    final result = await _post<Map<String, dynamic>>(
      EndPoints.registerVerifyOtp,
      {
        'phone': request.phone,
        'otp': request.otp,
      },
      (json) => json,
    );

    return result.map((_) {});
  }

  @override
  Future<Either<DomainException, String>> completeRegistration(
    CompleteRegistrationRequest request,
  ) async {
    final result = await _post<LoginDto>(
      EndPoints.register,
      {
        'phone': request.phone,
        'first_name': request.firstName,
        'last_name': request.lastName,
        'password': request.password,
        'group': request.group,
      },
      LoginDto.fromJson,
    );

    return result.fold(
      Left.new,
      (data) async {
        await _saveTokens({
          'access_token': data.access_token,
          'refresh_token': data.refresh_token,
          'token_type': data.token_type,
        });
        return const Right('success');
      },
    );
  }
}
