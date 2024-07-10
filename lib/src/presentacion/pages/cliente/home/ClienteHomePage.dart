import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/main.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/category/list/ClientCategoryListPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/home/bloc/ClientHomeBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/home/bloc/ClientHomeEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/home/bloc/ClientHomeState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/ProfileInfoPage.dart';

import '../../roles/RolesPage.dart';

class ClienteHomePage extends StatefulWidget {
  const ClienteHomePage({super.key});

  @override
  State<ClienteHomePage> createState() => _ClienteHomePageState();
}

class _ClienteHomePageState extends State<ClienteHomePage> {
  ClientHomeBloc? _bloc;
  List<Widget> pageList = <Widget>[
    //AdminCategoryListPage(),
    ClientCategoryListPage(),
    ProfileInfoPage(),
    RolesPage(),

    //
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientHomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'client/shoppingBag');
              },
              icon: Icon(Icons.shopping_bag,
              color: Colors.black,
              )
            ),
        ],
      ),
      //drawer tiene las opciones
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
          builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text(
                    'Menu Cliente',
                    style: TextStyle(color: Colors.white),
                  )),
              ListTile(
                title: Text('Categorias'),
                selected: state.pageIndex == 0,
                onTap: () {
                  _bloc?.add(ChangeDrawerPage(pageIndex: 0));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Perfil Usuario'),
                selected: state.pageIndex == 1,
                onTap: () {
                  _bloc?.add(ChangeDrawerPage(pageIndex: 1));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Roles'),
                selected: state.pageIndex == 2,
                onTap: () {
                  _bloc?.add(ChangeDrawerPage(pageIndex: 2));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Cerrar Sesion'),
                onTap: () {
                  _bloc?.add(ClientLogout());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                      (route) => false);
                },
              ),
            ],
          ),
        );
      }),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
          builder: (context, state) {
        return pageList[state.pageIndex];
      }),
    );
  }
}
