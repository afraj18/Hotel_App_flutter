// ignore_for_file: prefer_const_constructors

import 'package:ajay/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello Welcome to Home Page"),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go to Login"),
          ),
        ],
      ),
    );
  }
}
