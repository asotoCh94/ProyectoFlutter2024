import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/User.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class ProfileUpdateState extends Equatable {
  final int id;
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem phone;
  final File? image;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const ProfileUpdateState(
      {this.id = 0,
      this.name = const BlocFormItem(error: 'Ingresa el nombre'),
      this.lastName = const BlocFormItem(error: 'Ingresa el apellido'),
      this.phone = const BlocFormItem(error: 'Ingresa el telefono'),
      this.image,
      this.formKey,
      this.response});

  toUser() => User(
    id: id,
    name: name.value, 
    lastName: lastName.value, 
    phone: phone.value
  );

  ProfileUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? phone,
    File? image,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }) {
    return ProfileUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        image: image ?? this.image,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props => [
    id, 
    name, 
    lastName, 
    phone, 
    image, 
    response
  ];
}
