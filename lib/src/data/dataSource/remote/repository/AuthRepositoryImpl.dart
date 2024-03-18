import 'package:proyecto_flutter/src/data/dataSource/remote/service/AuthService.dart';
import 'package:proyecto_flutter/src/domain/models/AuthResponse.dart';
import 'package:proyecto_flutter/src/domain/models/User.dart';
import 'package:proyecto_flutter/src/domain/repository/AuthRepository.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

//@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;
  AuthRepositoryImpl(this.authService);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    // TODO: implement login
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    // TODO: implement register
    return authService.register(user);
  }
}
