
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/CtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/category/list/bloc/ClientCtgListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/category/list/bloc/ClientCtgListState.dart';

class ClientCtgListBloc extends Bloc<ClientCtgListEvent, ClientCtgListState> {
  CtgUseCases ctgUseCases;
  ClientCtgListBloc(this.ctgUseCases) : super(ClientCtgListState()) {
    on<GetCategories>(_onGetCategories);
  }

  Future<void> _onGetCategories(
      GetCategories event, Emitter<ClientCtgListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await ctgUseCases.getCategories.run();
    emit(state.copyWith(response: response));
  }

}
