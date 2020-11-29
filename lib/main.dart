import 'dart:io';

import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/LandingPage.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'API.dart';
import 'model/account.dart';
import 'model/actor.dart';
import 'model/genre.dart';
import 'model/log.dart';
import 'model/movie.dart';

void main() async {
  final api = API();

  Future<List<Movie>> fmovies = api.selectMovie("", actor: "brad pitt");
  final movies = await fmovies;
  print(movies[0].postImage);
  //runApp(knumovie());
}

class KnuMovie extends StatelessWidget {
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(219, 32, 39, 0.9),
              Color.fromRGBO(219, 100, 100, 0.7)
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
