import 'package:injectable/injectable.dart';
import 'package:proyecto_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:proyecto_flutter/src/data/dataSource/remote/service/CategoryService.dart';
import 'package:proyecto_flutter/src/data/dataSource/remote/service/ProductService.dart';
import 'package:proyecto_flutter/src/data/dataSource/remote/service/UserService.dart';
import 'package:proyecto_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:proyecto_flutter/src/data/dataSource/remote/service/AuthService.dart';
import 'package:proyecto_flutter/src/data/repository/CategoryRepositoryImpl.dart';
import 'package:proyecto_flutter/src/data/repository/ProductRepositoryImpl.dart';
import 'package:proyecto_flutter/src/data/repository/ShoppingBagRepositoryImpl.dart';
import 'package:proyecto_flutter/src/data/repository/UserRepositoryImpl.dart';
import 'package:proyecto_flutter/src/domain/repository/AuthRepository.dart';
import 'package:proyecto_flutter/src/domain/repository/CategoryRepository.dart';
import 'package:proyecto_flutter/src/domain/repository/ProductRepository.dart';
import 'package:proyecto_flutter/src/domain/repository/ShoppingBagRepository.dart';
import 'package:proyecto_flutter/src/domain/repository/UserRepository.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/GetSaveUserSessionUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/SaveUserSessionUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/loginUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/logoutUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/CreateCtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/CtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/DeleteCtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/GetCtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/UpdateCtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/CreateProductUC.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/DeleteProductUC.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/GetProductUC.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/ProductUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/UpdateProductUC.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/AddShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/GetProductShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/ShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/users/UpdateUserUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/users/UsersUseCases.dart';

import '../domain/models/AuthResponse.dart';

@module
abstract class AppModule {
  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  Future<String> get token async {
    String token = "";
    final userSesion = await sharedPref.read('user');
    if (userSesion != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSesion);
      token = authResponse.token!;
    }
    return token;
  }

  //********************************************************************************************* */

  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharedPref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSessionUseCase: SaveUserSessionUseCase(authRepository),
        getSaveUserSessionUseCase: GetSaveUserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository),
      );
  //********************************************************************************************* */

  @injectable
  UserService get userService => UserService(sharedPref);

  @injectable
  UserRepository get userRepository => UserRepositoryImpl(userService);

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(updateUserUseCase: UpdateUserUseCase(userRepository));

  //********************************************************************************************* */
  @injectable
  CategoryService get categoryService => CategoryService(token);

  @injectable
  CategoryRepository get categoryRepository =>
      CategoryRepositoryImpl(categoryService);

  @injectable
  CtgUseCases get ctgUseCases => CtgUseCases(
        create: CreateCtgUseCase(categoryRepository),
        getCategories: GetCtgUseCase(categoryRepository),
        update: UpdateCtgUseCase(categoryRepository),
        delete: DeleteCtgUseCase(categoryRepository),
      );

  //********************************************************************************************* */
  @injectable
  ProductSevice get productSevice => ProductSevice(token);

  @injectable
  ProductRepository get productRepository =>
      ProductRepositoryImpl(productSevice);

  @injectable
  ProductUseCase get productUseCase => ProductUseCase(
      create: CreateProductUC(productRepository),
      getProductUC: GetProductUC(productRepository),
      update: UpdateProductUC(productRepository),
      delete: DeleteProductUC(productRepository));

  //********************************************************************************************* */
  //(8)
  @injectable
  ShoppingBagRepository get shoppingBagRepository =>
      ShoppingBagRepositoryImpl(sharedPref);

  @injectable
  ShoppingBagUseCase get shoppingBagUseCase => ShoppingBagUseCase(
      add: AddShoppingBagUseCase(shoppingBagRepository),
      getProducts: GetProductShoppingBagUseCase(shoppingBagRepository),
      deleteItem: DeleteItemShoppingBagUseCase(shoppingBagRepository),
      deleteShopping: DeleteShoppingBagUseCase(shoppingBagRepository), 
      getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository));
}
