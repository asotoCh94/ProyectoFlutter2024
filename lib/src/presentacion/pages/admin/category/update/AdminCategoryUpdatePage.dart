import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/update/bloc/AdminCategoryUpdateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/update/bloc/AdminCategoryUpdateState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/update/widget/AdminCategoyUpdateContenet.dart';

class AdminCategoryUpdatePage extends StatefulWidget {
  const AdminCategoryUpdatePage({super.key});

  @override
  State<AdminCategoryUpdatePage> createState() =>
      _AdminCategoryUpdatePageState();
}

class _AdminCategoryUpdatePageState extends State<AdminCategoryUpdatePage> {
  Category? category;
  AdminCategoryUpdateBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(InitEventCtg(category: category));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.add(FormResertCtg());
  }

  @override
  Widget build(BuildContext context) {
    //iniciamos el bloc
    _bloc = BlocProvider.of<AdminCategoryUpdateBloc>(context);
    category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
        body: BlocListener<AdminCategoryUpdateBloc, AdminCategoryUpdateState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Succes) {
          //_bloc?.add(FormResertCtg());
          context.read<AdminCtgListBloc>().add(GetCategories());
          Fluttertoast.showToast(
              msg: 'La categoria se actualizo', toastLength: Toast.LENGTH_LONG);
        } else if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminCategoryUpdateBloc, AdminCategoryUpdateState>(
        builder: (context, state) {
          return AdminCategoyUpdateContenet(_bloc, state, category);
        },
      ),
    ));
  }
}
