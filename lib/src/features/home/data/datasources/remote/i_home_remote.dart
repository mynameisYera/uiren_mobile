import 'package:fpdart/fpdart.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/home/data/models/home_dto.dart';

abstract interface class IHomeRemote {
  Future<Either<DomainException, HomeDto>> getHome();
}
