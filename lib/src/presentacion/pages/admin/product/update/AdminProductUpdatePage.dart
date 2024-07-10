
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/update/bloc/AdminProductUpdateState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/update/widget/AdminProductUpdateContenet.dart';

class AdminProductUpdatePage extends StatefulWidget {
  const AdminProductUpdatePage({super.key});

  @override
  State<AdminProductUpdatePage> createState() => _AdminProductUpdatePageState();
}

class _AdminProductUpdatePageState extends State<AdminProductUpdatePage> {
  AdminProductUpdateBloc? _bloc;
  Product? product;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(InitEventProduct(product: product)); 
    });
  }
  //borrar datos de memoria
  @override
  void dispose() {
    super.dispose();
    _bloc?.add(FormResertPrdt());
  }

  @override
  Widget build(BuildContext context) {
    _bloc =
        BlocProvider.of<AdminProductUpdateBloc>(context); //iniciamos el bloc
    //obtenemos el id de la categoria q manda la ventana anterior
    product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
        body: BlocListener<AdminProductUpdateBloc, AdminProductUpdateState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Succes) {
          //_bloc?.add(FormResertPrdt());
          //refrescar lista
          context.read<AdminProductListBloc>().add(GetProductsByCategory(idCategory: product!.idCategory!));
          Fluttertoast.showToast(msg: 'El producto se actualizo', toastLength: Toast.LENGTH_LONG);
        } else if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminProductUpdateBloc, AdminProductUpdateState>(
        builder: (context, state) {
          return AdminProductUpdateContenet(_bloc, state, product);
        },
      ),
    ));
  }
}
