import 'package:uiren/src/features/auth/domain/requests/login/login_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/core/base/base_use_case/use_case.dart';
import 'package:uiren/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:uiren/src/features/auth/domain/repository/i_auth_repository.dart';

@lazySingleton
class LoginUseCase extends UseCase<String, LoginRequest> {
  final IAuthRepo _repository;
  LoginUseCase(@Named.from(AuthRepoImpl) this._repository);
  @override
  Future<Either<DomainException, String>> execute(
      LoginRequest request) async {
    return await _repository.login(request);
  }
}
