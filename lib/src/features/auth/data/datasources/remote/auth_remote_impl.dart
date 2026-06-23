import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/api/client/endpoints.dart';
import 'package:uiren/src/core/api/client/rest/dio/dio_client.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/core/main-models/login_dto.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'package:uiren/src/features/auth/domain/requests/login/login_request.dart';

import 'i_auth_remote.dart';

@named
@LazySingleton(as: IAuthRemote)
class AuthRemoteImpl implements IAuthRemote {
  Dio get dioClient => DioInterceptor(Dio()).getDio;

  @override
  Future<Either<DomainException, String>> login(LoginRequest request) async {
    try {
      final response = await dioClient.post(
        EndPoints.baseUrl + EndPoints.login,
        data: <String, dynamic>{
          'phone': request.identifier,
          'password': request.password,
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = LoginDto.fromJson(
          Map<String, dynamic>.from(response.data as Map),
        );
        await StorageServiceImpl().setAccessToken(data.access_token);
        await StorageServiceImpl().setRefreshToken(data.refresh_token);
        return Right('success');
      } else {
        return Left(
          UnknownException(message: 'Error: ${response.data}'),
        );
      }
    } catch (e) {
      return Left(
        e is DomainException ? e : UnknownException(message: e.toString()),
      );
    }
  }
}
