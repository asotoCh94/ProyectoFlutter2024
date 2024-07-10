import 'package:proyecto_flutter/src/domain/repository/AuthRepository.dart';

class GetSaveUserSessionUseCase {
  //injectamos repositoryo
  AuthRepository authRepository;
  //llamamos al construcctor y injectamos repository
  GetSaveUserSessionUseCase(this.authRepository);

  run() => authRepository.getUserSession();
}
