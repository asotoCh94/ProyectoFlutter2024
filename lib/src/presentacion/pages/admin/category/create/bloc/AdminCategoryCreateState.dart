import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class AdminCategoryCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final File? file;
  final GlobalKey<FormState>? formkey;
  final Resource? response;

  const AdminCategoryCreateState(
      {this.name = const BlocFormItem(error: "Ingrese el nombre"),
      this.description = const BlocFormItem(error: "Ingrese el description"),
      this.file,
      this.formkey,
      this.response});

  toCategory() => Category(name: name.value, description: description.value);

  AdminCategoryCreateState resertForm() {
    return AdminCategoryCreateState(
      name: const BlocFormItem(error: "Ingrese el nombre"),
      description: const BlocFormItem(error: "Ingrese el description"),
    );
  }

  AdminCategoryCreateState copyWith(
      {BlocFormItem? name,
      BlocFormItem? description,
      File? file,
      GlobalKey<FormState>? formkey,
      Resource? response}) {
    return AdminCategoryCreateState(
        name: name ?? this.name,
        description: description ?? this.description,
        file: file ?? this.file,
        formkey: formkey,
        response: response);
  }

  @override
  List<Object?> get props => [name, description, file, response];
}
