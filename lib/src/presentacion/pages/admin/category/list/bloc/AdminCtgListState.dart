import 'package:equatable/equatable.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

class AdminCtgListState extends Equatable {
  final Resource? response;

  const AdminCtgListState({this.response});

  AdminCtgListState copyWith({Resource? response}) {
    return AdminCtgListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
