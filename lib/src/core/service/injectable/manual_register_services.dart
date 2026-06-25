import 'injectable_service.dart';
import 'service_register_proxy.dart';
import 'package:uiren/src/features/auth/domain/usecases/complete_registration_usecase.dart';
import 'package:uiren/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:uiren/src/features/auth/domain/usecases/request_otp_usecase.dart';
import 'package:uiren/src/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:uiren/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uiren/src/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:uiren/src/features/home/domain/usecases/get_home_usecase.dart';
import 'package:uiren/src/features/home/presentation/bloc/home_bloc.dart';

void manualRegisterServices() {
  if (!getIt.isRegistered<AuthBloc>()) {
    getIt.registerBloc<AuthBloc>(
      () => AuthBloc(getIt<LoginUseCase>()),
    );
  }

  if (!getIt.isRegistered<RegisterBloc>()) {
    getIt.registerBloc<RegisterBloc>(
      () => RegisterBloc(
        getIt<RequestOtpUseCase>(),
        getIt<VerifyOtpUseCase>(),
        getIt<CompleteRegistrationUseCase>(),
      ),
    );
  }

  if (!getIt.isRegistered<HomeBloc>()) {
    getIt.registerBloc<HomeBloc>(
      () => HomeBloc(getIt<GetHomeUseCase>()),
    );
  }
}
