import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/DetailSearch.dart';
import 'package:knumovie/LandingPage/SearchedMovie.dart';
import 'package:knumovie/model/item.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FocusNode _focus = new FocusNode();
  final TextEditingController _mag = new TextEditingController();
  String hintText = '';
  double height = 0.0;

  Item selectedMenu;
  Item menuItem;
  List<Item> menuContents = <Item>[
    const Item('Movies', Icon(Icons.movie, color: Color(0xFFE57373))),
    const Item('Episodes', Icon(Icons.tv, color: Color(0xFFE57373))),
    const Item('Actors', Icon(Icons.recent_actors, color: Color(0xFFE57373))),
    const Item(
        'Directors', Icon(Icons.recent_actors, color: Color(0xFFE57373))),
    const Item('Detail', Icon(Icons.image_search, color: Color(0xFFE57373))),
  ];

  List<Widget> pageChildren(double width) {
    if (selectedMenu == null) selectedMenu = menuContents[0];
    return <Widget>[
      Container(
        width: width,
        child: Column(
          children: [
            Container(
              width: 500,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  DropdownButton<Item>(
                    value: selectedMenu,
                    onChanged: (Item Value) {
                      setState(() {
                        selectedMenu = Value;
                      });
                    },
                    items: menuContents.map((Item menu) {
                      return DropdownMenuItem<Item>(
                          value: menu,
                          child: Row(
                            children: <Widget>[
                              menu.icon,
                              SizedBox(width: 10),
                              Text(menu.name,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.red[300]))
                            ],
                          ));
                    }).toList(),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                        cursorColor: Colors.red[300],
                        // focusNode: _focus,
                        style: TextStyle(color: Colors.red[300]),
                        controller: _mag,
                        onSubmitted: _handleSubmitted,
                        decoration: InputDecoration.collapsed(
                            hintText: "",
                            hintStyle: TextStyle(
                                color: Colors.red[300], fontSize: 13))),
                  ),
                  IconButton(
                      onPressed: () {
                        _handleSubmitted(_mag.text);
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.red[300],
                      )),
                ],
              ),
            ),
          ],
        ),
      )
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

  // @override
  // void initState() {
  //   super.initState();
  //   _focus.addListener(_onFocusChange);
  // }

  // void _onFocusChange() {
  //   debugPrint("Focus: " + _focus.hasFocus.toString());
  //   if (_focus.hasFocus) {
  //     hintText = '';
  //     height = 255.0;
  //   } else {
  //     hintText = '';
  //     height = 0.0;
  //   }
  //   setState(() {});
  // }

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
