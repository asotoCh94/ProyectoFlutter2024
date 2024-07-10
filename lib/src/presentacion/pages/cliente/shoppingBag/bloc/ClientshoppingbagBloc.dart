import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/ShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagState.dart';

class ClientshoppingbagBloc
    extends Bloc<ClientshoppingbagEvent, ClientshoppingbagState> {
  ShoppingBagUseCase shoppingBagUseCase;

  ClientshoppingbagBloc(this.shoppingBagUseCase)
      : super(ClientshoppingbagState()) {
    on<GetshoppingBag>(_onGetshoppingBag);
    on<AddItem>(_onAddItem);
    on<SubtractdItem>(_onSubtractdItem);
    on<RemoveItem>(_onRemoveItem);
    on<GetTotal>(_onGetTotal);
  }

  Future<void> _onGetshoppingBag(
      GetshoppingBag event, Emitter<ClientshoppingbagState> emit) async {
    List<Product> products = await shoppingBagUseCase.getProducts.run();
    emit(state.copyWith(product: products));
    add(GetTotal());
  }

  Future<void> _onAddItem(
      AddItem event, Emitter<ClientshoppingbagState> emit) async {
    // int index = state.product.indexWhere((p) => p.id == event.product.id);
    // state.product[index].quantity = state.product[index].quantity! + 1;
    // await shoppingBagUseCase.add.run(state.product[index]);
    event.product.quantity = event.product.quantity! + 1;
    await shoppingBagUseCase.add.run(event.product);
    add(GetshoppingBag()); //trae nuevamente la data
  }

  Future<void> _onSubtractdItem(
      SubtractdItem event, Emitter<ClientshoppingbagState> emit) async {
    // int index = state.product.indexWhere((p) => p.id == event.product.id);
    // if (state.product[index].quantity! > 1) {
    //   state.product[index].quantity = state.product[index].quantity! - 1;
    //   await shoppingBagUseCase.add.run(state.product[index]);
    //   add(GetshoppingBag());
    // }
    if (event.product.quantity! > 1) {
      event.product.quantity = event.product.quantity! - 1;
      await shoppingBagUseCase.add.run(event.product);
      add(GetshoppingBag());
    }
  }

  Future<void> _onRemoveItem(
      RemoveItem event, Emitter<ClientshoppingbagState> emit) async {
    await shoppingBagUseCase.deleteItem.run(event.product);
    add(GetshoppingBag());
  }

  Future<void> _onGetTotal(
      GetTotal event, Emitter<ClientshoppingbagState> emit) async {
    double total = await shoppingBagUseCase.getTotal.run();
    emit(state.copyWith(total: total));
  }
}
