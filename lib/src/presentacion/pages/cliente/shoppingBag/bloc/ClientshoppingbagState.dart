import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';

class ClientshoppingbagState extends Equatable {
  final List<Product> product;
  final double total;

  const ClientshoppingbagState({
    this.product = const [],
    this.total= 0
  });

  ClientshoppingbagState copyWith({
    List<Product>? product,
    double? total,
    }) {
    return ClientshoppingbagState(
      product: product ?? this.product,
      total: total ?? this.total
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [product, total];
}
