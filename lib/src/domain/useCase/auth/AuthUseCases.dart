import 'package:proyecto_flutter/src/domain/useCase/auth/GetSaveUserSessionUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/SaveUserSessionUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/loginUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/logoutUseCase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  SaveUserSessionUseCase saveUserSessionUseCase;
  GetSaveUserSessionUseCase getSaveUserSessionUseCase;
  LogoutUseCase logout;

  AuthUseCases({
    required this.login,
    required this.register,
    required this.saveUserSessionUseCase,
    required this.getSaveUserSessionUseCase,
    required this.logout,
  });
}
