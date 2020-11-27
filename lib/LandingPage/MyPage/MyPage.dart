import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/MyPage/AccountInfo.dart';
import 'package:knumovie/LandingPage/MyPage/Admin/AdminRegistPage.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'MyMovie.dart';

class MyPage extends StatelessWidget {
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
            padding: EdgeInsets.only(top: 100.0),
          ),
          SelectPage(),
        ],
      ),
    ));
  }
}

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopSelectPage();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return TabletSelectPage();
        } else {
          return MobileSelectPage();
        }
      },
    );
  }
}

class DesktopSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          SizedBox(
            width: 60.0,
          ),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "My Movie List",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyMovie()));
              },
            ),
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "Account Information",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AccountInfo()));
              },
            ),
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "Admin Function",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AdminRegistFunction()));
              },
            ),
          ]),
          SizedBox(
            width: 60.0,
          ),
        ]));
  }
}

class TabletSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          SizedBox(
            width: 60.0,
          ),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "My Movie List",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyMovie()));
              },
            ),
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "Account Information",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AccountInfo()));
              },
            ),
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "Admin Function",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AdminRegistFunction()));
              },
            ),
          ]),
          SizedBox(
            width: 60.0,
          ),
        ]));
  }
}

class MobileSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          SizedBox(
            width: 20.0,
          ),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "My Movie List",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyMovie()));
              },
            ),
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "Account Information",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AccountInfo()));
              },
            ),
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/images/knuknu.png",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              borderSide: BorderSide.none,
              child: Text(
                "Admin Function",
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AdminRegistFunction()));
              },
            ),
          ]),
          SizedBox(
            width: 20.0,
          ),
        ]));
  }
}
