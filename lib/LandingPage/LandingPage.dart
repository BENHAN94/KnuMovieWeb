import 'dart:async';

import 'package:flutter/material.dart';
import 'package:knumovie/API.dart';
import 'package:knumovie/LandingPage/SearchedMovie.dart';
import 'package:knumovie/bloc/select_bloc.dart';
import 'package:knumovie/model/movie.dart';

import '../User.dart';
import 'SearchedMovie.dart';
import 'SelectedMovie.dart';
import 'package:knumovie/model/item.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FocusNode _focus = new FocusNode();
  final StreamController<List<Movie>> _streamController = StreamController();
  final TextEditingController _mag = new TextEditingController();
  final api = API();
  String text = 'toy';
  int mid;
  String hintText = '';
  double height = 0.0;

  final bloc = SelectBloc();

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
    bloc.fetchList(User.uid.toString(), title: text);
    if (selectedMenu == null) selectedMenu = menuContents[0];
    return <Widget>[
<<<<<<< HEAD
      FutureBuilder(
          future: api.selectMovie(2, title: text),
=======
      StreamBuilder(
          stream: bloc.selectedList,
>>>>>>> 0de82bd18c12f69756f2997e5dbc79c8cf8f8194
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData == false) {
              return Container();
            } else {
              return Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
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
                                        if (Value.name == 'Movies') {}
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
                                                        fontSize: 12,
                                                        color: Colors.red[300]))
                                              ],
                                            ));
                                      }).toList(),
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: TextField(
                                          cursorColor: Colors.red[300],
                                          // focusNode: _focus,
                                          style:
                                              TextStyle(color: Colors.red[300]),
                                          controller: _mag,
                                          onSubmitted: _handleSubmitted,
                                          decoration: InputDecoration.collapsed(
                                              hintText: "",
                                              hintStyle: TextStyle(
                                                  color: Colors.red[300],
                                                  fontSize: 13))),
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
                        ),
                        StreamBuilder<List<Movie>>(
                            stream: _streamController.stream,
                            initialData: snapshot.data,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Movie>> snapsho) {
                              return Padding(
                                  padding: EdgeInsets.only(top: 70.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.3,
                                      child: GridView.count(
                                          crossAxisCount: 3,
                                          childAspectRatio: 2.5 / 4.3,
                                          children: List.generate(
                                              snapsho.data.length, (index) {
                                            return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0),
                                                child: Hero(
                                                    tag: 'postImage$index',
                                                    child: RaisedButton(
                                                        color: Colors.white,
                                                        splashColor:
                                                            Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            side: BorderSide
                                                                .none),
                                                        child: Image.network(
                                                          snapshot.data[index]
                                                              .postImage,
                                                        ),
                                                        onPressed: () {
                                                          print(text);
                                                          print(index);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return DetailScreen(
                                                                1,
                                                                snapshot
                                                                    .data[index]
                                                                    .movieId,
                                                                index,
                                                                text);
                                                          }));
                                                        })));
                                          }))));
                            })
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
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
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _handleSubmitted(String text) {
    print(_mag.toString());
    text = _mag.text;
    text = text.toLowerCase();
    if (selectedMenu.name == 'Movies')
      bloc.fetchList(User.uid.toString(), title: text);
    else if (selectedMenu.name == 'Episodes')
      bloc.fetchList(User.uid.toString(), title: text, type: "tvseries");
    else if (selectedMenu.name == 'Actors')
      bloc.fetchList(User.uid.toString(), actor: text);
    else if (selectedMenu.name == 'Directors')
      bloc.fetchList(
        User.uid.toString(),
        director: text,
      );
    else {}
    _mag.clear();
  }
}
