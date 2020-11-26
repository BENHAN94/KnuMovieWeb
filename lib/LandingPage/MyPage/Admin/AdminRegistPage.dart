import 'package:flutter/material.dart';
import 'package:myapp/LandingPage/MyPage/Admin/AdminUpdatePage.dart';
import 'package:myapp/LandingPage/MyPage/Admin/IsAdult.dart';
import 'package:myapp/LandingPage/MyPage/Admin/MovieType.dart';
import 'package:myapp/LandingPage/SignUp/input_field.dart';
import 'package:myapp/Navbar/Navbar.dart';

import '../../DetailSearch.dart';
import '../../SearchedMovie.dart';

class AdminRegistFunction extends StatelessWidget {
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
          AdminFunctions(),
        ],
      ),
    ));
  }
}

class AdminFunctions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1400) {
          return DesktopAdminFunctions();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1400) {
          return TabletAdminFunctions();
        } else {
          return MobileAdminFunctions();
        }
      },
    );
  }
}

class DesktopAdminFunctions extends StatefulWidget {
  @override
  _DesktopAdminFunctionsState createState() => _DesktopAdminFunctionsState();
}

class _DesktopAdminFunctionsState extends State<DesktopAdminFunctions> {
  FocusNode _focus = new FocusNode();
  final TextEditingController _mag = new TextEditingController();
  String hintText = 'Search';
  double height = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Navbar(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      ),
      Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        elevation: 5.0,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 1.7,
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 4.0,
                height: MediaQuery.of(context).size.height / 1.7,
                color: Colors.red[600],
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0, right: 50.0, left: 50.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "You can do it",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "It could be good things",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        FlatButton(
                          color: Colors.red[600],
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AdminUpdateFunction();
                              },
                            ));
                          },
                          child: Text(
                            "Update Movie",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 40.0, bottom: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Regist Movie",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 3.0,
                          height: 50.0,
                          child: TextField(
                            focusNode: _focus,
                            controller: _mag,
                            onSubmitted: _handleSubmitted,
                            decoration: InputDecoration(
                                hintText: hintText,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15.0)),
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () => _mag.clear(),
                                  icon: Icon(Icons.clear),
                                ),
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      _handleSubmitted(_mag.text);
                                    },
                                    icon: Icon(Icons.search)),
                                fillColor: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-1.0, 0.0),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 50.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 65.0,
                                  ),
                                  InputField(
                                      label: "Movie title",
                                      content: "Harry Potter 2020"),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  MovieType(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  IsAdult(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 130.0,
                                      ),
                                      FlatButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      FlatButton(
                                        color: Colors.red,
                                        onPressed: () {},
                                        child: Text(
                                          "RegistMovie",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.8, 0.5),
                          child: Container(
                              margin: EdgeInsets.only(top: 53.0),
                              color: Colors.white,
                              width: 150,
                              height: height,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.movie,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "All",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.title,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Titles",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.tv,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Episodes",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.recent_actors,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Actors",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.image_search,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Detail",
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailSearch(),
                                            ));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + _focus.hasFocus.toString());
    if (_focus.hasFocus) {
      hintText = '';
      height = 255.0;
    } else {
      hintText = 'Search';
      height = 0.0;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _handleSubmitted(String text) {
    print(_mag.text.toString());
    text = _mag.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchedMovie(text),
        ));
    _mag.clear();
  }
}

class TabletAdminFunctions extends StatefulWidget {
  @override
  _TabletAdminFunctionsState createState() => _TabletAdminFunctionsState();
}

class _TabletAdminFunctionsState extends State<TabletAdminFunctions> {
  FocusNode _focus = new FocusNode();
  final TextEditingController _mag = new TextEditingController();
  String hintText = 'Search';
  double height = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Navbar(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      ),
      Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        elevation: 5.0,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 1.7,
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3.0,
                height: MediaQuery.of(context).size.height / 1.7,
                color: Colors.red[600],
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0, right: 50.0, left: 50.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "You can do it",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "It could be good things",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        FlatButton(
                          color: Colors.red[600],
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AdminUpdateFunction();
                              },
                            ));
                          },
                          child: Text(
                            "Update Movie",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Regist Movie",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 3.0,
                          height: 50.0,
                          child: TextField(
                            focusNode: _focus,
                            controller: _mag,
                            onSubmitted: _handleSubmitted,
                            decoration: InputDecoration(
                                hintText: hintText,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15.0)),
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () => _mag.clear(),
                                  icon: Icon(Icons.clear),
                                ),
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      _handleSubmitted(_mag.text);
                                    },
                                    icon: Icon(Icons.search)),
                                fillColor: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-1.0, 0.0),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 50.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 65.0,
                                  ),
                                  InputField(
                                      label: "Movie title",
                                      content: "Harry Potter 2020"),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  MovieType(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  IsAdult(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 130.0,
                                      ),
                                      FlatButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      FlatButton(
                                        color: Colors.red,
                                        onPressed: () {},
                                        child: Text(
                                          "RegistMovie",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.8, 0.5),
                          child: Container(
                              margin: EdgeInsets.only(top: 53.0),
                              color: Colors.white,
                              width: 150,
                              height: height,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.movie,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "All",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.title,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Titles",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.tv,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Episodes",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.recent_actors,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Actors",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.image_search,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Detail",
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailSearch(),
                                            ));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + _focus.hasFocus.toString());
    if (_focus.hasFocus) {
      hintText = '';
      height = 255.0;
    } else {
      hintText = 'Search';
      height = 0.0;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _handleSubmitted(String text) {
    print(_mag.toString());
    text = _mag.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchedMovie(text),
        ));
    _mag.clear();
  }
}

class MobileAdminFunctions extends StatefulWidget {
  @override
  _MobileAdminFunctionsState createState() => _MobileAdminFunctionsState();
}

class _MobileAdminFunctionsState extends State<MobileAdminFunctions> {
  FocusNode _focus = new FocusNode();
  final TextEditingController _mag = new TextEditingController();
  String hintText = 'Search';
  double height = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Navbar(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      ),
      Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        elevation: 5.0,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 1.7,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 40.0, bottom: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Regist Movie",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 3.0,
                          height: 50.0,
                          child: TextField(
                            focusNode: _focus,
                            controller: _mag,
                            onSubmitted: _handleSubmitted,
                            decoration: InputDecoration(
                                hintText: hintText,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15.0)),
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () => _mag.clear(),
                                  icon: Icon(Icons.clear),
                                ),
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      _handleSubmitted(_mag.text);
                                    },
                                    icon: Icon(Icons.search)),
                                fillColor: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-1.0, 0.0),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 50.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 65.0,
                                  ),
                                  InputField(
                                      label: "Movie title",
                                      content: "Harry Potter 2020"),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  MovieType(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  IsAdult(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 30.0,
                                      ),
                                      FlatButton(
                                        color: Colors.white,
                                        textColor: Colors.red,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminUpdateFunction(),
                                              ));
                                        },
                                        child: Text(
                                          "Update Movie",
                                        ),
                                      ),
                                      FlatButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      FlatButton(
                                        color: Colors.red,
                                        onPressed: () {},
                                        child: Text(
                                          "RegistMovie",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.8, 0.5),
                          child: Container(
                              margin: EdgeInsets.only(top: 53.0),
                              color: Colors.white,
                              width: 150,
                              height: height,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.movie,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "All",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.title,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Titles",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.tv,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Episodes",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.recent_actors,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Actors",
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    color: Colors.red[200],
                                    width: 150,
                                    height: 50,
                                    child: OutlineButton(
                                      borderSide: BorderSide.none,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.image_search,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Detail",
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailSearch(),
                                            ));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + _focus.hasFocus.toString());
    if (_focus.hasFocus) {
      hintText = '';
      height = 255.0;
    } else {
      hintText = 'Search';
      height = 0.0;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _handleSubmitted(String text) {
    print(_mag.toString());
    text = _mag.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchedMovie(text),
        ));
    _mag.clear();
  }
}
