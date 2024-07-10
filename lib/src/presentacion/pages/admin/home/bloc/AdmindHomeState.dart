import 'package:equatable/equatable.dart';

class AdminHomeState extends Equatable {
  //variable q va a cambiar de estado
  final int pageIndex;

  const AdminHomeState({this.pageIndex = 0});

  AdminHomeState copyWith({
    int? pageIndex,
  }) {
    return AdminHomeState(pageIndex: pageIndex ?? this.pageIndex);
  }

  @override
  List<Object?> get props => [pageIndex];
}
