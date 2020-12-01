import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/SignUp/gender.dart';
import 'package:knumovie/LandingPage/SignUp/input_field.dart';
import 'package:knumovie/Navbar/Navbar.dart';

import 'AccountrRate.dart';

class AccountInfo extends StatelessWidget {
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
          AccountInfos(),
        ],
      ),
    ));
  }
}

class AccountInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1400) {
          return DesktopAccountInfos();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1400) {
          return TabletAccountInfos();
        } else {
          return MobileAccountInfos();
        }
      },
    );
  }
}

class DesktopAccountInfos extends StatelessWidget {
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
          height: MediaQuery.of(context).size.height / 1.24,
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3.0,
                height: MediaQuery.of(context).size.height / 1.24,
                color: Colors.red[600],
                child: Padding(
                  padding: EdgeInsets.only(top: 185.0, right: 50.0, left: 50.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "Your Personal Information",
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
                            "It must be your Information",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RatePage(),
                                ));
                          },
                          child: Text("Your rate"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 40.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Personal Information",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(
                      height: 21.0,
                    ),
                    InputField(label: "Firstname", content: "호"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Lastname", content: "반우"),
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
                    InputField(label: "Phone", content: "010-0000-0000"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Address", content: "대구광역시 북구 대학로 00"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Job", content: "대학생"),
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
                            "Save",
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

class TabletAccountInfos extends StatelessWidget {
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
          height: MediaQuery.of(context).size.height / 1.24,
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3.0,
                height: MediaQuery.of(context).size.height / 1.24,
                color: Colors.red[600],
                child: Padding(
                  padding: EdgeInsets.only(top: 185.0, right: 50.0, left: 50.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "Your Personal Information",
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
                            "It must be your Information",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RatePage(),
                                ));
                          },
                          child: Text("Your rate"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 40.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Personal Information",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(
                      height: 21.0,
                    ),
                    InputField(label: "Firstname", content: "호"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Lastname", content: "반우"),
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
                    InputField(label: "Phone", content: "010-0000-0000"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Address", content: "대구광역시 북구 대학로 00"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Job", content: "대학생"),
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
                            "Save",
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

class MobileAccountInfos extends StatelessWidget {
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
          height: MediaQuery.of(context).size.height / 1.24,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 40.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Personal Information",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(
                      height: 21.0,
                    ),
                    InputField(label: "Firstname", content: "호"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Lastname", content: "반우"),
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
                    InputField(label: "Phone", content: "010-0000-0000"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Address", content: "대구광역시 북구 대학로 00"),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(label: "Job", content: "대학생"),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20.0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RatePage(),
                                ));
                          },
                          child: Text("Your rate"),
                        ),
                        SizedBox(
                          width: 60.0,
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
                            "Save",
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
