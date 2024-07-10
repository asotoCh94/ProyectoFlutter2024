import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/detail/bloc/ClientProductDetailState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/detail/widget/ClientProductDetailContent.dart';

class ClientProductDetailPage extends StatefulWidget {
  const ClientProductDetailPage({super.key});

  @override
  State<ClientProductDetailPage> createState() =>
      _ClientProductDetailPageState();
}

class _ClientProductDetailPageState extends State<ClientProductDetailPage> {
  Product? product;
  ClientProductDetailBloc? _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetProducts(product: product!));
    });
  }

  @override
  void dispose() {
    //se despara cuando cambiamos de pantalla
    super.dispose();
    _bloc?.add(ResetState());
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)?.settings.arguments as Product;
    _bloc = BlocProvider.of<ClientProductDetailBloc>(context);
    return Scaffold(
        body: BlocBuilder<ClientProductDetailBloc, ClientProductDetailState>(
      builder: (context, state) {
        return ClientProductDetailContent(_bloc, state, product);
      },
    ));
  }
}
