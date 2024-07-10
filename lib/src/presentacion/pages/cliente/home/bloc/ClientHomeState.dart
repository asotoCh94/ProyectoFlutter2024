import 'package:equatable/equatable.dart';

class ClientHomeState extends Equatable {
  final int pageIndex;
  //INDICAMOS Q SOLO EL INDEX VA A CAMBIAR DE ESTADO
  const ClientHomeState({this.pageIndex = 0});

  ClientHomeState copyWith({int? pageIndex}) {
    return ClientHomeState(pageIndex: pageIndex ?? this.pageIndex );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [pageIndex];
}
