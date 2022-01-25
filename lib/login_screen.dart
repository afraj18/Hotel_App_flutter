// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_print, unused_field, deprecated_member_use

import 'package:ajay/colors.dart';
import 'package:ajay/home_screen.dart';
import 'package:flutter/services.dart';

import 'constraints.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String _email, _password;

  void signIn(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((onError) {
      print("Error" + onError);
    }).then((authUser) {
      // print("Hello " + authUser.user!.uid);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Image.asset(
                      bgImg,
                      height: height * 0.4,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.45,
                      width: width,
                      // color: Colors.amber.withOpacity(0.3),
                      decoration: BoxDecoration(
                        // ignore: prefer_const_literals_to_create_immutables
                        gradient: LinearGradient(
                            // ignore: prefer_const_literals_to_create_immutables
                            stops: [0.3, 0.7],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // ignore: prefer_const_literals_to_create_immutables
                            colors: [
                              Colors.transparent,
                              Colors.white,
                            ]),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              appName,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              slogan,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              address,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                  child: Container(
                    child: Text(
                      " $loginPageTitle ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        // ignore: prefer_const_literals_to_create_immutables
                        colors: [
                          primaryColor.withOpacity(0.3),
                          Colors.transparent,
                        ],
                      ),
                      border: Border(
                        left: BorderSide(
                          color: primaryColor,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (_email) {
                      if (_email!.isEmpty) {
                        return "Please enter the email address";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_email)) {
                        return "Not a valid email";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: primaryColor,
                        ),
                        label: Text(
                          "E-mail Address",
                        ),
                        labelStyle: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value!;
                    },
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Password is empty";
                      } else if (password.length < 8 || password.length > 15) {
                        return "Please enter a strong password (Inapropriate length)";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: primaryColor,
                        ),
                        label: Text(
                          "Password",
                        ),
                        labelStyle: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {},
                    child: Text("Forgot Password?"),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: height * 0.08,
                    width: width * 0.95,
                    child: FlatButton(
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          signIn(context);
                          // print(_email);
                          // print(_password);
                          // if (_email == "test@gmail.com" &&
                          //     _password == "test1234") {
                          //   _email = "";
                          //   _password = "";
                          //   // print("Login Success");
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomeScreen(),
                          //     ),
                          //   );
                          //   FocusScope.of(context).unfocus();
                          // } else {
                          //   print("Invalid Credentials");
                          //   // AlertDialog(
                          //   //   title: Text("Wrong Credentials"),
                          //   // );
                          // }
                        } else {
                          print("not valid");
                        }
                      },
                      child: Text(
                        "Login to account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Dont have an accout?"),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Create an account",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
