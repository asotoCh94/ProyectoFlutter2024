import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/ShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/detail/bloc/ClientProductDetailState.dart';

class ClientProductDetailBloc
//(11)
    extends Bloc<ClientProductDetailEvent, ClientProductDetailState> {
  ShoppingBagUseCase shoppingBagUseCase;

  ClientProductDetailBloc(this.shoppingBagUseCase)
      : super(ClientProductDetailState()) {
    on<GetProducts>(_onGetProducts);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<AddProductToShoppingBag>(_onAddProductToShoppingBag);
    on<ResetState>(_onResetState);
  }

  Future<void> _onGetProducts(
      GetProducts event, Emitter<ClientProductDetailState> emit) async {
    List<Product> product = await shoppingBagUseCase.getProducts.run();
    int index = product.indexWhere((p) => p.id == event.product.id);
    if (index != -1) {
      //producto ya agregado a la bolsa
      //cambiamos el estado asignando el valor ya guardado
      emit(state.copyWith(quantity: product[index].quantity));
    }

    product.forEach((p) {
      print('PRoducts ${p.toJson()}');
    });
  }

  Future<void> _onAddItem(
      AddItem event, Emitter<ClientProductDetailState> emit) async {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  Future<void> _onSubtractItem(
      SubtractItem event, Emitter<ClientProductDetailState> emit) async {
    if (state.quantity >= 1) emit(state.copyWith(quantity: state.quantity - 1));
  }

  Future<void> _onAddProductToShoppingBag(AddProductToShoppingBag event,
      Emitter<ClientProductDetailState> emit) async {
    event.product.quantity = state.quantity;
    shoppingBagUseCase.add.run(event.product);
  }

  Future<void> _onResetState(
      ResetState event, Emitter<ClientProductDetailState> emit) async {
    emit(state.copyWith(quantity: 0));
  }
}
