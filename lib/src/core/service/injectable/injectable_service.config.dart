// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/auth/data/datasources/remote/auth_remote_impl.dart'
    as _i292;
import '../../../features/auth/data/datasources/remote/i_auth_remote.dart'
    as _i631;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i365;
import '../../../features/auth/domain/repository/i_auth_repository.dart'
    as _i1024;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i849;
import '../../utils/picker/file_picker.dart' as _i716;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i716.FilePickerService>(() => _i716.FilePickerService());
    gh.lazySingleton<_i631.IAuthRemote>(
      () => _i292.AuthRemoteImpl(),
      instanceName: 'AuthRemoteImpl',
    );
    gh.lazySingleton<_i1024.IAuthRepo>(
      () => _i365.AuthRepoImpl(
        gh<_i631.IAuthRemote>(instanceName: 'AuthRemoteImpl'),
      ),
      instanceName: 'AuthRepoImpl',
    );
    gh.lazySingleton<_i849.LoginUseCase>(
      () => _i849.LoginUseCase(
        gh<_i1024.IAuthRepo>(instanceName: 'AuthRepoImpl'),
      ),
    );
    return this;
  }
}
