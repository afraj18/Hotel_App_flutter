// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:ajay/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final Function? leftCallBack;

  CustomAppBar(this.leftIcon, this.rightIcon, {this.leftCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 24.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: leftCallBack != null ? () => leftCallBack : null,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(leftIcon),
              ),
            ),
            Text(
              "AYAJ Food Court",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(rightIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
