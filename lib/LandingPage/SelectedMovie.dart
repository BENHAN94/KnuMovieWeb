import 'package:flutter/material.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/API.dart';
import '../API.dart';
import '../model/movie.dart';

class DetailScreen extends StatelessWidget {
  int movieId;
  int i = 0;
  DetailScreen(int str, int item) {
    movieId = str;
    i = item;
    print(movieId);
  }
  final api = API();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: api.crudMovie(mid: movieId.toString()),
            builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
              if (snapshot.hasData == false) {
                return Container();
              } else {
                return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(219, 32, 39, 1.0),
                            Color.fromRGBO(255, 207, 209, 1.0)
                          ]),
                    ),
                    child: Column(children: <Widget>[
                      Navbar(),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Column(children: <Widget>[
                                Hero(
                                    tag: 'postImage$i',
                                    child: Row(children: <Widget>[
                                      Image.network(snapshot.data.postImage),
                                      SizedBox(
                                        height: 150.0,
                                      ),
                                      Container(
                                          color: Colors.white,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.0,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2.0,
                                          child: Text("Title: " +
                                              snapshot.data.originalTitle +
                                              "\n" +
                                              "Type: " +
                                              snapshot.data.type +
                                              "\n" +
                                              "StartYear: " +
                                              snapshot.data.startYear +
                                              "\n" +
                                              "Actor: " +
                                              snapshot.data.actor.toString() +
                                              "\n" +
                                              "Genre: " +
                                              snapshot.data.genre.toString() +
                                              "\n" +
                                              "IsAdult: " +
                                              snapshot.data.isAdult.toString() +
                                              "\n" +
                                              "RunnigTime: " +
                                              snapshot.data.runningTime
                                                  .toString() +
                                              "\n")),
                                    ])),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GridView.count(
                                      crossAxisCount: 3,
                                    )
                                  ],
                                )
                              ]),
                            ),
                          ))
                    ]));
              }
            }));
  }
}
