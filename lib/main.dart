import 'package:flutter/material.dart';
import 'package:myapp/LandingPage/LandingPage.dart';
import 'package:myapp/Navbar/Navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Knu Movie',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Montserrat"),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(219, 32, 39, 1.0),
              Color.fromRGBO(255, 207, 209, 1.0)
            ]),
      ),
      child: Column(
        children: <Widget>[
          Navbar(),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: LandingPage(),
          )
        ],
      ),
    ));
  }
}
