import 'package:flutter/material.dart';
import 'SignUp.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(219, 32, 39, 1.0),
              Color.fromRGBO(255, 207, 209, 1.0)
            ]),
      ),
      child: Column(
        children: <Widget>[
          SignHome(),
        ],
      ),
    ));
  }
}
