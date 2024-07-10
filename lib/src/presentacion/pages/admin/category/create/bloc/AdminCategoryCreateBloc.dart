import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/CtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class AdminCategoryCreateBloc
    extends Bloc<AdminCategoryCreateEvent, AdminCategoryCreateState> {
  CtgUseCases ctgUseCases;

  AdminCategoryCreateBloc(this.ctgUseCases)
      : super(AdminCategoryCreateState()) {
    on<InitEventCtg>(_onInitEvent);
    on<FormOnClickCtg>(_onFormOnClickCtg);
    on<FormResertCtg>(_onFormResertCtg);

    on<NameChangedCtg>(_onNameChangedCtg);
    on<DescriptionChangedCtg>(_onDescriptionChangedCtg);
    on<PickImageCtg>(_onPickImageCtg);
    on<TakePhotoCtg>(_onTakePhotoCtg);
  }

  final formkey = GlobalKey<FormState>();
  Future<void> _onInitEvent(
      InitEventCtg event, Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(formkey: formkey));
  }

  Future<void> _onFormOnClickCtg(
      FormOnClickCtg event, Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(response: Loading(), formkey: formkey));
    Resource responce =
        await ctgUseCases.create.run(state.toCategory(), state.file!);
    emit(state.copyWith(response: responce, formkey: formkey));
  }

  Future<void> _onFormResertCtg(
      FormResertCtg event, Emitter<AdminCategoryCreateState> emit) async {
    //state.formkey?.currentState?.reset();
    emit(state.resertForm());
    
  }

  Future<void> _onNameChangedCtg(
      NameChangedCtg event, Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formkey: formkey));
  }

  Future<void> _onDescriptionChangedCtg(DescriptionChangedCtg event,
      Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(
        description: BlocFormItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'Ingresa la description'),
        formkey: formkey));
  }

  Future<void> _onPickImageCtg(
      PickImageCtg event, Emitter<AdminCategoryCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path)));
    }
  }

  Future<void> _onTakePhotoCtg(
      TakePhotoCtg event, Emitter<AdminCategoryCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path)));
    }
  }
}
