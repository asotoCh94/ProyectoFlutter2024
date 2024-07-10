import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/models/AuthResponse.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/bloc/ProfileInfoState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/bloc/ProfitInfoEvent.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  AuthUseCases authUseCases;

  ProfileInfoBloc(this.authUseCases) : super(ProfileInfoState()) {
    on<ProfileInfiGetUser>(_onGetUser);
  }

  Future<void> _onGetUser(
      ProfileInfiGetUser event, Emitter<ProfileInfoState> emit) async {
    AuthResponse authResponse =await authUseCases.getSaveUserSessionUseCase.run();
    emit(
      state.copyWith(user: authResponse.user)
    );
  }
}
