import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//clase q inicia el formulario
class RegisterInitEvent extends RegisterEvent {
  const RegisterInitEvent();
}

//clase q dispara el envio del formulario
class RegisterFormOnClick extends RegisterEvent {
  const RegisterFormOnClick();
}

//clase q resetea el formulario
class RegisterFormResert extends RegisterEvent {
  const RegisterFormResert();
}

//llamamos a los campos
class RegisterNameChanged extends RegisterEvent {
  final BlocFormItem name;
  const RegisterNameChanged({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

class RegisterLastNameChanged extends RegisterEvent {
  final BlocFormItem lastname;
  const RegisterLastNameChanged({required this.lastname});

  @override
  // TODO: implement props
  List<Object?> get props => [lastname];
}

class RegisterEmailChanged extends RegisterEvent {
  final BlocFormItem email;
  const RegisterEmailChanged({required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class RegisterPhoneChanged extends RegisterEvent {
  final BlocFormItem phone;
  const RegisterPhoneChanged({required this.phone});

  @override
  // TODO: implement props
  List<Object?> get props => [phone];
}

class RegisterPasswordChanged extends RegisterEvent {
  final BlocFormItem password;
  const RegisterPasswordChanged({required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class RegisterConfirmPasswordChanged extends RegisterEvent {
  final BlocFormItem confirmPassword;
  const RegisterConfirmPasswordChanged({required this.confirmPassword});

  @override
  // TODO: implement props
  List<Object?> get props => [confirmPassword];
}

