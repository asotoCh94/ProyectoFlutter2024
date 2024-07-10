import 'package:proyecto_flutter/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {
  AuthRepository repository;
  LogoutUseCase(this.repository);

  run() => repository.logout();
}
