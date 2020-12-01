import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/MyPage/MyMovie.dart';
import 'package:knumovie/LandingPage/SearchedMovie.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/API.dart';
import 'package:knumovie/model/director.dart';
import '../API.dart';
import '../model/movie.dart';

class DetailScreen extends StatefulWidget {
  int movieId;
  int userId;
  int i = 0;
  var text;
  TextEditingController rate;
  DetailScreen(int uid, int str, int item, String txt) {
    userId = uid;
    movieId = str;
    i = item;
    text = txt;
  }
  @override
  _DetailScreenState createState() =>
      _DetailScreenState(userId, movieId, i, text);
}

class _DetailScreenState extends State<DetailScreen> {
  int movieId;
  int userId;
  int i = 0;
  var rating;
  TextEditingController rate = new TextEditingController();
  String text;
  _DetailScreenState(int uid, int str, int item, String txt) {
    userId = uid;
    movieId = str;
    i = item;
    text = txt;
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
                                child: Column(
                              children: <Widget>[
                                Hero(
                                    tag: 'postImage$i',
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.network(
                                              snapshot.data.postImage),
                                          Container(
                                              color: Colors.white,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.0,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.13,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10.0),
                                                child:
                                                    Column(children: <Widget>[
                                                  Text(
                                                    "\n\nTitle: " +
                                                        snapshot.data
                                                            .originalTitle +
                                                        "\n\n\n" +
                                                        "Type: " +
                                                        snapshot.data.type +
                                                        "\n\n" +
                                                        "StartYear: " +
                                                        snapshot
                                                            .data.startYear +
                                                        "\n\n" +
                                                        "Director: " +
                                                        snapshot.data.director +
                                                        "\n\n" +
                                                        "Actor: " +
                                                        snapshot.data.actor
                                                            .toString() +
                                                        "\n\n\n" +
                                                        "Genre: " +
                                                        snapshot.data.genre
                                                            .toString() +
                                                        "\n\n\n" +
                                                        "IsAdult: " +
                                                        snapshot.data.isAdult
                                                            .toString() +
                                                        "\n\n\n" +
                                                        "RunnigTime: " +
                                                        snapshot
                                                            .data.runningTime
                                                            .toString() +
                                                        "\n\n\n",
                                                    style: TextStyle(
                                                        fontSize: 12.0),
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        color: Colors.red[100],
                                                        width: 80.0,
                                                        height: 22.0,
                                                        child: TextField(
                                                            controller: rate,
                                                            cursorColor:
                                                                Colors.red[300],
                                                            // focusNode: _focus,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .red[300]),
                                                            decoration: InputDecoration.collapsed(
                                                                hintText:
                                                                    "0.0~10.0",
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                            .red[
                                                                        300],
                                                                    fontSize:
                                                                        14))),
                                                      ),
                                                      RaisedButton(
                                                        onPressed: () {
                                                          if (userId != null) {
                                                            _handleSubmitted(
                                                                text);
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SearchedMovie(),
                                                                ));
                                                          }

                                                          // ignore: unrelated_type_equality_checks
                                                        },
                                                        child: Text("Rating"),
                                                      )
                                                    ],
                                                  )
                                                ]),
                                              ))
                                        ])),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    children: <Widget>[
                                      Column(children: <Widget>[
                                        Container(
                                          alignment: Alignment(0, 0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7.0,
                                          child: Image.network(
                                              snapshot.data.directorImage),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text("Director: \n" +
                                            snapshot.data.director)
                                      ]),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.0,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.0,
                                          child: GridView.count(
                                              crossAxisCount: 4,
                                              childAspectRatio: 3 / 6,
                                              children: List.generate(
                                                  snapshot.data.actorImage
                                                      .length, (index) {
                                                print(snapshot
                                                    .data.actorImage[index]);
                                                return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: <Widget>[
                                                      Container(
                                                          child: Image.network(
                                                              snapshot.data
                                                                      .actorImage[
                                                                  index])),
                                                      Container(
                                                          child: Text(
                                                              "Actors: \n" +
                                                                  snapshot.data
                                                                          .actor[
                                                                      index]))
                                                    ]);
                                              }))),
                                    ])
                              ],
                            )),
                          ))
                    ]));
              }
            }));
  }

  void _handleSubmitted(String text) {
    print(rate.toString());
    api.rating(userId.toString(), movieId.toString(), rate.text);
    rate.clear();
  }
}
