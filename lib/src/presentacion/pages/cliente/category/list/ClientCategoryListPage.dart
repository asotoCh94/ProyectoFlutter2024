import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/category/list/bloc/ClientCtgListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/category/list/bloc/ClientCtgListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/category/list/bloc/ClientCtgListState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/category/list/widget/ClientCategoryListItem.dart';

class ClientCategoryListPage extends StatefulWidget {
  const ClientCategoryListPage({super.key});

  @override
  State<ClientCategoryListPage> createState() => _ClientCategoryListPageState();
}

class _ClientCategoryListPageState extends State<ClientCategoryListPage> {
  ClientCtgListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetCategories());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientCtgListBloc>(context);
    return Scaffold(
      body: BlocListener<ClientCtgListBloc, ClientCtgListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Succes) {
            if(responseState.data is bool){
              _bloc?.add(GetCategories());
            }            
          }
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ClientCtgListBloc, ClientCtgListState>(
            builder: (context, state) {
          final responseState = state.response;
          if (responseState is Succes) {
            List<Category> categories = responseState.data as List<Category>;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ClientCategoryListItem(_bloc, categories[index]);
              },
            );
          }
          return Container();
        }),
      ),
    );
  }
}
