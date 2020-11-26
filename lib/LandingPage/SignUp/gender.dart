import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopGender();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopGender();
        } else {
          return MobileGender();
        }
      },
    );
  }
}

class DesktopGender extends StatefulWidget {
  @override
  _DesktopGenderState createState() => _DesktopGenderState();
}

class _DesktopGenderState extends State<DesktopGender> {
  int selected = 0;
  int red1 = 0;
  int red2 = 0;
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
              style: TextStyle(color: Colors.red),
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
          MaterialButton(
            child: Text(
              "Male",
              textAlign: TextAlign.left,
            ),
            color: Color(red1),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red2 = 0;
                red1 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red1 = 0;
                setState(() {});
              }
            },
          ),
          CircleAvatar(
            backgroundColor: Colors.red[50],
            child: Icon(
              Icons.face,
              color: Colors.grey,
            ),
          ),
          MaterialButton(
            child: Text(
              "Female",
              textAlign: TextAlign.left,
            ),
            color: Color(red2),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red1 = 0;
                red2 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red2 = 0;
                setState(() {});
              }
            },
          ),
        ],
      );
    });
  }
}

class MobileGender extends StatefulWidget {
  @override
  _MobileGenderState createState() => _MobileGenderState();
}

class _MobileGenderState extends State<MobileGender> {
  int selected = 0;
  int red1 = 0;
  int red2 = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      int red = 0;
      return Row(
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(
              "Gender",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          MaterialButton(
            child: Text(
              "Male",
              textAlign: TextAlign.left,
            ),
            color: Color(red1),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red2 = 0;
                red1 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red1 = 0;
                setState(() {});
              }
            },
          ),
          MaterialButton(
            child: Text(
              "Female",
              textAlign: TextAlign.left,
            ),
            color: Color(red2),
            onPressed: () {
              if (selected == 0) {
                selected = 1;
                red1 = 0;
                red2 = 0xFFF44336;
                setState(() {});
              } else {
                selected = 0;
                red2 = 0;
                setState(() {});
              }
            },
          ),
        ],
      );
    });
  }
}
