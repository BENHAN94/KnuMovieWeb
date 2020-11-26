import 'package:flutter/material.dart';
import 'package:myapp/Navbar/Navbar.dart';

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
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
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
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopSearchedMovie(str);
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return TabletSearchedMovie(str);
        } else {
          return MobileSearchedMovie(str);
        }
      },
    );
  }
}

// ignore: must_be_immutable
class DesktopSearchedMovie extends StatelessWidget {
  var text;
  DesktopSearchedMovie(str) {
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
                )),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TabletSearchedMovie extends StatelessWidget {
  var text;
  TabletSearchedMovie(str) {
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

// ignore: must_be_immutable
class MobileSearchedMovie extends StatelessWidget {
  var text;
  MobileSearchedMovie(str) {
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
