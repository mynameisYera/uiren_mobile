import 'injectable_service.dart';
import 'service_register_proxy.dart';
import 'package:uiren/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:uiren/src/features/auth/presentation/bloc/auth_bloc.dart';

void manualRegisterServices() {
  if (!getIt.isRegistered<AuthBloc>()) {
    getIt.registerBloc<AuthBloc>(
      () => AuthBloc(getIt<LoginUseCase>()),
    );
  }
}
