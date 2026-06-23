part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(RegisterStep.phone) RegisterStep step,
    @Default('') String phone,
    @Default(0) int otpExpiresIn,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? errorCode,
    @Default(false) bool isSuccess,
  }) = _RegisterState;
}
