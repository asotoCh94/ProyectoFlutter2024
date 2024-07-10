// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:proyecto_flutter/src/data/dataSource/local/SharedPref.dart'
    as _i12;
import 'package:proyecto_flutter/src/data/dataSource/remote/service/AuthService.dart'
    as _i4;
import 'package:proyecto_flutter/src/data/dataSource/remote/service/CategoryService.dart'
    as _i7;
import 'package:proyecto_flutter/src/data/dataSource/remote/service/ProductService.dart'
    as _i10;
import 'package:proyecto_flutter/src/data/dataSource/remote/service/UserService.dart'
    as _i16;
import 'package:proyecto_flutter/src/di/AppModule.dart' as _i18;
import 'package:proyecto_flutter/src/domain/repository/AuthRepository.dart'
    as _i3;
import 'package:proyecto_flutter/src/domain/repository/CategoryRepository.dart'
    as _i6;
import 'package:proyecto_flutter/src/domain/repository/ProductRepository.dart'
    as _i9;
import 'package:proyecto_flutter/src/domain/repository/ShoppingBagRepository.dart'
    as _i13;
import 'package:proyecto_flutter/src/domain/repository/UserRepository.dart'
    as _i15;
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart'
    as _i5;
import 'package:proyecto_flutter/src/domain/useCase/categories/CtgUseCase.dart'
    as _i8;
import 'package:proyecto_flutter/src/domain/useCase/product/ProductUseCase.dart'
    as _i11;
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/ShoppingBagUseCase.dart'
    as _i14;
import 'package:proyecto_flutter/src/domain/useCase/users/UsersUseCases.dart'
    as _i17;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i4.AuthService>(() => appModule.authService);
    gh.factory<_i5.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i6.CategoryRepository>(() => appModule.categoryRepository);
    gh.factory<_i7.CategoryService>(() => appModule.categoryService);
    gh.factory<_i8.CtgUseCases>(() => appModule.ctgUseCases);
    gh.factory<_i9.ProductRepository>(() => appModule.productRepository);
    gh.factory<_i10.ProductSevice>(() => appModule.productSevice);
    gh.factory<_i11.ProductUseCase>(() => appModule.productUseCase);
    gh.factory<_i12.SharedPref>(() => appModule.sharedPref);
    gh.factory<_i13.ShoppingBagRepository>(
        () => appModule.shoppingBagRepository);
    gh.factory<_i14.ShoppingBagUseCase>(() => appModule.shoppingBagUseCase);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i15.UserRepository>(() => appModule.userRepository);
    gh.factory<_i16.UserService>(() => appModule.userService);
    gh.factory<_i17.UsersUseCases>(() => appModule.usersUseCases);
    return this;
  }
}

class _$AppModule extends _i18.AppModule {}
