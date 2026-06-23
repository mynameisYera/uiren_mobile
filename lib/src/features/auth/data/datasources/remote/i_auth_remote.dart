import 'package:fpdart/fpdart.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/auth/domain/requests/login/login_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/complete_registration_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/request_otp_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/verify_otp_request.dart';

abstract interface class IAuthRemote {
  Future<Either<DomainException, String>> login(LoginRequest request);

  Future<Either<DomainException, int>> requestOtp(RequestOtpRequest request);

  Future<Either<DomainException, void>> verifyOtp(VerifyOtpRequest request);

  Future<Either<DomainException, String>> completeRegistration(
    CompleteRegistrationRequest request,
  );
}
