import 'package:equatable/equatable.dart';

abstract class ClientHomeEvent extends Equatable {
  const ClientHomeEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//agregamos los eventos, para disparar cada vez q cambia de opcion
class ChangeDrawerPage extends ClientHomeEvent {
  final int pageIndex;
  const ChangeDrawerPage({required this.pageIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [pageIndex];
}

//cerrar sesison
class ClientLogout extends ClientHomeEvent {
  const ClientLogout();
}
