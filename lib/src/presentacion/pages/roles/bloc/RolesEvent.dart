import 'package:equatable/equatable.dart';

abstract class RolesEvent extends Equatable {
  const RolesEvent();

  @override
  List<Object?> get props => [];
}

class RolesInitEvent extends RolesEvent {
  const RolesInitEvent();
}

//traemos la lista de roles
class GetRolesList extends RolesEvent {
  const GetRolesList();
}
