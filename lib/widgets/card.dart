// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../colors.dart';
import '../constraints.dart';

// ignore: use_key_in_widget_constructors
class customCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: width * .45,
                height: height * .25,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Text(
                          "HI",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        Image.asset(
                          bgImg,
                          height: height * .174,
                          width: width,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "Price",
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: width * .45,
                height: height * .25,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Column(
                  children: [
                    Text(
                      "HI",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    Text("Hello"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
