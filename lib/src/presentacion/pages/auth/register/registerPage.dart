import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/widget/RegisterContent.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc? _Bloc;

  @override
  void initState() {
    super.initState();
    /*WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerBlocCubit?.dispose();
    });*/
  }

  @override
  Widget build(BuildContext context) {
    _Bloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BlocListener<RegisterBloc, RegisterState>(
              //todo lo q no tenga q ver con retornar widget(mensaje - pasar a otra pantalla ) en BlocListener
              listener: (context, state) {
                final responseState = state.response;
                if (responseState is Error) {
                  Fluttertoast.showToast(
                      msg: responseState.message,
                      toastLength: Toast.LENGTH_LONG);
                } else if (responseState is Succes) {
                  _Bloc?.add(RegisterFormResert());
                  Fluttertoast.showToast(
                      msg: 'Registro Exitoso', toastLength: Toast.LENGTH_LONG);
                }
              },
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  //todo lo q sea retornar un widget en BlocBuilder
                  final responseState = state.response;
                  if (responseState is Loading) {
                    return Stack(children: [
                      RegisterContent(_Bloc, state),
                      Center(child: CircularProgressIndicator())
                    ]);
                  }
                  return RegisterContent(_Bloc, state);
                },
              ),
            )));
  }
}
