import 'package:flutter/material.dart';
import 'package:knumovie/API.dart';
import 'package:knumovie/LandingPage/LandingPage.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'dart:math';
import 'package:flutter/material.dart';

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Knu Movie',
          theme: ThemeData(
            primarySwatch: generateMaterialColor(Pallette.primary),
            fontFamily: "Montserrat",
          ),
          home: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.red[400], Colors.red[300]]),
              ),
              child: Column(
                children: <Widget>[
                  Navbar(),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: LandingPage(),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class Pallette {
  static const Color primary = Color(0xFFE57373);
}
