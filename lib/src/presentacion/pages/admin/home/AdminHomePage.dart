import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/main.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/home/bloc/AdmindHomeEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/home/bloc/AdmindHomeState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/AdminCategoryListPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/ProfileInfoPage.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/RolesPage.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  AdminHomeBloc? _bloc;

  List<Widget> pageList = <Widget>[
    AdminCategoryListPage(),
    RolesPage(),
    ProfileInfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminHomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer:BlocBuilder<AdminHomeBloc, AdminHomeState>(builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text(
                    'Menu Admin',
                    style: TextStyle(color: Colors.white),
                  )),
              ListTile(
                title: Text('Categorias'),
                selected: state.pageIndex == 0,
                onTap: () {
                  _bloc?.add(AdminChangeDrawerPage(pageIndex: 0));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Roles'),
                selected: state.pageIndex == 1,
                onTap: () {
                  _bloc?.add(AdminChangeDrawerPage(pageIndex: 1));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Perfil Usuario'),
                selected: state.pageIndex == 2,
                onTap: () {
                  _bloc?.add(AdminChangeDrawerPage(pageIndex: 2));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Cerrar Sesion'),
                onTap: () {
                  _bloc?.add(AdminLogout());
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
      body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
    );
  }
}
