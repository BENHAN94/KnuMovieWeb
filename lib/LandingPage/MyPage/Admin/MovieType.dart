import 'package:flutter/material.dart';

class MovieType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopMovieType();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopMovieType();
        } else {
          return MobileMovieType();
        }
      },
    );
  }
}

class DesktopMovieType extends StatefulWidget {
  @override
  _DesktopMovieTypeState createState() => _DesktopMovieTypeState();
}

class _DesktopMovieTypeState extends State<DesktopMovieType> {
  int red1 = 0;
  int red2 = 0;
  int red3 = 0;
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(
              "MovieType",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(
            width: 40.0,
          ),
          MaterialButton(
            child: Text(
              "KnuMovie",
              textAlign: TextAlign.left,
            ),
            color: Color(red1),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red3 = 0;
                red2 = 0;
                red1 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red1 = 0;
                setState(() {});
              }
            },
          ),
          MaterialButton(
            child: Text(
              "Movie",
              textAlign: TextAlign.left,
            ),
            color: Color(red2),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red1 = 0;
                red3 = 0;

                red2 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red2 = 0;
                setState(() {});
              }
            },
          ),
          MaterialButton(
            child: Text(
              "TvSeries",
              textAlign: TextAlign.left,
            ),
            color: Color(red3),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red1 = 0;
                red2 = 0;
                red3 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red3 = 0;
                setState(() {});
              }
            },
          ),
        ],
      );
    });
  }
}

class MobileMovieType extends StatefulWidget {
  @override
  _MobileMovieTypeState createState() => _MobileMovieTypeState();
}

class _MobileMovieTypeState extends State<MobileMovieType> {
  int red1 = 0;
  int red2 = 0;
  int red3 = 0;
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(
              "MovieType",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          MaterialButton(
            child: Text(
              "KnuMovie",
              textAlign: TextAlign.left,
            ),
            color: Color(red1),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red3 = 0;
                red2 = 0;
                red1 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red1 = 0;
                setState(() {});
              }
            },
          ),
          MaterialButton(
            child: Text(
              "Movie",
              textAlign: TextAlign.left,
            ),
            color: Color(red2),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red1 = 0;
                red3 = 0;
                red2 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red2 = 0;
                setState(() {});
              }
            },
          ),
          MaterialButton(
            child: Text(
              "TvSeries",
              textAlign: TextAlign.left,
            ),
            color: Color(red3),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red1 = 0;
                red2 = 0;
                red3 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red3 = 0;
                setState(() {});
              }
            },
          ),
        ],
      );
    });
  }
}
