import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

abstract class AdminCategoryCreateEvent extends Equatable {
  const AdminCategoryCreateEvent();
  @override
  List<Object?> get props => [];
}

//clase q inicia el formulario
class InitEventCtg extends AdminCategoryCreateEvent {
  const InitEventCtg();
  @override
  List<Object?> get props => [];
}

//clase q dispara el envio del formulario
class FormOnClickCtg extends AdminCategoryCreateEvent {
  const FormOnClickCtg();
}

//clase q resetea el formulario
class FormResertCtg extends AdminCategoryCreateEvent {
  const FormResertCtg();
}

//llamamos a los campos
class NameChangedCtg extends AdminCategoryCreateEvent {
  final BlocFormItem name;
  const NameChangedCtg({required this.name});

  @override
  List<Object?> get props => [name];
}

class DescriptionChangedCtg extends AdminCategoryCreateEvent {
  final BlocFormItem description;
  const DescriptionChangedCtg({required this.description});

  @override
  List<Object?> get props => [description];
}

//seleccionar imagen
class PickImageCtg extends AdminCategoryCreateEvent {
  const PickImageCtg();
}

//tomar imagen
class TakePhotoCtg extends AdminCategoryCreateEvent {
  const TakePhotoCtg();
}
