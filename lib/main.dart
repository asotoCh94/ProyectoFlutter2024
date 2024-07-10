import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/injection.dart';
import 'package:proyecto_flutter/src/blocProviders.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/AdminCategoryCreatePage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/update/AdminCategoryUpdatePage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/home/AdminHomePage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/AdminProductCreatePage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/update/AdminProductUpdatePage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/loginPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/registerPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/home/ClienteHomePage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/detail/ClientProductDetailPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/ClientProductListPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/ClientShoppingBagPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/ProfileInfoPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/update/ProfileUpdatePage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/RolesPage.dart';

import 'src/presentacion/pages/admin/product/list/AdminProductListPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//para q si no se inicializa al cargar
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'roles': (BuildContext context) => RolesPage(),

          'profile/info': (BuildContext context) => ProfileInfoPage(),
          'profile/update': (BuildContext context) => ProfileUpdatePage(),

          'client/home': (BuildContext context) => ClienteHomePage(),
          'client/product/list': (BuildContext context) => ClientProductListPage(),
          'client/product/detail': (BuildContext context) =>ClientProductDetailPage(),
          'client/shoppingBag': (BuildContext context) =>Clientshoppingbagpage(),

          'admin/home': (BuildContext context) => AdminHomePage(),
          'admin/category/create': (BuildContext context) => AdminCategoyCreatePage(),
          'admin/category/update': (BuildContext context) =>AdminCategoryUpdatePage(),

          'admin/product/list': (BuildContext context) => AdminProductListPage(),
          'admin/product/create': (BuildContext context) =>AdminProductCreatePage(),
          'admin/product/update': (BuildContext context) =>AdminProductUpdatePage(),
        },
      ),
    );
  }
}
