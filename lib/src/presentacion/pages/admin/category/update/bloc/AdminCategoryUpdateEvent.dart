import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';

abstract class AdminCategoryUpdateEvent extends Equatable {
  const AdminCategoryUpdateEvent();
  @override
  List<Object?> get props => [];
}

//clase q inicia el formulario
class InitEventCtg extends AdminCategoryUpdateEvent {
  final Category? category;
  const InitEventCtg({required this.category});
  @override
  List<Object?> get props => [category];
}

//clase q dispara el envio del formulario
class FormOnClickCtg extends AdminCategoryUpdateEvent {
  const FormOnClickCtg();
}

//clase q resetea el formulario
class FormResertCtg extends AdminCategoryUpdateEvent {
  const FormResertCtg();
}

//llamamos a los campos
class NameChangedCtg extends AdminCategoryUpdateEvent {
  final BlocFormItem name;
  const NameChangedCtg({required this.name});

  @override
  List<Object?> get props => [name];
}

class DescriptionChangedCtg extends AdminCategoryUpdateEvent {
  final BlocFormItem description;
  const DescriptionChangedCtg({required this.description});

  @override
  List<Object?> get props => [description];
}

//seleccionar imagen
class PickImageCtg extends AdminCategoryUpdateEvent {
  const PickImageCtg();
}

//tomar imagen
class TakePhotoCtg extends AdminCategoryUpdateEvent {
  const TakePhotoCtg();
}
