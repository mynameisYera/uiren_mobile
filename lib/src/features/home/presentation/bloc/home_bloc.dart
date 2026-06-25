import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uiren/src/core/base/base_bloc/bloc/base_bloc.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/service/injectable/service_register_proxy.dart';
import 'package:uiren/src/features/home/domain/entities/home_entity.dart';
import 'package:uiren/src/features/home/domain/usecases/get_home_usecase.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._getHomeUseCase) : super(const HomeState.initial());

  final GetHomeUseCase _getHomeUseCase;

  @override
  Future<void> onEventHandler(HomeEvent event, Emitter emit) async {
    await event.when(
      started: () async => _loadHome(emit),
      refreshed: () async => _loadHome(emit),
      courseSelected: (courseId) async => _selectCourse(courseId, emit),
    );
  }

  Future<void> _loadHome(Emitter emit) async {
    emit(const HomeState.loading());

    final result = await _getHomeUseCase.call();

    if (!result.isSuccessful || result.data == null) {
      emit(const HomeState.initial());
      return;
    }

    final home = result.data!;

    if (!home.hasCourses || home.roadmap.isEmpty) {
      emit(const HomeState.empty());
      return;
    }

    final selectedCourseId = _resolveSelectedCourseId(home);

    emit(
      HomeState.loaded(
        home: home,
        selectedCourseId: selectedCourseId,
      ),
    );
  }

  void _selectCourse(int courseId, Emitter emit) {
    final currentState = state;
    if (currentState is! _Loaded) {
      return;
    }

    if (currentState.home.courseById(courseId) == null) {
      return;
    }

    emit(
      currentState.copyWith(selectedCourseId: courseId),
    );
  }

  int _resolveSelectedCourseId(HomeEntity home) {
    final currentId = home.currentCourseId;
    if (currentId != null && home.courseById(currentId) != null) {
      return currentId;
    }

    if (home.roadmap.isNotEmpty) {
      return home.roadmap.first.id;
    }

    if (home.courses.isNotEmpty) {
      return home.courses.first.id;
    }

    return 0;
  }

  @override
  Future<void> close() {
    getIt.resetBloc(this);
    return super.close();
  }
}
