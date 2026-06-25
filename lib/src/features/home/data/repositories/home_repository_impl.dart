import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/features/home/data/datasources/remote/home_remote_impl.dart';
import 'package:uiren/src/features/home/data/datasources/remote/i_home_remote.dart';
import 'package:uiren/src/features/home/domain/entities/home_entity.dart';
import 'package:uiren/src/features/home/domain/repository/i_home_repository.dart';

@named
@LazySingleton(as: IHomeRepo)
class HomeRepoImpl implements IHomeRepo {
  HomeRepoImpl(
    @Named.from(HomeRemoteImpl) this._homeRemote,
  );

  final IHomeRemote _homeRemote;

  @override
  Future<Either<DomainException, HomeEntity>> getHome() async {
    try {
      final result = await _homeRemote.getHome();
      return result.map((dto) => dto.toEntity());
    } catch (error) {
      return Left(
        error is DomainException
            ? error
            : UnknownException(message: error.toString()),
      );
    }
  }
}
