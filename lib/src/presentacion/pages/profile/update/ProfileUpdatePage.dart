import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/domain/models/User.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/info/bloc/ProfitInfoEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/profile/update/widget/ProfileUpdateContent.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  ProfileUpdateBloc? _bloc;
  User? user;
  @override
  void initState() {
    //una vez
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //esperamos a q la pantalla cargue
      _bloc?.add(ProfileUpdateInitEvent(user: user));
    });
  }

  @override
  Widget build(BuildContext context) {
    //despues del init //initState no puede ir en el build x q se dispara varias veces
    _bloc = BlocProvider.of<ProfileUpdateBloc>(context);
    user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
        body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
      listener: (context, state) {
        //se trabajan los estados de la respues del servidor
        final responseState = state.response;
        if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        } else if (responseState is Succes) {
          User user = responseState.data as User;
          _bloc?.add(ProfileUpdateUserSesion(user: user));
          Future.delayed(Duration(seconds: 1), () {//no es lo mas obtimo
            //recargamos la info en la pantalla anteroir
            context.read<ProfileInfoBloc>().add(ProfileInfiGetUser());
          });          
          Fluttertoast.showToast(
              msg: 'Actualizacion exitosa', toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
        builder: (context, state) {
          final responseState = state.response;
          if (responseState is Loading) {
            return Stack(children: [
              ProfileUpdateContent(_bloc, state, user),
              Center(child: CircularProgressIndicator())
            ]);
          }
          return ProfileUpdateContent(_bloc, state, user);
        },
      ),
    ));
  }
}
