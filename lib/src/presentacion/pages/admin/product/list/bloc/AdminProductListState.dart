import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

class AdminProductListState extends Equatable {
  final Resource? response;

  const AdminProductListState({this.response});
  // copyWith para cambiar el estado de las variabels
  AdminProductListState copyWith({Resource? response}) {
    return AdminProductListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];

}
