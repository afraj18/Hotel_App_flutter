// ignore_for_file: prefer_const_constructors

import 'package:ajay/constraints.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_screen.dart';
// import 'register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
