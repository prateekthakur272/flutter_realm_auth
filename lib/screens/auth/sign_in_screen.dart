import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_realm_auth/blocs/auth_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Login', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      border: OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      border: OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(child: const Text('LogIn'),onPressed: () async {
                    context.read<AuthenticationBloc>().appService.logInWithEmailPassword(emailController.text.trim(), passwordController.text.trim()).then((value){
                      context.read<AuthenticationBloc>().add(AuthenticationLoadState());
                    });
                  },),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}