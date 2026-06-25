import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/api/client/endpoints.dart';
import 'package:uiren/src/core/api/client/rest/dio/dio_client.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/auth/data/datasources/remote/auth_error_mapper.dart';
import 'package:uiren/src/features/home/data/datasources/remote/i_home_remote.dart';
import 'package:uiren/src/features/home/data/models/home_dto.dart';

@named
@LazySingleton(as: IHomeRemote)
class HomeRemoteImpl implements IHomeRemote {
  final Dio _dio = DioInterceptor(Dio()).getDio;

  @override
  Future<Either<DomainException, HomeDto>> getHome() async {
    try {
      final response = await _dio.get(EndPoints.home);

      if (response.statusCode == 200) {
        return Right(
          HomeDto.fromJson(Map<String, dynamic>.from(response.data as Map)),
        );
      }

      return Left(
        UnknownException(message: 'Error: ${response.data}'),
      );
    } catch (error) {
      return Left(mapAuthDioException(error));
    }
  }
}
