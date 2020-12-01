import 'package:flutter/material.dart';
import 'package:knumovie/LandingPage/SignIn/SignInPage.dart';
import 'package:knumovie/Navbar/Navbar.dart';
import 'package:knumovie/main.dart';
import '../../API.dart';
import '../../User.dart';
import 'gender.dart';
import 'input_field.dart';

class SignHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1400) {
          return DesktopSignHome(4.0, 1.3);
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1400) {
          return DesktopSignHome(3.0, 1.1);
        } else {
          return MobileSignHome();
        }
      },
    );
  }
}

class DesktopSignHome extends StatelessWidget {
  double width = 1.0;
  double width1 = 1.0;
  final api = API();
  DesktopSignHome(double w, double w1) {
    width = w;
    width1 = w1;
  }
  final TextEditingController _emailInput = new TextEditingController();
  final TextEditingController _pwdInput = new TextEditingController();
  final TextEditingController _birthdayInput = new TextEditingController();
  final TextEditingController _fnameInput = new TextEditingController();
  final TextEditingController _lnameInput = new TextEditingController();

  Future<bool> signUp(
      String email, String password, String fname, String lname) async {
    final fac = api.signup(email, password, fname, lname);
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
          width: MediaQuery.of(context).size.width / width1,
          height: MediaQuery.of(context).size.height / 1.3,
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / width,
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
                              Icons.assignment,
                              color: Colors.white,
                              size: 200,
                            )
                            /*Text(
                            "Go ahead \ncreate Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900),
                          ),*/
                            ),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
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
                padding: EdgeInsets.only(left: 40.0, bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sign Up",
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
                      content: "anything@site.com",
                      text: _emailInput,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Gender(),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputPasswordField(
                      label: "Password",
                      content: "********",
                      text: _pwdInput,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(
                      label: "Firstname",
                      content: "firstname",
                      text: _fnameInput,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(
                      label: "Lastname",
                      content: "lastname",
                      text: _lnameInput,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InputField(
                      label: "Date of birth",
                      content: "1994-02-12",
                      text: _birthdayInput,
                    ),
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
                          child: Text("Cancel",
                              style: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FlatButton(
                          color: Colors.red[300],
                          onPressed: () async {
                            if (_emailInput.text != null &&
                                _pwdInput.text != null &&
                                _birthdayInput.text != null &&
                                _fnameInput.text != null &&
                                _lnameInput.text != null) {
                              final fsuc = signUp(
                                  _emailInput.text,
                                  _pwdInput.text,
                                  _fnameInput.text,
                                  _lnameInput.text);
                              final success = await fsuc;
                              if (success) {
                                api.updateAccount(
                                    User.email, 'sex', Gender.gender);
                                final snackbar = SnackBar(
                                    content: Text(
                                  '회원가입 완료!',
                                ));
                                Scaffold.of(context).showSnackBar(snackbar);
                                Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => KnuMovie(),
                                      ));
                                });
                              } else {
                                final snackbar = SnackBar(
                                    content: Text(
                                  '잘못 입력하셨습니다. 다시 입력해주세요.',
                                ));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
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
  final TextEditingController _emailInput = new TextEditingController();
  final TextEditingController _pwdInput = new TextEditingController();
  final TextEditingController _birthdayInput = new TextEditingController();
  final TextEditingController _fnameInput = new TextEditingController();
  final TextEditingController _lnameInput = new TextEditingController();
  final api = API();
  Future<bool> signUp(
      String email, String password, String fname, String lname) async {
    final fac = api.signup(email, password, fname, lname);
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
            padding: EdgeInsets.only(
                top: 100.0, right: 30.0, left: 130.0, bottom: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.w400,
                      fontSize: 35.0,
                      fontFamily: 'Montserrat'),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                InputField(
                  label: "Email",
                  content: "anything@site.com",
                  text: _emailInput,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Gender(),
                SizedBox(
                  height: 20.0,
                ),
                InputPasswordField(
                  label: "Password",
                  content: "********",
                  text: _pwdInput,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InputField(
                  label: "Firstname",
                  content: "firstname",
                  text: _fnameInput,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InputField(
                  label: "Lastname",
                  content: "lastname",
                  text: _lnameInput,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InputField(
                  label: "Date of birth",
                  content: "1994-02-12",
                  text: _birthdayInput,
                ),
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
                        style: TextStyle(color: Colors.red[300]),
                      ),
                    ),
                    SizedBox(width: 25),
                    FlatButton(
                      color: Colors.white,
                      onPressed: () async {
                        if (_emailInput.text != null &&
                            _pwdInput.text != null &&
                            _birthdayInput.text != null &&
                            _fnameInput.text != null &&
                            _lnameInput.text != null) {
                          final fsuc = signUp(_emailInput.text, _pwdInput.text,
                              _fnameInput.text, _lnameInput.text);
                          final success = await fsuc;
                          if (success) {
                            api.updateAccount(User.email, 'sex', Gender.gender);
                            final snackbar = SnackBar(
                                content: Text(
                              '회원가입 완료!',
                            ));
                            print(User.fname);
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
                                content: Text(
                              '잘못 입력하셨습니다. 다시 입력해주세요.',
                            ));
                            Scaffold.of(context).showSnackBar(snackbar);
                          }
                        }
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      width: 0.0,
                    ),
                    FlatButton(
                      color: Colors.red[300],
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
