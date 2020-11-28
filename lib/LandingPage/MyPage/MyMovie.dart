import 'package:flutter/material.dart';
import 'package:knumovie/Navbar/Navbar.dart';

class MyMovie extends StatelessWidget {
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
            padding: EdgeInsets.only(top: 100.0),
          ),
          MyMovies(),
        ],
      ),
    ));
  }
}

class MyMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
