import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:knumovie/Navbar/Navbar.dart';
=======
import 'package:knumovie/LandingPage/SelectedMovie.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/API.dart';
import '../API.dart';
import '../model/movie.dart';
>>>>>>> 28f4314ae93e3fcdab159d709539fcd943e3e9c6

class SearchedMovie extends StatelessWidget {
  var text;
  SearchedMovie(String str) {
    text = str;
  }

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
          Navbar(),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: SearchedMovies(text),
          )
        ],
      ),
    ));
  }
}

// ignore: must_be_immutable
class SearchedMovies extends StatelessWidget {
  var str;
  SearchedMovies(text) {
    str = text;
  }

  @override
  Widget build(BuildContext context) {
    return DesktopSearchedMovie(str);
  }
}

// ignore: must_be_immutable
class DesktopSearchedMovie extends StatelessWidget {
  var text;
  DesktopSearchedMovie(str) {
    text = str;
  }
  final api = API();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.selectMovies(text),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData == false) {
            //   return Container();
            // } else {
            return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(10, (index) {
                      return Hero(
                          tag: 'postImage$index',
                          child: FlatButton(
                              child: Image.asset('assets/images/knu.png'),
                              onPressed: () {
                                print(index);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailScreen(text, index);
                                }));
                              }));
                    })));
          }
        });
  }
}
