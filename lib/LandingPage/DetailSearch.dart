import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/MyPage/Admin/IsAdult.dart';
import 'package:knumovie/LandingPage/MyPage/Admin/MovieType.dart';
import 'package:knumovie/LandingPage/SearchedMovie.dart';
import 'package:knumovie/LandingPage/SignUp/input_field.dart';
import 'package:knumovie/Navbar/Navbar.dart';

import 'MyPage/Admin/AdminRegistPage.dart';

class DetailSearch extends StatelessWidget {
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
          DetailSearchs(),
        ],
      ),
    ));
  }
}

class DetailSearchs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1400) {
          return DesktopDetailSearchs();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1400) {
          return TabletDetailSearchs();
        } else {
          return MobileDetailSearchs();
        }
      },
    );
  }
}

class DesktopDetailSearchs extends StatefulWidget {
  @override
  _DesktopDetailSearchsState createState() => _DesktopDetailSearchsState();
}

class _DesktopDetailSearchsState extends State<DesktopDetailSearchs> {
  FocusNode _focus = new FocusNode();
  final TextEditingController _mag = new TextEditingController();
  String hintText = 'Search';
  double height = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Navbar(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        ),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            elevation: 5.0,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 1.3,
              padding: EdgeInsets.only(top: 15.0, left: 300.0, bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Detaily Search Movie",
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
                                InputField(
                                    label: "Primary title",
                                    content: "Harry Potter"),
                                SizedBox(
                                  height: 20.0,
                                ),
                                InputField(
                                    label: "Running time", content: "150"),
                                SizedBox(
                                  height: 20.0,
                                ),
                                InputField(
                                    label: "Start year", content: "0000-00-00"),
                                SizedBox(
                                  height: 20.0,
                                ),
                                InputField(
                                    label: "End year", content: "0000-00-00"),
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
                                      onPressed: () {},
                                      child: Text("Cancel"),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    FlatButton(
                                      color: Colors.red,
                                      onPressed: () {},
                                      child: Text(
                                        "Search",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
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
      height = 204.0;
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

  _handleSubmitted(String text) {
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

class TabletDetailSearchs extends StatefulWidget {
  @override
  _TabletDetailSearchsState createState() => _TabletDetailSearchsState();
}

class _TabletDetailSearchsState extends State<TabletDetailSearchs> {
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
            height: MediaQuery.of(context).size.height / 1.3,
            padding: EdgeInsets.only(top: 15.0, left: 120.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Detaily Search Movie",
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
                              InputField(
                                  label: "Primary title",
                                  content: "Harry Potter"),
                              SizedBox(
                                height: 20.0,
                              ),
                              InputField(label: "Running time", content: "150"),
                              SizedBox(
                                height: 20.0,
                              ),
                              InputField(
                                  label: "Start year", content: "0000-00-00"),
                              SizedBox(
                                height: 20.0,
                              ),
                              InputField(
                                  label: "End year", content: "0000-00-00"),
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
                                    onPressed: () {},
                                    child: Text("Cancel"),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  FlatButton(
                                    color: Colors.red,
                                    onPressed: () {},
                                    child: Text(
                                      "Search",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ))
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
      height = 204.0;
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
    _mag.clear();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchedMovie(text),
        ));
  }
}

class MobileDetailSearchs extends StatefulWidget {
  @override
  _MobileDetailSearchsState createState() => _MobileDetailSearchsState();
}

class _MobileDetailSearchsState extends State<MobileDetailSearchs> {
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
          height: MediaQuery.of(context).size.height / 1.3,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 40.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Detaily Search Movie",
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
                                  InputField(
                                      label: "Primary title",
                                      content: "Harry Potter"),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  InputField(
                                      label: "Running time", content: "150"),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  InputField(
                                      label: "Start year",
                                      content: "0000-00-00"),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  InputField(
                                      label: "End year", content: "0000-00-00"),
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
                                                    AdminRegistFunction(),
                                              ));
                                        },
                                        child: Text(
                                          "Regist new Movie",
                                        ),
                                      ),
                                      FlatButton(
                                        color: Colors.white,
                                        onPressed: () {},
                                        child: Text("Cancel"),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      FlatButton(
                                        color: Colors.red,
                                        onPressed: () {},
                                        child: Text(
                                          "Search",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
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
      height = 204.0;
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
