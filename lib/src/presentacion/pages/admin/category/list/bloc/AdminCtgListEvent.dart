import 'package:equatable/equatable.dart';

abstract class AdminCtgListEvent extends Equatable {
  const AdminCtgListEvent();

  @override
  List<Object?> get props => [];
}

class GetCategories extends AdminCtgListEvent {
  const GetCategories();
}

class DeleteCtg extends AdminCtgListEvent {
  final int id;
  const DeleteCtg({required this.id});

  @override
  List<Object?> get props => [id];
}
