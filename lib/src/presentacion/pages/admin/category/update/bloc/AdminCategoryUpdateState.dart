import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class AdminCategoryUpdateState extends Equatable {
  final int id;
  final BlocFormItem name;
  final BlocFormItem description;
  final File? file;
  final GlobalKey<FormState>? formkey;
  final Resource? response;

  const AdminCategoryUpdateState(
      {
      this.id=0,
      this.name = const BlocFormItem(error: "Ingrese el nombre"),
      this.description = const BlocFormItem(error: "Ingrese el description"),
      this.file,
      this.formkey,
      this.response});

  toCategory() => Category(
    id:id,
    name: name.value, 
    description: description.value
    );

  AdminCategoryUpdateState resertForm() {
    return AdminCategoryUpdateState(
      file: null
    );
  }

  AdminCategoryUpdateState copyWith(
      {
      int? id,
      BlocFormItem? name,
      BlocFormItem? description,
      File? file,
      GlobalKey<FormState>? formkey,
      Resource? response}) {
    return AdminCategoryUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        file: file ?? this.file,
        formkey: formkey,
        response: response);
  }

  @override
  List<Object?> get props => [id,name, description, file, response];
}
