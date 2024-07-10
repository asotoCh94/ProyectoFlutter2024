
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/widget/AdminProductCreateContenet.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListEvent.dart';

import '../../../../../domain/models/Category.dart';

class AdminProductCreatePage extends StatefulWidget {
  const AdminProductCreatePage({super.key});

  @override
  State<AdminProductCreatePage> createState() => _AdminProductCreatePageState();
}

class _AdminProductCreatePageState extends State<AdminProductCreatePage> {
  AdminProductCreateBloc? _bloc;
  Category? category;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(InitEventProduct(category: category)); 
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc =
        BlocProvider.of<AdminProductCreateBloc>(context); //iniciamos el bloc
    //obtenemos el id de la categoria q manda la ventana anterior
    category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
        body: BlocListener<AdminProductCreateBloc, AdminProductCreateState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Succes) {
          //refrescar lista
          context.read<AdminProductListBloc>().add(GetProductsByCategory(idCategory: category!.id!));
          _bloc?.add(FormResertPrdt());
          Fluttertoast.showToast(msg: 'El producto se registro', toastLength: Toast.LENGTH_LONG);
        } else if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminProductCreateBloc, AdminProductCreateState>(
        builder: (context, state) {
          return AdminProductCreateContenet(_bloc, state);
        },
      ),
    ));
  }
}
