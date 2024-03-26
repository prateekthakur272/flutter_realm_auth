import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_realm_auth/blocs/auth_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationBloc>().appService.app.currentUser!;
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(user.profile.email??''),
            const SizedBox(height: 24,),
            ElevatedButton(child: const Text('LogOut'),onPressed: () {
              context.read<AuthenticationBloc>().appService.logOut();
              context.read<AuthenticationBloc>().add(AuthenticationLoadState());
            },),
          ],
        ),
      ),
    );
  }
}