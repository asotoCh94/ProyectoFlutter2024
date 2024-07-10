import 'package:equatable/equatable.dart';

class ClientProductDetailState extends Equatable {
  //(9)
  final int quantity;

  ClientProductDetailState({this.quantity = 0});

  ClientProductDetailState copyWith({int? quantity}) {
    return ClientProductDetailState(quantity: quantity ?? this.quantity);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [quantity];
}
