// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ajay/colors.dart';

import 'package:ajay/widgets/card.dart';
import 'package:ajay/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              Icons.arrow_back_ios_new,
              Icons.arrow_circle_down_rounded,
            ),
            customCard(),
            customCard(),
            customCard(),
            customCard(),
          ],
        ),
      ),
    );
  }
}
