import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_realm_auth/blocs/auth_bloc.dart';
import 'package:flutter_realm_auth/screens/auth/sign_in_screen.dart';
import 'package:flutter_realm_auth/screens/home/home_screen.dart';

class AuthHomeController extends StatelessWidget {
  const AuthHomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: ((context, state) {
      if (state is AuthenticationStateAuthenticated){
        return const HomeScreen();
      }
      return const SignInScreen();
    }));
  }
}