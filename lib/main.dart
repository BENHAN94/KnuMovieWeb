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
            primarySwatch: Colors.red,
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
