import 'dart:io';

import 'package:proyecto_flutter/src/domain/models/User.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

abstract class UserRepository {
  Future<Resource<User>> update(int id, User user, File? image);
}
