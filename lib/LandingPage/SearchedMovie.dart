import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/SelectedMovie.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/API.dart';
import 'package:knumovie/bloc/movie_provider.dart';
import '../API.dart';
import '../model/movie.dart';

class SearchedMovie extends StatefulWidget {
  @override
  _SearchedMovieState createState() => _SearchedMovieState();
}

class _SearchedMovieState extends State<SearchedMovie> {
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
            child: SearchedMovies(),
          )
        ],
      ),
    ));
  }
}

class SearchedMovies extends StatefulWidget {
  @override
  _SearchedMoviesState createState() => _SearchedMoviesState();
}

class _SearchedMoviesState extends State<SearchedMovies> {
  final api = API();

  @override
  Widget build(BuildContext context, AsyncSnapshot snapshot) {
    final movieBloc = MovieProvider.of(context);
    return StreamBuilder(
        stream: movieBloc.results,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("No data");
          } else {
            return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 4,
                    children: List.generate(snapshot.data.length, (index) {
                      return Hero(
                          tag: 'postImage$index',
                          child: FlatButton(
                              child:
                                  Image.network(snapshot.data[index].postImage),
                              onPressed: () {
                                print(index);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailScreen(
                                      1,
                                      snapshot.data[index].movieId,
                                      index,
                                      text);
                                }));
                              }));
                    })));
          }
        });
  }
}
