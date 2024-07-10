import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/bloc/ClientProductListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/bloc/ClientProductListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/bloc/ClientProductListState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/widget/ClientProductListItem.dart';

import '../../../../../domain/utils/Resource.dart';

class ClientProductListPage extends StatefulWidget {
  const ClientProductListPage({super.key});

  @override
  State<ClientProductListPage> createState() => _ClientProductListPageState();
}

class _ClientProductListPageState extends State<ClientProductListPage> {
  ClientProductListBloc? _bloc;
  Category? category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      if (category != null) {
        _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //obtenemos el id de la categoria q manda la ventana anterior
    category = ModalRoute.of(context)?.settings.arguments as Category;
    _bloc = BlocProvider.of<ClientProductListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: BlocListener<ClientProductListBloc, ClientProductListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Succes) {
            if (responseState.data is bool) {
              _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
            }
          }
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ClientProductListBloc, ClientProductListState>(
            builder: (context, state) {
          final responseState = state.response;
          if(responseState is Loading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if (responseState is Succes) {
            List<Product> products = responseState.data as List<Product>;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ClientProductListItem(_bloc, products[index]);
              },
            );
          }
          return Container();
        }),
      ),
    );
  }
}










