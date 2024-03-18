import 'package:proyecto_flutter/src/domain/repository/AuthRepository.dart';


class LoginUseCase {
  AuthRepository repository;
  LoginUseCase(this.repository);

  login(String email, String password) => repository.login(email, password);
}
