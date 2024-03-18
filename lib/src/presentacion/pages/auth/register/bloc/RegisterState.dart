import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/User.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  //creamos el contructor de la clase y pasamos todos las variable
  const RegisterState(
      {this.name = const BlocFormItem(error: 'Ingresa Nombre'),
      this.lastname = const BlocFormItem(error: 'Ingresa Apellido'),
      this.email = const BlocFormItem(error: 'Ingresa Email'),
      this.phone = const BlocFormItem(error: 'Ingresa Password'),
      this.password = const BlocFormItem(error: 'Confimacion Password'),
      this.confirmPassword = const BlocFormItem(error: 'Ingresa Correo'),
      this.formKey,
      this.response});

  //
  toUser() => User(
    name: name.value, 
    lastName: lastname.value, 
    email: email.value, 
    phone: phone.value, 
    password: password.value, 
  );

  //metodo q nos permite cambiar el estado de las variables
  RegisterState copyWith(
      {BlocFormItem? name,
      BlocFormItem? lastname,
      BlocFormItem? email,
      BlocFormItem? phone,
      BlocFormItem? password,
      BlocFormItem? confirmPassword,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return RegisterState(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        formKey: formKey,
        response: response);
  }

  //se inica los valores q van a  acambiar de estado
  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, lastname, email, phone, password, confirmPassword, response];
}
