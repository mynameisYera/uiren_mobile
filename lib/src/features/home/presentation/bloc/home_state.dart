part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.loaded({
    required HomeEntity home,
    required int selectedCourseId,
  }) = _Loaded;

  const factory HomeState.empty() = _Empty;
}
