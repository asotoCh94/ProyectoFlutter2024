
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/CtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListState.dart';

class AdminCtgListBloc extends Bloc<AdminCtgListEvent, AdminCtgListState> {
  CtgUseCases ctgUseCases;
  AdminCtgListBloc(this.ctgUseCases) : super(AdminCtgListState()) {
    on<GetCategories>(_onGetCategories);
    on<DeleteCtg>(_onDeleteCtg);
  }

  Future<void> _onGetCategories(
      GetCategories event, Emitter<AdminCtgListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await ctgUseCases.getCategories.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCtg(DeleteCtg event, Emitter<AdminCtgListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await ctgUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  
  }
}
