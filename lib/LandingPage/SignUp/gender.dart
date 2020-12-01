import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  static var gender = '';
  Gender();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopGender();
        } else {
          return MobileGender();
        }
      },
    );
  }
}

class DesktopGender extends StatefulWidget {
  DesktopGender();
  static bool isMobile = isMobile;
  @override
  _DesktopGenderState createState() => _DesktopGenderState();
}

class _DesktopGenderState extends State<DesktopGender> {
  int red1 = 0;
  int red2 = 0;
  int maleSelected = 0;
  int femaleSelected = 0;
  Color colorTextInMaleButton = Colors.black54;
  Color colorTextInFemaleButton = Colors.black54;
  Color colorMaleButton = Colors.white;
  Color colorFemaleButton = Colors.white;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(
              "Gender",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red[300]),
            ),
          ),
          SizedBox(
            width: 40.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.red[50],
            child: Icon(
              Icons.tag_faces,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          MaterialButton(
            child: Text(
              "Male",
              textAlign: TextAlign.left,
              style: TextStyle(color: colorTextInMaleButton),
            ),
            color: colorMaleButton,
            onPressed: () {
              if (maleSelected == 0) {
                maleSelected = 1;
                femaleSelected = 0;
                Gender.gender = "Male";
                colorMaleButton = Colors.red[300];
                colorFemaleButton = Colors.white;
                colorTextInFemaleButton = Colors.black54;
                colorTextInMaleButton = Colors.white;
              } else {
                maleSelected = 0;
                femaleSelected = 0;
                colorMaleButton = Colors.white;
                colorFemaleButton = Colors.white;
                colorTextInFemaleButton = Colors.black54;
                colorTextInMaleButton = Colors.black54;
              }
              setState(() {});
            },
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.red[50],
            child: Icon(
              Icons.face,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          MaterialButton(
            child: Text(
              "Female",
              textAlign: TextAlign.left,
              style: TextStyle(color: colorTextInFemaleButton),
            ),
            color: colorFemaleButton,
            onPressed: () {
              if (femaleSelected == 0) {
                maleSelected = 0;
                femaleSelected = 1;
                Gender.gender = "Female";
                colorFemaleButton = Colors.red[300];
                colorMaleButton = Colors.white;
                colorTextInMaleButton = Colors.black54;
                colorTextInFemaleButton = Colors.white;
              } else {
                Gender.gender = null;
                maleSelected = 0;
                femaleSelected = 0;
                colorMaleButton = Colors.white;
                colorFemaleButton = Colors.white;
                colorTextInFemaleButton = Colors.black54;
                colorTextInMaleButton = Colors.black54;
              }
              setState(() {});
            },
          ),
        ],
      );
    });
  }
}

class MobileGender extends StatefulWidget {
  MobileGender();
  static bool isMobile = isMobile;
  @override
  _MobileGenderState createState() => _MobileGenderState();
}

class _MobileGenderState extends State<MobileGender> {
  int maleSelected = 0;
  int femaleSelected = 0;
  int red1 = 0;
  int red2 = 0;
  Color colorTextInMaleButton = Colors.black54;
  Color colorTextInFemaleButton = Colors.black54;
  Color colorMaleButton = Colors.white;
  Color colorFemaleButton = Colors.white;

  var gen = '';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(
              "Gender",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red[300]),
            ),
          ),
          SizedBox(
            width: 40.0,
          ),
          MaterialButton(
            child: Text(
              "Male",
              textAlign: TextAlign.left,
              style: TextStyle(color: colorTextInMaleButton),
            ),
            color: colorMaleButton,
            onPressed: () {
              if (maleSelected == 0) {
                maleSelected = 1;
                femaleSelected = 0;
                gen = "Male";
                colorMaleButton = Colors.red[300];
                colorFemaleButton = Colors.white;
                colorTextInFemaleButton = Colors.black54;
                colorTextInMaleButton = Colors.white;
              } else {
                maleSelected = 0;
                femaleSelected = 0;
                colorMaleButton = Colors.white;
                colorFemaleButton = Colors.white;
                colorTextInFemaleButton = Colors.black54;
                colorTextInMaleButton = Colors.black54;
              }
              setState(() {});
            },
          ),
          SizedBox(
            width: 20,
          ),
          MaterialButton(
            child: Text(
              "Female",
              textAlign: TextAlign.left,
              style: TextStyle(color: colorTextInFemaleButton),
            ),
            color: colorFemaleButton,
            onPressed: () {
              if (femaleSelected == 0) {
                maleSelected = 0;
                femaleSelected = 1;
                gen = "Female";
                colorFemaleButton = Colors.red[300];
                colorMaleButton = Colors.white;
                colorTextInMaleButton = Colors.black54;
                colorTextInFemaleButton = Colors.white;
              } else {
                gen = null;
                maleSelected = 0;
                femaleSelected = 0;
                colorMaleButton = Colors.white;
                colorFemaleButton = Colors.white;
                colorTextInFemaleButton = Colors.black54;
                colorTextInMaleButton = Colors.black54;
              }
              setState(() {});
            },
          ),
        ],
      );
    });
  }
}
