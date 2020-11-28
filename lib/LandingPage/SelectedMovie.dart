import 'package:flutter/material.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/API.dart';
import '../API.dart';
import '../model/movie.dart';

class DetailScreen extends StatelessWidget {
  var text;
  int i = 0;
  DetailScreen(text, int item) {
    text = text;
    i = item;
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
            child: Column(children: <Widget>[
              Navbar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: GestureDetector(
                  child: Center(
                    child: Hero(
                      tag: 'postImage$i',
                      child: Image.asset('assets/images/knu.png'),
                    ),
                  ),
                  onTap: () {
                    print(i);
                    Navigator.pop(context);
                  },
                ),
              )
            ])));
  }
}

class SelectedMovie extends StatelessWidget {
  var text;
  SelectedMovie(String str) {
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
            child: SelectedMovies(text),
          )
        ],
      ),
    ));
  }
}

// ignore: must_be_immutable
class SelectedMovies extends StatelessWidget {
  var str;
  SelectedMovies(text) {
    str = text;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopSelectedMovie(str);
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return TabletSelectedMovie(str);
        } else {
          return MobileSelectedMovie(str);
        }
      },
    );
  }
}

// ignore: must_be_immutable
class DesktopSelectedMovie extends StatelessWidget {
  var text;
  DesktopSelectedMovie(str) {
    text = str;
  }
  final api = API();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.selectMovie(text),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData == false) {
            return Container();
          } else {
            return Container(
              child: Column(
                children: <Widget>[
                  for (int i = 0; i < snapshot.data.length; i++)
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 100.0),
                            Hero(
                              tag: 'dash',
                              child: Image.network(snapshot.data[i].postImage),
                            ),
                            SizedBox(width: 20.0),
                            FlatButton(
                                onPressed: () {}, child: Text("Movie title!!!"))
                          ],
                        )),
                ],
              ),
            );
          }
        });
  }
}

// ignore: must_be_immutable
class TabletSelectedMovie extends StatelessWidget {
  var text;
  TabletSelectedMovie(str) {
    text = str;
  }

  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          for (var item in items)
            Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 100.0),
                    Hero(
                      tag: 'dash',
                      child: Image.asset('assets/images/knu.png'),
                    ),
                    SizedBox(width: 20.0),
                    FlatButton(
                        onPressed: () {},
                        child: Text(item.toString() + "$text Movie title!!!"))
                  ],
                ))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MobileSelectedMovie extends StatelessWidget {
  var text;
  MobileSelectedMovie(str) {
    text = str;
  }
  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          for (var item in items)
            Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 100.0),
                    Container(width: 50.0, height: 50.0, color: Colors.red),
                    SizedBox(width: 20.0),
                    FlatButton(
                        onPressed: () {},
                        child: Text(item.toString() + "$text Movie title!!!"))
                  ],
                ))
        ],
      ),
    );
  }
}
