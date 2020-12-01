import 'package:flutter/material.dart';
import 'SignIn.dart';

class SignInPage extends StatefulWidget {
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: SignInPage.scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red[400],
                  Colors.red[300],
                ]),
          ),
          child: Column(
            children: <Widget>[
              SignIn(),
            ],
          ),
        ));
  }
}
