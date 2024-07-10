import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class AdminProductUpdateState extends Equatable {
  final int? id;
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final List<int>? imageToUpdate;
  final int? idCategory;
  final File? file1;
  final File? file2;
  final GlobalKey<FormState>? formkey;
  final Resource? response;

  const AdminProductUpdateState(
      {this.id = 0,
      this.name = const BlocFormItem(error: "Ingrese el nombre"),
      this.description = const BlocFormItem(error: "Ingrese el description"),
      this.price = const BlocFormItem(error: "Ingrese el precio"),
      this.imageToUpdate,
      this.idCategory = 0,
      this.file1,
      this.file2,
      this.formkey,
      this.response});

  toProduct() => Product(
      id: id,
      name: name.value,
      description: description.value,
      price: double.parse(price.value),
      idCategory: idCategory);

  AdminProductUpdateState resertForm() {
    return AdminProductUpdateState(
      file1: null,
      file2: null,
    );
  }

  AdminProductUpdateState copyWith(
      {int? id,
      BlocFormItem? name,
      BlocFormItem? description,
      BlocFormItem? price,
      int? idCategory,
      File? file1,
      File? file2,
      List<int>? imageToUpdate,
      GlobalKey<FormState>? formkey,
      Resource? response
      
    }) {
    return AdminProductUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        idCategory: idCategory ?? this.idCategory,
        file1: file1 ?? this.file1,
        file2: file2 ?? this.file2,
        imageToUpdate: imageToUpdate ?? this.imageToUpdate,
        formkey: formkey,
        response: response);
  }

  @override
  List<Object?> get props =>
      [name, description, price, idCategory, file1, file2, response];
}
