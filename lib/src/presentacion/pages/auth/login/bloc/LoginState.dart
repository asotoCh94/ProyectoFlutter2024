import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const LoginState(
      {this.email = const BlocFormItem(error: 'Ingresa Correo'),
      this.password = const BlocFormItem(error: 'Ingresa Password'),
      this.formKey,
      this.response
    });

  LoginState copyWith(
      {BlocFormItem? email,
      BlocFormItem? password,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
      response: response
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, response];
}
