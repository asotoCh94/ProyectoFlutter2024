import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';

abstract class ClientshoppingbagEvent extends Equatable {
  const ClientshoppingbagEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetshoppingBag extends ClientshoppingbagEvent {
  const GetshoppingBag();
}

class AddItem extends ClientshoppingbagEvent {
  final Product product;
  const AddItem({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class SubtractdItem extends ClientshoppingbagEvent {
  final Product product;
  const SubtractdItem({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class RemoveItem extends ClientshoppingbagEvent {
  final Product product;
  const RemoveItem({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class GetTotal extends ClientshoppingbagEvent {
  const GetTotal();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
