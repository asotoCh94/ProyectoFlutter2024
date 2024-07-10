import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/ProductUseCase.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/bloc/ClientProductListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/bloc/ClientProductListState.dart';

class ClientProductListBloc
    extends Bloc<ClientProductListEvent, ClientProductListState> {
  ProductUseCase productUseCase;

  ClientProductListBloc(this.productUseCase) : super(ClientProductListState()) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
  }

  Future<void> _onGetProductsByCategory(
      GetProductsByCategory event, Emitter<ClientProductListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await productUseCase.getProductUC.run(event.idCategory);
    emit(state.copyWith(response: response));
  }


}
