import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/LandingPage.dart';
import 'package:knumovie/LandingPage/SignIn/SignInPage.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/main.dart';
import 'gender.dart';
import 'input_field.dart';

class SignHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1400) {
          return DesktopSignHome();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1400) {
          return TabletSignHome();
        } else {
          return MobileSignHome();
        }
      },
    );
  }
}

class DesktopSignHome extends StatelessWidget {
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
                  padding: EdgeInsets.only(top: 85.0, right: 50.0, left: 50.0),
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
                            "Go ahead \ncreate Account",
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
                            "It should",
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
                                return SignInPage();
                              },
                            ));
                          },
                          child: Text(
                            "SignIn",
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
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(
                      height: 21.0,
                    ),
                    InputField(label: "Username", content: "username"),
                    SizedBox(
                      height: 20.0,
                    ),
                    Gender(),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Date of birth", content: "03-04-2000"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Email", content: "anything@site.com"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Password", content: "********"),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          },
                          child: Text(
                            "CreateAccount",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}

class TabletSignHome extends StatelessWidget {
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
                  padding: EdgeInsets.only(top: 85.0, right: 50.0, left: 50.0),
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
                            "Go ahead \ncreate Account",
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
                            "It should",
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
                                return SignInPage();
                              },
                            ));
                          },
                          child: Text(
                            "SignIn",
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
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(
                      height: 21.0,
                    ),
                    InputField(label: "Username", content: "username"),
                    SizedBox(
                      height: 20.0,
                    ),
                    Gender(),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Date of birth", content: "03-04-2000"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Email", content: "anything@site.com"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Password", content: "********"),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          },
                          child: Text(
                            "CreateAccount",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}

class MobileSignHome extends StatelessWidget {
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
            padding: EdgeInsets.only(
                top: 100.0, right: 30.0, left: 130.0, bottom: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 35.0,
                      fontFamily: 'Montserrat'),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                InputField(label: "Username", content: "username"),
                SizedBox(
                  height: 20.0,
                ),
                Gender(),
                SizedBox(
                  height: 20.0,
                ),
                InputField(label: "Date of birth", content: "03-04-2000"),
                SizedBox(
                  height: 20.0,
                ),
                InputField(label: "Email", content: "anything@site.com"),
                SizedBox(
                  height: 20.0,
                ),
                InputField(label: "Password", content: "********"),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignInPage();
                          },
                        ));
                      },
                      child: Text(
                        "SignIn",
                        style: TextStyle(color: Colors.red[600]),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ));
                      },
                      child: Text(
                        "CreateAccount",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))
    ]);
  }
}
