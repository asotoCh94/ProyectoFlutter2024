import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_flutter/injection.dart';
import 'package:proyecto_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/login/bloc/LoginBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/auth/register/bloc/RegisterEvent.dart';
List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context)=> LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent()))
];


