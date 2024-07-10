import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/widget/AdminCategoyCreateContenet.dart';

import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListEvent.dart';

class AdminCategoyCreatePage extends StatefulWidget {
  const AdminCategoyCreatePage({super.key});

  @override
  State<AdminCategoyCreatePage> createState() => _AdminCategoyCreatePageState();
}

class _AdminCategoyCreatePageState extends State<AdminCategoyCreatePage> {
  AdminCategoryCreateBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc =
        BlocProvider.of<AdminCategoryCreateBloc>(context); //iniciamos el bloc
    return Scaffold(
        body: BlocListener<AdminCategoryCreateBloc, AdminCategoryCreateState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Succes) {
          _bloc?.add(FormResertCtg());
          context.read<AdminCtgListBloc>().add(GetCategories());
          Fluttertoast.showToast(msg: 'La categoria se registro', toastLength: Toast.LENGTH_LONG);
        } else if (responseState is Error) {
          Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminCategoryCreateBloc, AdminCategoryCreateState>(
        builder: (context, state) {
          return AdminCategoyCreateContenet(_bloc, state);
        },
      ),
    ));
  }
}
