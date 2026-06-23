part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.doLogin({
    required String password,
    required String identifier,
    required VoidCallback onSuccess,
  }) = _DoLogin;
}