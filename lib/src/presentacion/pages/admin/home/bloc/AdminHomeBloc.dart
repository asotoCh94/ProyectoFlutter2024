import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/home/bloc/AdmindHomeEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/home/bloc/AdmindHomeState.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {
  AuthUseCases authUseCases;

  AdminHomeBloc(this.authUseCases) : super(AdminHomeState()) {
    on<AdminChangeDrawerPage>(_onAdminChangeDrawerPage);
    on<AdminLogout>(_onAdminLogout);
  }

  Future<void> _onAdminChangeDrawerPage(
      AdminChangeDrawerPage event, Emitter<AdminHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  Future<void> _onAdminLogout(AdminLogout event, Emitter<AdminHomeState> emit) async {
    await authUseCases.logout.run();
  }
}
