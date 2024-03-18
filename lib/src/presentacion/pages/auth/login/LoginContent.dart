import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultTexField.dart';

// ignore: must_be_immutable
class LoginContent extends StatelessWidget {
  //recibimos parametros
  LoginBloc? bloc;
  LoginState state;
  LoginContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //vertical
              crossAxisAlignment: CrossAxisAlignment.center, //horizontal
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 125,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                _textFieldEmail(),
                _textFieldPassword(),
                _buttonLogin(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 65,
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(right: 5),
                    ),
                    Text(
                      'No tienes cuenta?',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Container(
                      width: 65,
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 5),
                    ),
                  ],
                ),
                _buttonRegister(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background1.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Colors.black54,
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _textFieldEmail() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
          label: 'Correo Electronico',
          icon: Icons.email,
          onChanged: (texto) {
            bloc?.add(EmailChanged(email: BlocFormItem(value: texto)));
          },
          validator: (value) {
            return state.email.error;
          },
        ));
  }

  Widget _textFieldPassword() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
          label: 'Contraseña',
          icon: Icons.lock,
          onChanged: (texto) {
            bloc?.add(PasswordChanged(password: BlocFormItem(value: texto)));
          },
          obscureText: true,
          validator: (value) {
            return state.password.error;
          },
        ));
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(LoginOnclick());
          } else {
            Fluttertoast.showToast(
                msg: 'El formulario no es valido',
                toastLength: Toast.LENGTH_LONG);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          //backgroundColor: state.formKey!.currentState!.validate() ? Colors.green : Colors.grey
        ),
        child: Text(
          'Iniciar Sesion',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'register');
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: Text(
          'Registrate',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
