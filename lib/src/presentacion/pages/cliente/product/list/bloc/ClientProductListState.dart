import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

class ClientProductListState extends Equatable {
  final Resource? response;

  const ClientProductListState({this.response});
  // copyWith para cambiar el estado de las variabels
  ClientProductListState copyWith({Resource? response}) {
    return ClientProductListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];

}
