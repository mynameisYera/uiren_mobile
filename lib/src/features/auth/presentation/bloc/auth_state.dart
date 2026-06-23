part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loadingFailure() = _LoadingFailure;
  const factory AuthState.loaded() = _Loaded;
  const factory AuthState.success() = _Success;
}
