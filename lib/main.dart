import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_realm_auth/app.dart';
import 'package:flutter_realm_auth/blocs/auth_bloc.dart';
import 'package:flutter_realm_auth/blocs/bloc_observer.dart';
import 'package:flutter_realm_auth/realm_repository/app_service.dart';
import 'package:flutter_realm_auth/settings.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) => AuthenticationBloc(AppService(Settings.appId, Settings.baseUrl))..add(AuthenticationLoadState()),
    child: const MyApp(),
  ));
}
