import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

abstract class AdminProductUpdateEvent extends Equatable {
  const AdminProductUpdateEvent();
  @override
  List<Object?> get props => [];
}

//clase q inicia el formulario
class InitEventProduct extends AdminProductUpdateEvent {
  final Product? product;
  const InitEventProduct({required this.product});
  @override
  List<Object?> get props => [product];
}

//clase q dispara el envio del formulario
class FormOnClickPrdt extends AdminProductUpdateEvent {
  const FormOnClickPrdt();
}

//clase q resetea el formulario
class FormResertPrdt extends AdminProductUpdateEvent {
  const FormResertPrdt();
}

//llamamos a los campos
class NameChangedPrdt extends AdminProductUpdateEvent {
  final BlocFormItem name;
  const NameChangedPrdt({required this.name});

  @override
  List<Object?> get props => [name];
}

class DescriptionChangedPrdt extends AdminProductUpdateEvent {
  final BlocFormItem description;
  const DescriptionChangedPrdt({required this.description});

  @override
  List<Object?> get props => [description];
}

class PriceChangedPrdt extends AdminProductUpdateEvent {
  final BlocFormItem price;
  const PriceChangedPrdt({required this.price});

  @override
  List<Object?> get props => [price];
}

//seleccionar imagen
class PickImagePrdt extends AdminProductUpdateEvent {
  final int numberFile;
  const PickImagePrdt({required this.numberFile});
}

//tomar imagen
class TakePhotoPrdt extends AdminProductUpdateEvent {
  final int numberFile;
  const TakePhotoPrdt({required this.numberFile});
}
