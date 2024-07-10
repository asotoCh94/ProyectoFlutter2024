import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/ProductUseCase.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListState.dart';

class AdminProductListBloc
    extends Bloc<AdminProductListEvent, AdminProductListState> {
  ProductUseCase productUseCase;

  AdminProductListBloc(this.productUseCase) : super(AdminProductListState()) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
    on<DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onGetProductsByCategory(
      GetProductsByCategory event, Emitter<AdminProductListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await productUseCase.getProductUC.run(event.idCategory);
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteProduct(DeleteProduct event, Emitter<AdminProductListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await productUseCase.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
