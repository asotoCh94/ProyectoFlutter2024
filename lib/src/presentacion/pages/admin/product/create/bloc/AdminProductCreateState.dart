import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class AdminProductCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final int? idCategory;
  final File? file1;
  final File? file2;
  final GlobalKey<FormState>? formkey;
  final Resource? response;

  const AdminProductCreateState(
      {this.name = const BlocFormItem(error: "Ingrese el nombre"),
      this.description = const BlocFormItem(error: "Ingrese el description"),
      this.price = const BlocFormItem(error: "Ingrese el precio"),
      this.idCategory = 0,
      this.file1,
      this.file2,
      this.formkey,
      this.response});

  toProduct() => Product(
    name: name.value, 
    description: description.value,
    price: double.parse(price.value),
    idCategory: idCategory
  );

  AdminProductCreateState resertForm() {
    return AdminProductCreateState(
      name: const BlocFormItem(error: "Ingrese el nombre"),
      description: const BlocFormItem(error: "Ingrese el description"),
      price: const BlocFormItem(error: "Ingrese el precio"),
    );
  }

  AdminProductCreateState copyWith(
      {BlocFormItem? name,
      BlocFormItem? description,
      BlocFormItem? price,
      int? idCategory,
      File? file1,
      File? file2,
      GlobalKey<FormState>? formkey,
      Resource? response}) {
    return AdminProductCreateState(
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        idCategory: idCategory ?? this.idCategory,
        file1: file1 ?? this.file1,
        file2: file2 ?? this.file2,
        formkey: formkey,
        response: response);
  }

  @override
  List<Object?> get props => [name, description,price,idCategory, file1, file2, response];
}
