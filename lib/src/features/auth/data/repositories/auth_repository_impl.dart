import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/auth/data/datasources/remote/auth_remote_impl.dart';
import 'package:uiren/src/features/auth/data/datasources/remote/i_auth_remote.dart';
import 'package:uiren/src/features/auth/domain/repository/i_auth_repository.dart';
import 'package:uiren/src/features/auth/domain/requests/login/login_request.dart';

@named
@LazySingleton(as: IAuthRepo)
class AuthRepoImpl implements IAuthRepo {
  AuthRepoImpl(
    @Named.from(AuthRemoteImpl) this._authRemote
  );

  final IAuthRemote _authRemote;


  @override
  Future<Either<DomainException, String>> login(
      LoginRequest loginRequest) async {
    try {
      final result = await _authRemote.login(loginRequest);

      return await result.fold(
        (DomainException error) => Left(error),
        (String user) async {
          return Right(user);
        },
      );
    } catch (e) {
      return Left(
        e is DomainException ? e : UnknownException(message: e.toString()),
      );
    }
  }

}
