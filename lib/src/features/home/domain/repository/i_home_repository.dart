import 'package:fpdart/fpdart.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/home/domain/entities/home_entity.dart';

abstract interface class IHomeRepo {
  Future<Either<DomainException, HomeEntity>> getHome();
}
