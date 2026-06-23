
// import 'package:wagtech/src/features/auth/domain/requests/register/register_request.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:injectable/injectable.dart';
// import 'package:wagtech/src/core/base/base_use_case/use_case.dart';
// import 'package:wagtech/src/core/exceptions/domain_exception.dart';
// import 'package:wagtech/src/features/auth/data/repositories/auth_repository_impl.dart';
// import 'package:wagtech/src/features/auth/domain/repository/i_auth_repository.dart';

// @lazySingleton
// class RegisterUseCase extends UseCase<User, RegisterRequest> {
//   final IAuthRepo _repository;
//   RegisterUseCase(@Named.from(AuthRepoImpl) this._repository);
//   @override
//   Future<Either<DomainException, User>> execute(
//       RegisterRequest request) async {
//     return await _repository.register(request);
//   }
// }
