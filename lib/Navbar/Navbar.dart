import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/MyPage/MyPage.dart';
import 'package:knumovie/LandingPage/SignIn/SignInPage.dart';

import '../main.dart';

//Navbar의 LayoutBuilder
class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1300) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1300) {
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                "assets/images/knu.png",
                width: 130,
                height: 35,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                      color: Colors.red[300],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => KnuMovie()));
                      },
                      child: Icon(
                        Icons.home_rounded,
                        color: Colors.white,
                      )

                      /*Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      )*/
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                      color: Colors.red[300],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignInPage()));
                      },
                      child: Icon(
                        Icons.login_outlined,
                        color: Colors.white,
                      )
                      /*Text(
                        "Sign In/Up",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      )*/
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                      color: Colors.red[300],
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
                                  RaisedButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ));
                        }
                      },
                      child: Icon(
                        Icons.account_box,
                        color: Colors.white,
                      )
                      /*Text(
                        "My Page",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      )*/
                      ),
                  SizedBox(
                    width: 10,
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
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "KNU Movie",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 1.5,
                      color: Colors.black45,
                    ),
                  ]),
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
                        child: Icon(
                          Icons.home_rounded,
                          color: Colors.white,
                        )

                        /*Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      )*/
                        ),
                    SizedBox(
                      width: 30,
                    ),
                    RaisedButton(
                        color: Colors.red[300],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignInPage()));
                        },
                        child: Icon(
                          Icons.login_outlined,
                          color: Colors.white,
                        )
                        /*Text(
                        "Sign In/Up",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      )*/
                        ),
                    SizedBox(
                      width: 30,
                    ),
                    RaisedButton(
                        color: Colors.red[300],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyPage()));
                        },
                        child: Icon(
                          Icons.account_box,
                          color: Colors.white,
                        )
                        /*Text(
                        "My Page",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      )*/
                        ),
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
