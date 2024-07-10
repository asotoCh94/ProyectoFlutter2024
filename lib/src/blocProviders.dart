import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/injection.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/CtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/ProductUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/ShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/users/UsersUseCases.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/category/list/bloc/ClientCtgListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/home/bloc/ClientHomeBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/bloc/ClientProductListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/bloc/ProfitInfoEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/bloc/RolesBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/bloc/RolesEvent.dart';
List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context)=> LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<RolesBloc>(create: (context) => RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),

  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc(locator<AuthUseCases>())),
  BlocProvider<ClientHomeBloc>(create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
  
  BlocProvider<ProfileInfoBloc>(create: (context) => ProfileInfoBloc(locator<AuthUseCases>())..add(ProfileInfiGetUser())),
  BlocProvider<ProfileUpdateBloc>(create: (context) => ProfileUpdateBloc(locator<UsersUseCases>(), locator<AuthUseCases>())),

  BlocProvider<AdminCategoryCreateBloc>(create: (context) => AdminCategoryCreateBloc(locator<CtgUseCases>())..add(InitEventCtg())),
  BlocProvider<AdminCtgListBloc>(create: (context) => AdminCtgListBloc(locator<CtgUseCases>())),
  BlocProvider<AdminCategoryUpdateBloc>(create: (context) => AdminCategoryUpdateBloc(locator<CtgUseCases>())),

  BlocProvider<AdminProductCreateBloc>(create: (context) =>AdminProductCreateBloc(locator<ProductUseCase>())),
  BlocProvider<AdminProductListBloc>( create: (context) => AdminProductListBloc(locator<ProductUseCase>())),
  BlocProvider<AdminProductUpdateBloc>(create: (context) => AdminProductUpdateBloc(locator<ProductUseCase>())),

  BlocProvider<ClientCtgListBloc>(create: (context) => ClientCtgListBloc(locator<CtgUseCases>())),
  BlocProvider<ClientProductListBloc>(create: (context) => ClientProductListBloc(locator<ProductUseCase>())),
  BlocProvider<ClientProductDetailBloc>(create: (context) => ClientProductDetailBloc(locator<ShoppingBagUseCase>())),
  BlocProvider<ClientshoppingbagBloc>(create: (context) => ClientshoppingbagBloc(locator<ShoppingBagUseCase>())),
];


