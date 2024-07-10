import 'dart:io';

import 'package:proyecto_flutter/src/domain/models/User.dart';
import 'package:proyecto_flutter/src/domain/repository/UserRepository.dart';

class UpdateUserUseCase {
  //injectamos
  UserRepository userRepository;
  //llamamos al construcctor
  UpdateUserUseCase(this.userRepository);

  run(int id, User user, File? image) => userRepository.update(id, user, image);
}
