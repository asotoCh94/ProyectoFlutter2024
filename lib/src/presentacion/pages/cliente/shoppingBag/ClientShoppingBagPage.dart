import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/widget/ClientshoppingbagBottonBar.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/widget/ClientshoppingbagItem.dart';

class Clientshoppingbagpage extends StatefulWidget {
  const Clientshoppingbagpage({super.key});

  @override
  State<Clientshoppingbagpage> createState() => _ClientshoppingbagpageState();
}

class _ClientshoppingbagpageState extends State<Clientshoppingbagpage> {
  ClientshoppingbagBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetshoppingBag());
      _bloc?.add(GetTotal());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientshoppingbagBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi orden'),
      ),
      body: BlocBuilder<ClientshoppingbagBloc, ClientshoppingbagState>(
          builder: (context, state) {
        return ListView.builder(
            itemCount: state.product.length,
            itemBuilder: (context, index) {
              return Clientshoppingbagitem(_bloc, state, state.product[index]);
            });
      }),
      bottomNavigationBar:
          BlocBuilder<ClientshoppingbagBloc, ClientshoppingbagState>(
              builder: (context, state) {
        return ClientshoppingbagBottonBar(state);
      }),
    );
  }
}
