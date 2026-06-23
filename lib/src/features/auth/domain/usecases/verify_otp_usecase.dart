import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/base/base_use_case/use_case.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:uiren/src/features/auth/domain/repository/i_auth_repository.dart';
import 'package:uiren/src/features/auth/domain/requests/register/verify_otp_request.dart';

@lazySingleton
class VerifyOtpUseCase extends NoneOutputBoundaryUseCase<VerifyOtpRequest> {
  VerifyOtpUseCase(@Named.from(AuthRepoImpl) this._repository);

  final IAuthRepo _repository;

  @override
  Future<Either<DomainException, void>> execute(
    VerifyOtpRequest request,
  ) async {
    return _repository.verifyOtp(request);
  }
}
