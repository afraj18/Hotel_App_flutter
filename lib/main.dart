// ignore_for_file: prefer_const_constructors

import 'package:ajay/constraints.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
// import 'register_screen.dart';

void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
