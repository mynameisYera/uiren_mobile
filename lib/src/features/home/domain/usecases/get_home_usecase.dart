import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/base/base_use_case/use_case.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:uiren/src/features/home/domain/entities/home_entity.dart';
import 'package:uiren/src/features/home/domain/repository/i_home_repository.dart';

@lazySingleton
class GetHomeUseCase extends NoneInputBoundaryUseCase<HomeEntity> {
  GetHomeUseCase(@Named.from(HomeRepoImpl) this._repository);

  final IHomeRepo _repository;

  @override
  Future<Either<DomainException, HomeEntity>> execute() {
    return _repository.getHome();
  }
}
