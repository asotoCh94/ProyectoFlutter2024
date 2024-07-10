import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';

class ClientProductDetailEvent extends Equatable {
  //(10)
  const ClientProductDetailEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetState extends ClientProductDetailEvent {
  const ResetState();
}

class GetProducts extends ClientProductDetailEvent {
  final Product product;
  const GetProducts({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class ClientProductDetailInitEvent extends ClientProductDetailEvent {
  const ClientProductDetailInitEvent();
}

class AddItem extends ClientProductDetailEvent {
  const AddItem();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SubtractItem extends ClientProductDetailEvent {
  const SubtractItem();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddProductToShoppingBag extends ClientProductDetailEvent {
  final Product product;
  const AddProductToShoppingBag({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}
