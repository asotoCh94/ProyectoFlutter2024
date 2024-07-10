import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/models/AuthResponse.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/bloc/RolesEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/bloc/RolesState.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  //para usar sus casos de uso (sesion)
  AuthUseCases authUseCases;

  RolesBloc(this.authUseCases) : super(RolesState()) {
    on<GetRolesList>(_onGetRolesList);
  }

  Future<void> _onGetRolesList(
      GetRolesList event, Emitter<RolesState> emit) async {
    AuthResponse? authResponse =
        await authUseCases.getSaveUserSessionUseCase.run();

    emit(state.copyWith(roles: authResponse?.user?.roles));
  }
}
