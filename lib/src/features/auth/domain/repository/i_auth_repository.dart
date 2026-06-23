import 'package:fpdart/fpdart.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/auth/domain/requests/login/login_request.dart';

abstract interface class IAuthRepo {
  Future<Either<DomainException, String>> login(LoginRequest request);
}
