import 'package:proyecto_flutter/src/domain/models/AuthResponse.dart';
import 'package:proyecto_flutter/src/domain/models/User.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  //session
  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
  Future<void> saveUserSession(AuthResponse authResponse);

  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
}
