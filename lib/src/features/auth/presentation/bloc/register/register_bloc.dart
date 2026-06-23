import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uiren/src/core/base/base_bloc/bloc/base_bloc.dart';
import 'package:uiren/src/core/exceptions/domain_exception.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/service/injectable/service_register_proxy.dart';
import 'package:uiren/src/core/utils/helpers/phone_helper.dart';
import 'package:uiren/src/features/auth/domain/requests/register/complete_registration_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/request_otp_request.dart';
import 'package:uiren/src/features/auth/domain/requests/register/verify_otp_request.dart';
import 'package:uiren/src/features/auth/domain/usecases/complete_registration_usecase.dart';
import 'package:uiren/src/features/auth/domain/usecases/request_otp_usecase.dart';
import 'package:uiren/src/features/auth/domain/usecases/verify_otp_usecase.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

enum RegisterStep { phone, otp, profile }

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  RegisterBloc(
    this._requestOtpUseCase,
    this._verifyOtpUseCase,
    this._completeRegistrationUseCase,
  ) : super(const RegisterState());

  final RequestOtpUseCase _requestOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final CompleteRegistrationUseCase _completeRegistrationUseCase;

  @override
  Future<void> onEventHandler(RegisterEvent event, Emitter emit) async {
    await event.map(
      requestOtp: (event) => _requestOtp(event.phone, emit, isResend: false),
      verifyOtp: (event) => _verifyOtp(event.otp, emit),
      resendOtp: (_) => _requestOtp(state.phone, emit, isResend: true),
      completeRegistration: (event) => _completeRegistration(
        event.firstName,
        event.lastName,
        event.password,
        event.group,
        event.onSuccess,
        emit,
      ),
      resetToPhoneStep: (_) async => emit(
        RegisterState(
          phone: state.phone,
          errorMessage: state.errorMessage,
          errorCode: state.errorCode,
        ),
      ),
      clearError: (_) async =>
          emit(state.copyWith(errorMessage: null, errorCode: null)),
    );
  }

  Future<void> _requestOtp(
    String rawPhone,
    Emitter emit, {
    required bool isResend,
  }) async {
    final phone = formatPhoneForApi(rawPhone);
    emit(
      state.copyWith(
        isLoading: true,
        phone: phone,
        errorMessage: null,
        errorCode: null,
        isSuccess: false,
      ),
    );

    final result = await _requestOtpUseCase.call(RequestOtpRequest(phone: phone));

    if (result.isSuccessful && result.data != null) {
      emit(
        state.copyWith(
          isLoading: false,
          step: RegisterStep.otp,
          otpExpiresIn: result.data!,
          errorMessage: null,
          errorCode: null,
        ),
      );
      return;
    }

    final error = result.failure;
    emit(
      state.copyWith(
        isLoading: false,
        step: isResend ? RegisterStep.otp : RegisterStep.phone,
        errorMessage: error?.message,
        errorCode: error is AuthApiException ? error.errorCode : null,
      ),
    );
  }

  Future<void> _verifyOtp(String otp, Emitter emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, errorCode: null));

    final result = await _verifyOtpUseCase.call(
      VerifyOtpRequest(phone: state.phone, otp: otp),
    );

    if (result.isSuccessful) {
      emit(
        state.copyWith(
          isLoading: false,
          step: RegisterStep.profile,
          errorMessage: null,
          errorCode: null,
        ),
      );
      return;
    }

    final error = result.failure;
    emit(
      state.copyWith(
        isLoading: false,
        errorMessage: error?.message,
        errorCode: error is AuthApiException ? error.errorCode : null,
      ),
    );
  }

  Future<void> _completeRegistration(
    String firstName,
    String lastName,
    String password,
    String group,
    void Function() onSuccess,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, errorCode: null));

    final result = await _completeRegistrationUseCase.call(
      CompleteRegistrationRequest(
        phone: state.phone,
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        password: password,
        group: group.trim(),
      ),
    );

    if (result.isSuccessful) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
      onSuccess();
      return;
    }

    final error = result.failure;
    final errorCode = error is AuthApiException ? error.errorCode : null;
    final message = error?.message ?? '';
    final sessionExpired = errorCode == 'VALIDATION_ERROR' &&
        (message.contains('истек') ||
            message.contains('истекла') ||
            message.contains('заново'));

    if (sessionExpired) {
      emit(
        RegisterState(
          phone: state.phone,
          errorMessage: error?.message,
          errorCode: errorCode,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isLoading: false,
        errorMessage: error?.message,
        errorCode: errorCode,
      ),
    );
  }

  @override
  Future<void> close() {
    getIt.resetBloc(this);
    return super.close();
  }
}
