import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/widget/AdminProductListItem.dart';

import '../../../../../domain/utils/Resource.dart';

class AdminProductListPage extends StatefulWidget {
  const AdminProductListPage({super.key});

  @override
  State<AdminProductListPage> createState() => _AdminProductListPageState();
}

class _AdminProductListPageState extends State<AdminProductListPage> {
  AdminProductListBloc? _bloc;
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
    _bloc = BlocProvider.of<AdminProductListBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'admin/product/create',
              arguments: category);
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocListener<AdminProductListBloc, AdminProductListState>(
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
        child: BlocBuilder<AdminProductListBloc, AdminProductListState>(
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
                return AdminProductListItem(_bloc, products[index]);
              },
            );
          }
          return Container();
        }),
      ),
    );
  }
}










