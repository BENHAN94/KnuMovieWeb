import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/LandingPage.dart';
import 'package:knumovie/Navbar/Navbar.dart';

void main() async {
  runApp(KnuMovie());
}

class KnuMovie extends StatefulWidget {
  KnuMovie({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _KnuMovieState createState() => _KnuMovieState();
}

class _KnuMovieState extends State<KnuMovie> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Knu Movie',
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Montserrat"),
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(219, 32, 39, 0.8),
                    Color.fromRGBO(219, 32, 39, 0.7)
                  ]),
            ),
            child: Column(
              children: <Widget>[
                Navbar(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: LandingPage(),
                )
              ],
            ),
          ),
        ));
  }
}
