import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  //injectamos los caso de uso para tener acceso / y lo injectamos en el constructor
  AuthUseCases authUseCases;
  //llamamos al constructor / super indica el manejador de estado
  RegisterBloc(this.authUseCases) : super(RegisterState()) {
    //registramos los eventos

    //inicializa el formulario
    on<RegisterInitEvent>(_onInitEvent);
    on<RegisterNameChanged>(_onNameChange);
    on<RegisterLastNameChanged>(_onLastNameChange);
    on<RegisterEmailChanged>(_onEmailChange);
    on<RegisterPhoneChanged>(_onPhoneChange);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterFormResert>(_onRegisterFormReset);
    on<RegisterFormOnClick>(_onRegisterFormOnClick);
  }
  final formKey = GlobalKey<FormState>();
  Future<void> _onInitEvent(
      RegisterInitEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChange(
      RegisterNameChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onLastNameChange(
      RegisterLastNameChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        lastname: BlocFormItem(
            value: event.lastname.value,
            error:
                event.lastname.value.isNotEmpty ? null : 'Ingresa el apellido'),
        formKey: formKey));
  }

  Future<void> _onEmailChange(
      RegisterEmailChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isNotEmpty ? null : 'Ingresa el email'),
        formKey: formKey));
  }

  Future<void> _onPhoneChange(
      RegisterPhoneChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isNotEmpty ? null : 'Ingresa el telefono'),
        formKey: formKey));
  }

  Future<void> _onPasswordChanged(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isNotEmpty &&
                    event.password.value.length >= 6
                ? null
                : 'Ingresa el password'),
        formKey: formKey));
  }

  Future<void> _onConfirmPasswordChanged(
      RegisterConfirmPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        confirmPassword: BlocFormItem(
            value: event.confirmPassword.value,
            error: event.confirmPassword.value.isNotEmpty &&
                    event.confirmPassword.value.length >= 6
                ? null
                : 'Confirmar password'),
        formKey: formKey));
  }

  //para resetear el formulario
  Future<void> _onRegisterFormReset(RegisterFormResert event, Emitter<RegisterState> emit) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onRegisterFormOnClick(RegisterFormOnClick event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        response: Loading(), 
        formKey: formKey
      ));
    Resource response = await authUseCases.register.run(state.toUser());
    emit(
      state.copyWith(
        response: response,
        formKey: formKey
      ));
  }
}
