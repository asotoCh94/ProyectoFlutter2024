import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/ProductUseCase.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/update/bloc/AdminProductUpdateState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class AdminProductUpdateBloc
    extends Bloc<AdminProductUpdateEvent, AdminProductUpdateState> {
  ProductUseCase productUseCase;

  AdminProductUpdateBloc(this.productUseCase)
      : super(AdminProductUpdateState()) {
    on<InitEventProduct>(_onInitEvent);
    on<FormOnClickPrdt>(_onFormOnClickPrdt);
    on<FormResertPrdt>(_onFormResertPrdt);

    on<NameChangedPrdt>(_onNameChangedPrdt);
    on<DescriptionChangedPrdt>(_onDescriptionChangedPrdt);
    on<PriceChangedPrdt>(_onPriceChangedPrdt);
    on<PickImagePrdt>(_onPickImagePrdt);
    on<TakePhotoPrdt>(_onTakePhotoPrdt);
  }

  final formkey = GlobalKey<FormState>();
  final List<int> imageToUpdate = <int>[];

  Future<void> _onInitEvent(
      InitEventProduct event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        //pre cargamos la informacion al entrar al formulario
        id: event.product?.id,
        idCategory: event.product?.idCategory,
        name: BlocFormItem(value: event.product?.name ?? ''),
        description: BlocFormItem(value: event.product?.description ?? ''),
        price: BlocFormItem(value: event.product?.price.toString() ?? ''),
        formkey: formkey));
  }

  Future<void> _onFormOnClickPrdt(FormOnClickPrdt event, Emitter<AdminProductUpdateState> emit) async {
    imageToUpdate.clear();
    emit(state.copyWith(response: Loading(), formkey: formkey));
    List<File> files = [];
    if (state.file1 != null) {
      imageToUpdate.add(0);
      files.add(state.file1!);
    }
    if (state.file2 != null) {
      imageToUpdate.add(1);
      files.add(state.file2!);
    }
    Resource responce = await productUseCase.update.run(
      state.id!,
      state.toProduct(),
      files.isNotEmpty ? files : null,
      imageToUpdate.isNotEmpty ? imageToUpdate : null,
    );
    emit(state.copyWith(response: responce, formkey: formkey));
  }

  Future<void> _onFormResertPrdt(
      FormResertPrdt event, Emitter<AdminProductUpdateState> emit) async {
    //state.formkey?.currentState?.reset();
    emit(state.resertForm());
  }

  Future<void> _onNameChangedPrdt(
      NameChangedPrdt event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formkey: formkey));
  }

  Future<void> _onPriceChangedPrdt(
      PriceChangedPrdt event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        price: BlocFormItem(
            value: event.price.value,
            error: event.price.value.isNotEmpty ? null : 'Ingresa el precio'),
        formkey: formkey));
  }

  Future<void> _onDescriptionChangedPrdt(DescriptionChangedPrdt event,
      Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        description: BlocFormItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'Ingresa la description'),
        formkey: formkey));
  }

  Future<void> _onPickImagePrdt(
      PickImagePrdt event, Emitter<AdminProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (event.numberFile == 1) {
        emit(state.copyWith(file1: File(image.path), formkey: formkey));
      } else if (event.numberFile == 2) {
        emit(state.copyWith(file2: File(image.path), formkey: formkey));
      }
    }
  }

  Future<void> _onTakePhotoPrdt(
      TakePhotoPrdt event, Emitter<AdminProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      if (event.numberFile == 1) {
        emit(state.copyWith(file1: File(image.path), formkey: formkey));
      } else if (event.numberFile == 2) {
        emit(state.copyWith(file2: File(image.path), formkey: formkey));
      }
    }
  }
}
