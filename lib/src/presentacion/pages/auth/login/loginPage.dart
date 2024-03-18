import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/LoginContent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

  @override
  void initState() {
    //se ejecuta 1 vez cuando carga la pantalla
    // TODO: implement initState
    super.initState();

    //para reiniicar el estado de los estring(txt) a lo valor inicial
    /*WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.dispose();
    });*/
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: BlocListener<LoginBloc, LoginState>(
        //todo lo q no tenga q ver con retornar widget(mensaje - pasar a otra pantalla ) en BlocListener
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Succes) {
            _bloc?.add(LoginFormReset());
            Fluttertoast.showToast(
                msg: 'Login Exitoso', toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            //todo lo q sea retornar un widget en BlocBuilder
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                children: [
                  LoginContent(_bloc, state),
                  Center(child: CircularProgressIndicator())
                ]
              );
            }
            return LoginContent(_bloc, state);
          },
        ),
      ),
    ));
  }
}
