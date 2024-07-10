
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/home/bloc/ClientHomeEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/home/bloc/ClientHomeState.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  AuthUseCases authUseCases;

  ClientHomeBloc(this.authUseCases) : super(ClientHomeState()) {
    on<ChangeDrawerPage>(onChangeDrawerPage);
    on<ClientLogout>(onClientLogout);
  }

  Future<void> onChangeDrawerPage(
      ChangeDrawerPage event, Emitter<ClientHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  Future<void> onClientLogout(
      ClientLogout even, Emitter<ClientHomeState> emit) async {
    await authUseCases.logout.run();
  }
}
