import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/widget/AdminCategoryListItem.dart';

class AdminCategoryListPage extends StatefulWidget {
  const AdminCategoryListPage({super.key});

  @override
  State<AdminCategoryListPage> createState() => _AdminCategoryListPageState();
}

class _AdminCategoryListPageState extends State<AdminCategoryListPage> {
  AdminCtgListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetCategories());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminCtgListBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'admin/category/create');
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocListener<AdminCtgListBloc, AdminCtgListState>(
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
        child: BlocBuilder<AdminCtgListBloc, AdminCtgListState>(
            builder: (context, state) {
          final responseState = state.response;
          if (responseState is Succes) {
            List<Category> categories = responseState.data as List<Category>;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return AdminCategoryListItem(_bloc, categories[index]);
              },
            );
          }
          return Container();
        }),
      ),
    );
  }
}
