import 'package:flutter/material.dart';
import 'package:knumovie/API.dart';
import 'package:knumovie/LandingPage/SelectedMovie.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/model/movie.dart';

class MyMovie extends StatelessWidget {
  int uid;
  MyMovie(int userId, int movieId) {
    uid = userId;
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
            padding: EdgeInsets.only(top: 100.0),
          ),
          MyMovies(uid),
        ],
      ),
    ));
  }
}

class MyMovies extends StatefulWidget {
  int userId;
  MyMovies(int uid) {
    userId = uid;
  }
  @override
  _MyMoviesState createState() => _MyMoviesState(userId);
}

class _MyMoviesState extends State<MyMovies> {
  final api = API();
  int userId;
  _MyMoviesState(int uid) {
    userId = uid;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.selectMovie(userId),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData == false) {
            return Container();
          } else {
            return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 4,
                    children: List.generate(snapshot.data.length, (index) {
                      print(snapshot.data.toString());
                      return Hero(
                          tag: 'postImage$index',
                          child: FlatButton(
                              child:
                                  Image.network(snapshot.data[index].postImage),
                              onPressed: () {
                                print(index);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyRatedMovie();
                                }));
                              }));
                    })));
          }
        });
  }
}

class MyRatedMovie extends StatefulWidget {
  @override
  _MyRatedMovieState createState() => _MyRatedMovieState();
}

class _MyRatedMovieState extends State<MyRatedMovie> {
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
            padding: EdgeInsets.only(top: 100.0),
          ),
        ],
      ),
    ));
  }
}
