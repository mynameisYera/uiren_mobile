part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.requestOtp({required String phone}) = _RequestOtp;

  const factory RegisterEvent.verifyOtp({required String otp}) = _VerifyOtp;

  const factory RegisterEvent.resendOtp() = _ResendOtp;

  const factory RegisterEvent.completeRegistration({
    required String firstName,
    required String lastName,
    required String password,
    @Default('') String group,
    required VoidCallback onSuccess,
  }) = _CompleteRegistration;

  const factory RegisterEvent.resetToPhoneStep() = _ResetToPhoneStep;

  const factory RegisterEvent.clearError() = _ClearError;
}
