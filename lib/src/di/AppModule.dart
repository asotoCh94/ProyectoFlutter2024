import 'package:injectable/injectable.dart';
import 'package:proyecto_flutter/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:proyecto_flutter/src/data/dataSource/remote/service/AuthService.dart';
import 'package:proyecto_flutter/src/domain/repository/AuthRepository.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/loginUseCase.dart';

@module
abstract class AppModule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);

  @injectable
  AuthUseCases get authUseCases =>
      AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
      );
}
