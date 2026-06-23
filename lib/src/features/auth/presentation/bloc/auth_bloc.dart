import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uiren/src/core/base/base_bloc/bloc/base_bloc.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/service/injectable/service_register_proxy.dart';
import 'package:uiren/src/features/auth/domain/requests/login/login_request.dart';
import 'package:uiren/src/features/auth/domain/usecases/login_usecase.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginUseCase,
  ) : super(const AuthState.initial());
  final LoginUseCase _loginUseCase;


  @override
  Future<void> onEventHandler(AuthEvent event, Emitter emit) async {
    await event.when(
      doLogin: (_, __, ___) async => _doLogin(event as _DoLogin, emit),
    );
  }


  _doLogin(
    _DoLogin event,
    Emitter emit,
  ) async {
    emit(const AuthState.loading());

    final request = LoginRequest(
      password: event.password,
      identifier: event.identifier,
    );
    final result = await _loginUseCase.call(request);

    if (result.isSuccessful) {
      emit(const AuthState.success());
      event.onSuccess();
    } else {
      emit(const AuthState.initial());
    }
  }

  @override
  Future<void> close() {
    getIt.resetBloc(this);
    return super.close();
  }
}
