import 'dart:io';

import 'package:proyecto_flutter/src/data/dataSource/remote/service/UserService.dart';
import 'package:proyecto_flutter/src/domain/models/User.dart';
import 'package:proyecto_flutter/src/domain/repository/UserRepository.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

class UserRepositoryImpl implements UserRepository {
  UserService userService;
  UserRepositoryImpl(this.userService);

  @override
  Future<Resource<User>> update(int id, User user, File? image) {
    if (image == null) {
      return userService.update(id, user);
    } else
      return userService.updateImage(id, user, image);
  }
}
