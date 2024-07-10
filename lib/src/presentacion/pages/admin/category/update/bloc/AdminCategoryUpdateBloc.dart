import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/CtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/update/bloc/AdminCategoryUpdateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/update/bloc/AdminCategoryUpdateState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class AdminCategoryUpdateBloc
    extends Bloc<AdminCategoryUpdateEvent, AdminCategoryUpdateState> {
  CtgUseCases ctgUseCases;

  AdminCategoryUpdateBloc(this.ctgUseCases)
      : super(AdminCategoryUpdateState()) {
    on<InitEventCtg>(_onInitEvent);
    on<FormOnClickCtg>(_onFormOnClickCtg);

    on<NameChangedCtg>(_onNameChangedCtg);
    on<DescriptionChangedCtg>(_onDescriptionChangedCtg);
    on<PickImageCtg>(_onPickImageCtg);
    on<TakePhotoCtg>(_onTakePhotoCtg);
    on<FormResertCtg>(_onFormResertCtg);
  }

  final formkey = GlobalKey<FormState>();
  Future<void> _onInitEvent(
      InitEventCtg event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.copyWith(
        id: event.category?.id,
        name: BlocFormItem(value: event.category?.name ?? ''),
        description: BlocFormItem(value: event.category?.description ?? ''),
        formkey: formkey));
  }

  Future<void> _onFormOnClickCtg(
      FormOnClickCtg event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.copyWith(response: Loading(), formkey: formkey));
    Resource responce =
        await ctgUseCases.update.run(state.id, state.toCategory(), state.file);
    emit(state.copyWith(response: responce, formkey: formkey));
  }

  Future<void> _onFormResertCtg(FormResertCtg event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.resertForm());
  }

  Future<void> _onNameChangedCtg(
      NameChangedCtg event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formkey: formkey));
  }

  Future<void> _onDescriptionChangedCtg(DescriptionChangedCtg event,
      Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.copyWith(
        description: BlocFormItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'Ingresa la description'),
        formkey: formkey));
  }

  Future<void> _onPickImageCtg(
      PickImageCtg event, Emitter<AdminCategoryUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path)));
    }
  }

  Future<void> _onTakePhotoCtg(
      TakePhotoCtg event, Emitter<AdminCategoryUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path)));
    }
  }
}
