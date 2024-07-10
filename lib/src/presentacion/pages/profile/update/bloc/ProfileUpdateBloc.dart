import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_flutter/src/domain/models/AuthResponse.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/domain/useCase/users/UsersUseCases.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  UsersUseCases usersUseCases;
  AuthUseCases authUseCases;
  ProfileUpdateBloc(this.usersUseCases, this.authUseCases)
      : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>(_onInitEvent);
    on<ProfileUpdateNameChanged>(_onNameChanged);
    on<ProfileUpdateLastNameChanged>(_onLastNameChanged);
    on<ProfileUpdatePhoneChanged>(_onPhoneChanged);
    on<ProfileUpdatePickImage>(_onPickImage);
    on<ProfileUpdateTakePhoto>(_onTakePhoto);
    on<ProfileUpdateFormSubmit>(_onFormSubmit);
    on<ProfileUpdateUserSesion>(_onUpdateUserSesion);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(
      ProfileUpdateInitEvent event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
      id: event.user?.id,
      name: BlocFormItem(value: event.user?.name ?? ''),
      lastName: BlocFormItem(value: event.user?.lastName ?? ''),
      phone: BlocFormItem(value: event.user?.phone ?? ''),
      formKey: formKey,
    ));
  }

  Future<void> _onUpdateUserSesion(ProfileUpdateUserSesion event, Emitter<ProfileUpdateState> emit) async {
    AuthResponse authResponse =await authUseCases.getSaveUserSessionUseCase.run();
    authResponse.user?.name = event.user.name;
    authResponse.user?.lastName = event.user.lastName;
    authResponse.user?.phone = event.user.phone;
    authResponse.user?.image = event.user.image;
    await authUseCases.saveUserSessionUseCase.run(authResponse);
  }

  Future<void> _onFormSubmit(ProfileUpdateFormSubmit event, Emitter<ProfileUpdateState> emit) async {
    emit(
      state.copyWith(
        response: Loading(), 
        formKey: formKey
    ));
    Resource response = await usersUseCases.updateUserUseCase.run(state.id, state.toUser(), state.image);
    emit(
      state.copyWith(
        response: response, 
        formKey: formKey
      ));
  }

  Future<void> _onTakePhoto(ProfileUpdateTakePhoto event, Emitter<ProfileUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: File(image.path)));
    }
  }

  Future<void> _onPickImage(
      ProfileUpdatePickImage event, Emitter<ProfileUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: File(image.path)));
    }
  }

  Future<void> _onNameChanged(
      ProfileUpdateNameChanged event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onLastNameChanged(ProfileUpdateLastNameChanged event,
      Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        lastName: BlocFormItem(
            value: event.lastName.value,
            error:
                event.lastName.value.isNotEmpty ? null : 'Ingresa el apellido'),
        formKey: formKey));
  }

  Future<void> _onPhoneChanged(
      ProfileUpdatePhoneChanged event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isNotEmpty ? null : 'Ingresa el telefono'),
        formKey: formKey));
  }
}
