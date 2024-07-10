import 'package:equatable/equatable.dart';

abstract class ClientCtgListEvent extends Equatable {
  const ClientCtgListEvent();

  @override
  List<Object?> get props => [];
}

class GetCategories extends ClientCtgListEvent {
  const GetCategories();
}

