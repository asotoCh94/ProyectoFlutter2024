import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/models/Rol.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/bloc/RolesBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/bloc/RolesState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/roles/widget/RolesItem.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RolesBloc, RolesState>(
        builder: (context, state) {
          return Container(
            
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              children: state.roles != null 
              ? (state.roles?.map((Role? roles) {
                  return roles != null ? RolesItem(roles) : Container();
                }).toList()) as List<Widget>
              : [],
            ),
          );
        },
      ),
    );
  }
}
