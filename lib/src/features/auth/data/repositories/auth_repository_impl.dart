import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/auth/data/datasources/remote/auth_remote_impl.dart';
import 'package:uiren/src/features/auth/data/datasources/remote/i_auth_remote.dart';
import 'package:uiren/src/features/auth/domain/repository/i_auth_repository.dart';
import 'package:uiren/src/features/auth/domain/requests/login/login_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/complete_registration_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/request_otp_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/verify_otp_request.dart';

@named
@LazySingleton(as: IAuthRepo)
class AuthRepoImpl implements IAuthRepo {
  AuthRepoImpl(
    @Named.from(AuthRemoteImpl) this._authRemote,
  );

  final IAuthRemote _authRemote;

  @override
  Future<Either<DomainException, String>> login(
    LoginRequest loginRequest,
  ) async {
    try {
      return _authRemote.login(loginRequest);
    } catch (error) {
      return Left(
        error is DomainException
            ? error
            : UnknownException(message: error.toString()),
      );
    }
  }

  @override
  Future<Either<DomainException, int>> requestOtp(
    RequestOtpRequest request,
  ) async {
    try {
      return _authRemote.requestOtp(request);
    } catch (error) {
      return Left(
        error is DomainException
            ? error
            : UnknownException(message: error.toString()),
      );
    }
  }

  @override
  Future<Either<DomainException, void>> verifyOtp(
    VerifyOtpRequest request,
  ) async {
    try {
      return _authRemote.verifyOtp(request);
    } catch (error) {
      return Left(
        error is DomainException
            ? error
            : UnknownException(message: error.toString()),
      );
    }
  }

  @override
  Future<Either<DomainException, String>> completeRegistration(
    CompleteRegistrationRequest request,
  ) async {
    try {
      return _authRemote.completeRegistration(request);
    } catch (error) {
      return Left(
        error is DomainException
            ? error
            : UnknownException(message: error.toString()),
      );
    }
  }
}
