import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/MyPage/MyPage.dart';
import 'package:knumovie/LandingPage/SignUp/SignUpPage.dart';

import '../main.dart';

//Navbar의 LayoutBuilder
class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DesktopNavbar의 전체 padding
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                "assets/images/knu.png",
                width: 200,
                height: 80,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => KnuMovie()));
                      },
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignUpPage()));
                      },
                      child: Text(
                        "Sign In/Up",
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  RaisedButton(
                      onPressed: () {
                        if (true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyPage()));
                        } else {
                          showDialog(
                              context: context,
                              child: AlertDialog(
                                title: Text("로그인 하셨나요?"),
                                actions: <Widget>[
                                  OutlineButton(
                                    child: Text("Close"),
                                    borderSide: BorderSide.none,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ));
                        }
                      },
                      child: Text(
                        "My Page",
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Knu Movie",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        color: Colors.red[300],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      KnuMovie()));
                        },
                        child: Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpPage()));
                        },
                        child: Text(
                          "Sign In/Up",
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyPage()));
                        },
                        child: Text(
                          "My Page",
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
