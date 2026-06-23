import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/base/base_use_case/use_case.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:uiren/src/features/auth/domain/repository/i_auth_repository.dart';
import 'package:uiren/src/features/auth/domain/requests/register/complete_registration_request.dart';

@lazySingleton
class CompleteRegistrationUseCase
    extends UseCase<String, CompleteRegistrationRequest> {
  CompleteRegistrationUseCase(@Named.from(AuthRepoImpl) this._repository);

  final IAuthRepo _repository;

  @override
  Future<Either<DomainException, String>> execute(
    CompleteRegistrationRequest request,
  ) async {
    return _repository.completeRegistration(request);
  }
}
