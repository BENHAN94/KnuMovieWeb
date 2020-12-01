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
            colors: [Colors.red[400], Colors.red[300]]),
      ),
      child: Column(
        children: <Widget>[
          SignHome(),
        ],
      ),
    ));
  }
}
