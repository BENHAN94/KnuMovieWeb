import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/SignUp/SignUpPage.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/main.dart';
import 'package:knumovie/model/account.dart';
import '../../API.dart';
import '../../User.dart';
import '../SignUp/input_field.dart';
import 'SignInPage.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1400) {
          return DesktopSignIn();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1400) {
          return TabletSignIn();
        } else {
          return MobileSignIn();
        }
      },
    );
  }
}

class DesktopSignIn extends StatelessWidget {
  final TextEditingController _mag = new TextEditingController();
  final TextEditingController _mag2 = new TextEditingController();

  final account = Account();
  final api = API();
  final scaffoldKey = SignInPage.scaffoldKey;

  Future<bool> signIn(String email, String password) async {
    final fac = api.signin(email, password);
    final ac = await fac;
    if (ac != null) {
      User.email = ac.email;
      User.lname = ac.lastName;
      User.fname = ac.firstName;
      User.sid = ac.sid;
      if (ac.isAdmin != null) {
        User.isAdmin = ac.isAdmin;
      }
      if (ac.address != null) {
        User.address = ac.address;
      }
      if (ac.birthday != null) {
        User.birthday = ac.birthday;
      }
      if (ac.job != null) {
        User.job = ac.job;
      }
      if (ac.phone != null) {
        User.phone = ac.phone;
      }
      if (ac.sex != null) {
        User.sex = ac.sex;
      }
      return true;
    }
    return false;
  }

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
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 4.0,
                height: MediaQuery.of(context).size.height / 1.3,
                color: Colors.red[300],
                child: Padding(
                  padding: EdgeInsets.only(top: 0.0, right: 50.0, left: 50.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Icon(
                              Icons.login,
                              color: Colors.white,
                              size: 200,
                            )),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        RaisedButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SignUpPage();
                              },
                            ));
                          },
                          child: Text(
                            "SignUp",
                            style:
                                TextStyle(color: Colors.red[300], fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40.0, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "SignIn",
                      style: TextStyle(
                          color: Colors.red[300],
                          fontWeight: FontWeight.w300,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    InputField(
                      label: "Email",
                      content: "Email",
                      text: _mag,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputPasswordField(
                      label: "Password",
                      content: "********",
                      text: _mag2,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width / 7),
                        FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KnuMovie(),
                                ));
                          },
                          child: Text("Cancel",
                              style: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FlatButton(
                          color: Colors.red[300],
                          onPressed: () async {
                            final fl = signIn(_mag.text, _mag2.text);
                            final isSuccess = await fl;
                            if (isSuccess) {
                              final snackbar = SnackBar(
                                  content: Text(
                                '로그인 완료!',
                              ));
                              Scaffold.of(context).showSnackBar(snackbar);
                              Future.delayed(const Duration(milliseconds: 1000),
                                  () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => KnuMovie(),
                                    ));
                              });
                            } else {
                              final snackbar = SnackBar(
                                  content: Text('이메일 또는 비밀번호를 다시 확인해주세요.'));
                              Scaffold.of(context).showSnackBar(snackbar);
                            }
                          },
                          child: Text(
                            "SignIn",
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

class TabletSignIn extends StatelessWidget {
  final TextEditingController _mag = new TextEditingController();
  final TextEditingController _mag2 = new TextEditingController();

  final account = Account();
  final api = API();
  final scaffoldKey = SignInPage.scaffoldKey;
  Future<bool> signIn(String email, String password) async {
    final fac = api.signin(email, password);
    final ac = await fac;
    if (ac != null) {
      User.email = ac.email;
      User.lname = ac.lastName;
      User.fname = ac.firstName;
      User.sid = ac.sid;
      if (ac.isAdmin != null) {
        User.isAdmin = ac.isAdmin;
      }
      if (ac.address != null) {
        User.address = ac.address;
      }
      if (ac.birthday != null) {
        User.birthday = ac.birthday;
      }
      if (ac.job != null) {
        User.job = ac.job;
      }
      if (ac.phone != null) {
        User.phone = ac.phone;
      }
      if (ac.sex != null) {
        User.sex = ac.sex;
      }
      return true;
    }
    return false;
  }

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
                width: MediaQuery.of(context).size.width / 3.0,
                height: MediaQuery.of(context).size.height / 1.3,
                color: Colors.red[300],
                child: Padding(
                  padding: EdgeInsets.only(top: 0.0, right: 50.0, left: 50.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Icon(
                              Icons.login,
                              color: Colors.white,
                              size: 200,
                            )),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        RaisedButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SignUpPage();
                              },
                            ));
                          },
                          child: Text("SignUp",
                              style: TextStyle(
                                color: Colors.red[300],
                                fontSize: 20,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40.0, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "SignIn",
                      style: TextStyle(
                          color: Colors.red[300],
                          fontWeight: FontWeight.w300,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    InputField(
                      label: "email",
                      content: "email",
                      text: _mag,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(
                      label: "Password",
                      content: "********",
                      text: _mag2,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width / 6),
                        FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KnuMovie(),
                                ));
                          },
                          child: Text("Cancel",
                              style: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FlatButton(
                          color: Colors.red[300],
                          onPressed: () async {
                            final fl = signIn(_mag.text, _mag2.text);
                            final isSuccess = await fl;
                            if (isSuccess) {
                              final snackbar = SnackBar(
                                  content: Text(
                                '로그인 완료!',
                              ));
                              Scaffold.of(context).showSnackBar(snackbar);
                              Future.delayed(const Duration(milliseconds: 1000),
                                  () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => KnuMovie(),
                                    ));
                              });
                            } else {
                              final snackbar = SnackBar(
                                  content: Text('이메일 또는 비밀번호를 다시 확인해주세요.'));
                              Scaffold.of(context).showSnackBar(snackbar);
                            }
                          },
                          child: Text(
                            "SignIn",
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

class MobileSignIn extends StatelessWidget {
  final TextEditingController _mag = new TextEditingController();
  final TextEditingController _mag2 = new TextEditingController();
  final account = Account();
  final api = API();
  final scaffoldKey = SignInPage.scaffoldKey;
  Future<bool> signIn(String email, String password) async {
    final fac = api.signin(email, password);
    final ac = await fac;
    if (ac != null) {
      User.email = ac.email;
      User.lname = ac.lastName;
      User.fname = ac.firstName;
      User.sid = ac.sid;
      if (ac.isAdmin != null) {
        User.isAdmin = ac.isAdmin;
      }
      if (ac.address != null) {
        User.address = ac.address;
      }
      if (ac.birthday != null) {
        User.birthday = ac.birthday;
      }
      if (ac.job != null) {
        User.job = ac.job;
      }
      if (ac.phone != null) {
        User.phone = ac.phone;
      }
      if (ac.sex != null) {
        User.sex = ac.sex;
      }
      return true;
    }
    return false;
  }

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
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.only(
                top: 100.0, right: 30.0, left: 130.0, bottom: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SignIn",
                  style: TextStyle(
                      color: Colors.red[300],
                      fontWeight: FontWeight.w300,
                      fontSize: 35.0,
                      fontFamily: 'Montserrat'),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                InputField(
                  label: "email",
                  content: "email",
                  text: _mag,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InputField(
                  label: "Password",
                  content: "********",
                  text: _mag2,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red[300],
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignUpPage();
                          },
                        ));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KnuMovie(),
                            ));
                      },
                      child: Text("Cancel",
                          style: TextStyle(color: Colors.black54)),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlatButton(
                      color: Colors.red[300],
                      onPressed: () async {
                        final fl = signIn(_mag.text, _mag2.text);
                        final isSuccess = await fl;
                        if (isSuccess) {
                          final snackbar = SnackBar(
                              content: Text(
                            '로그인 완료!',
                          ));
                          Scaffold.of(context).showSnackBar(snackbar);
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KnuMovie(),
                                ));
                          });
                        } else {
                          final snackbar = SnackBar(
                              content: Text('이메일 또는 비밀번호를 다시 확인해주세요.'));
                          Scaffold.of(context).showSnackBar(snackbar);
                        }
                      },
                      child: Text(
                        "SignIn",
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
