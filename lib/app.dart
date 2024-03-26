
import 'package:flutter/material.dart';
import 'package:flutter_realm_auth/screens/auth/auth_home_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realm Auth Demo',
      home: const AuthHomeController(),
      theme: ThemeData.light(),
    );
  }
}