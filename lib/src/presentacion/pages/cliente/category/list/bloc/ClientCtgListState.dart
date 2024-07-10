import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

class ClientCtgListState extends Equatable {
  final Resource? response;

  const ClientCtgListState({this.response});

  ClientCtgListState copyWith({Resource? response}) {
    return ClientCtgListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
