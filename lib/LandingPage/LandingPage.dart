import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/DetailSearch.dart';
import 'package:knumovie/LandingPage/SearchedMovie.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FocusNode _focus = new FocusNode();
  final TextEditingController _mag = new TextEditingController();
  String hintText = 'Search';
  double height = 0.0;
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "KNU Movies",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "최선을 다해 영화를 한땀한땀 만들었습니다",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: 55.0,
                  child: Center(
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
                            onPressed: () {
                              _mag.clear();
                            },
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
                ),
                Align(
                  alignment: Alignment(1.0, 1.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 70.0),
                    color: Colors.red,
                    width: width * 1.2,
                    height: width / 1.5,
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
                                      builder: (context) => DetailSearch(),
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
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          if (constraints.maxWidth > 1200) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: pageChildren(constraints.biggest.width / 2.3),
            );
          } else if (constraints.maxWidth > 1000) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: pageChildren(constraints.biggest.width / 1.5),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: pageChildren(constraints.biggest.width / 1.4),
            );
          }
        } else {
          return Column(
              children: pageChildren(constraints.biggest.width / 1.3));
        }
      },
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
