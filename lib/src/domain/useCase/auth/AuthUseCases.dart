import 'package:proyecto_flutter/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/loginUseCase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;

  AuthUseCases({
    required this.login, 
    required this.register
  });
}
