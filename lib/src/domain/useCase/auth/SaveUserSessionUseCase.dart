import 'package:proyecto_flutter/src/domain/models/AuthResponse.dart';
import 'package:proyecto_flutter/src/domain/repository/AuthRepository.dart';

class SaveUserSessionUseCase {
  //injectamos repositoryo
  AuthRepository authRepository;
  //llamamos al construcctor y injectamos repository
  SaveUserSessionUseCase(this.authRepository);

  run(AuthResponse authResponse) => authRepository.saveUserSession(authResponse);
}
