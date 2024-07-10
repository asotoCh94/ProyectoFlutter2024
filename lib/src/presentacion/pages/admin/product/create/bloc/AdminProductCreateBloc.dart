import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/ProductUseCase.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class AdminProductCreateBloc
    extends Bloc<AdminProductCreateEvent, AdminProductCreateState> {
  ProductUseCase productUseCase;

  AdminProductCreateBloc(this.productUseCase)
      : super(AdminProductCreateState()) {
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
  Future<void> _onInitEvent(InitEventProduct event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(
      idCategory: event.category?.id,
      formkey: formkey
    ));
  }

  Future<void> _onFormOnClickPrdt(FormOnClickPrdt event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(response: Loading(), formkey: formkey));
    
    if(state.file1 != null && state.file2 != null){
      List<File> files = [state.file1!, state.file2!];
      Resource responce = await productUseCase.create.run(state.toProduct(), files);
      emit(state.copyWith(response: responce, formkey: formkey));
    }
    else{
      emit(state.copyWith(response: Error('Selecciona las 2 imagenes'), formkey: formkey));
    }
    
  }

  Future<void> _onFormResertPrdt(
      FormResertPrdt event, Emitter<AdminProductCreateState> emit) async {
    //state.formkey?.currentState?.reset();
    emit(state.resertForm());
  }

  Future<void> _onNameChangedPrdt(
      NameChangedPrdt event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formkey: formkey));
  }

  Future<void> _onPriceChangedPrdt(
      PriceChangedPrdt event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(
        price: BlocFormItem(
            value: event.price.value,
            error: event.price.value.isNotEmpty ? null : 'Ingresa el precio'),
        formkey: formkey));
  }

  Future<void> _onDescriptionChangedPrdt(DescriptionChangedPrdt event,
      Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(
        description: BlocFormItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'Ingresa la description'),
        formkey: formkey));
  }

  Future<void> _onPickImagePrdt(
      PickImagePrdt event, Emitter<AdminProductCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (event.numberFile == 1) {
        emit(state.copyWith(file1: File(image.path)));
      } else if (event.numberFile == 2) {
        emit(state.copyWith(file2: File(image.path)));
      }
    }
  }

  Future<void> _onTakePhotoPrdt(
      TakePhotoPrdt event, Emitter<AdminProductCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      if (event.numberFile == 1) {
        emit(state.copyWith(file1: File(image.path)));
      } else if (event.numberFile == 2) {
        emit(state.copyWith(file2: File(image.path)));
      }
    }
  }
}
