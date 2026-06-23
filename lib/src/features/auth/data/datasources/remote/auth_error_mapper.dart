import 'package:dio/dio.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';

DomainException mapAuthDioException(Object error) {
  if (error is AuthApiException) {
    return error;
  }

  if (error is DioException) {
    final data = error.response?.data;
    if (data is Map) {
      final detail = data['detail'];
      final errorCode = data['error_code']?.toString();
      final message = detail?.toString() ?? error.message ?? 'Network error';
      return AuthApiException(message: message, errorCode: errorCode);
    }
    return NetworkException(message: error.message ?? 'Network error');
  }

  return UnknownException(message: error.toString());
}

AuthApiException? tryParseAuthApiException(Object error) {
  final mapped = mapAuthDioException(error);
  return mapped is AuthApiException ? mapped : null;
}
