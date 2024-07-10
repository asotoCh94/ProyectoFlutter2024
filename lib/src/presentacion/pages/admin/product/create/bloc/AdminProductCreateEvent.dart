import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

abstract class AdminProductCreateEvent extends Equatable {
  const AdminProductCreateEvent();
  @override
  List<Object?> get props => [];
}

//clase q inicia el formulario
class InitEventProduct extends AdminProductCreateEvent {
  final Category? category;
  const InitEventProduct({required this.category});
  @override
  List<Object?> get props => [category];
}

//clase q dispara el envio del formulario
class FormOnClickPrdt extends AdminProductCreateEvent {
  const FormOnClickPrdt();
}

//clase q resetea el formulario
class FormResertPrdt extends AdminProductCreateEvent {
  const FormResertPrdt();
}

//llamamos a los campos
class NameChangedPrdt extends AdminProductCreateEvent {
  final BlocFormItem name;
  const NameChangedPrdt({required this.name});

  @override
  List<Object?> get props => [name];
}

class DescriptionChangedPrdt extends AdminProductCreateEvent {
  final BlocFormItem description;
  const DescriptionChangedPrdt({required this.description});

  @override
  List<Object?> get props => [description];
}

class PriceChangedPrdt extends AdminProductCreateEvent {
  final BlocFormItem price;
  const PriceChangedPrdt({required this.price});

  @override
  List<Object?> get props => [price];
}

//seleccionar imagen
class PickImagePrdt extends AdminProductCreateEvent {
  final int numberFile;
  const PickImagePrdt({required this.numberFile});
}

//tomar imagen
class TakePhotoPrdt extends AdminProductCreateEvent {
  final int numberFile;
  const TakePhotoPrdt({required this.numberFile});
}
