import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultButton.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultIconBack.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultTexField.dart';

// ignore: must_be_immutable
class RegisterContent extends StatelessWidget {
  RegisterBloc? blocCubit;
  RegisterState state;

  RegisterContent(this.blocCubit, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/background1.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Color.fromRGBO(0, 0, 0, 0.3),
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: SingleChildScrollView(
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
                    'Registro',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                          label: 'Nombre',
                          icon: Icons.person,
                          onChanged: (texto) {
                            blocCubit?.add(RegisterNameChanged(
                                name: BlocFormItem(value: texto)));
                          },
                          validator: (value) {
                            return state.name.error;
                          },
                        )),
                  Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                          label: 'Apellido',
                          icon: Icons.person,
                          onChanged: (texto) {
                            blocCubit?.add(RegisterLastNameChanged(
                                lastname: BlocFormItem(value: texto)));
                          },
                        validator: (value) {
                          return state.lastname.error;
                        },
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                          label: 'Email',
                          icon: Icons.email,
                          onChanged: (texto) {
                            blocCubit?.add(RegisterEmailChanged(
                                email: BlocFormItem(value: texto)));
                          },
                        validator: (value) {
                          return state.email.error;
                        },
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                          label: 'Telefono',
                          icon: Icons.phone,
                          onChanged: (texto) {
                            blocCubit?.add(RegisterPhoneChanged(
                                phone: BlocFormItem(value: texto)));
                          },
                        validator: (value) {
                          return state.phone.error;
                        },
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Contraseña',
                        icon: Icons.lock,
                        onChanged: (texto) {
                          blocCubit?.add(RegisterPasswordChanged(
                              password: BlocFormItem(value: texto)));
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                        obscureText: true,
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Confirmar Contraseña',
                        icon: Icons.lock_outline,
                        onChanged: (texto) {
                          blocCubit?.add(RegisterConfirmPasswordChanged(
                              confirmPassword: BlocFormItem(value: texto)));
                        },
                        validator: (value) {
                          return state.confirmPassword.error;
                        },
                        obscureText: true,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: DefaultButton(
                        text: 'Registrar',
                        color: Colors.green,
                        /*color: state.formKey!.currentState!.validate()
                            ? Colors.green
                            : Colors.black,*/
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            blocCubit?.add(RegisterFormOnClick());
                          } else {
                            Fluttertoast.showToast(
                                msg: 'El formulario no es valido',
                                toastLength: Toast.LENGTH_LONG);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
          DefaultIconBack(left: 35, top: 50)
        ],
      ),
    );
  }
}
