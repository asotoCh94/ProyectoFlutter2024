import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/models/AuthResponse.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCases authUseCases;
  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<InitEvent>(_onInitEvent);
    on<EmailChanged>(_onEmailChange);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginOnclick>(_onLoginOnclick);
    on<LoginFormReset>(_onLoginFormReset);
    on<LoginSaveUserSession>(_onLoginSaveUserSession);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(InitEvent event, Emitter<LoginState> emit) async {
    //obtener session
    AuthResponse? authResponse = await authUseCases.getSaveUserSessionUseCase.run();
    print('usuariooo de session ${authResponse?.toJson()}');
    emit(state.copyWith(formKey: formKey));
    if(authResponse != null){
      emit(state.copyWith(
        response: Succes(authResponse),// authResponse / user - token
        formKey: formKey
      ));
    }
  }

  //guardar session
  Future<void> _onLoginSaveUserSession(
      LoginSaveUserSession event, Emitter<LoginState> emit) async {
    await authUseCases.saveUserSessionUseCase.run(event.authResponse);
  }

  //para resetear el formulario
  Future<void> _onLoginFormReset(
      LoginFormReset event, Emitter<LoginState> emit) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onEmailChange(
      EmailChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isNotEmpty ? null : 'Ingresa el email'),
        formKey: formKey));
  }

  Future<void> _onPasswordChanged(
      PasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isNotEmpty &&
                    event.password.value.length >= 6
                ? null
                : 'Ingresa el password'),
        formKey: formKey));
  }

  Future<void> _onLoginOnclick(LoginOnclick event, Emitter<LoginState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response =await authUseCases.login.login(state.email.value, state.password.value);
    emit(state.copyWith(response: response, formKey: formKey));
  }
}
