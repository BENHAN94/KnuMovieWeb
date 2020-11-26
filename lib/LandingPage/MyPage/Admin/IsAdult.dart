import 'package:flutter/material.dart';

class IsAdult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //제약조건에 따라 내용물 결정
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopIsAdult();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopIsAdult();
        } else {
          return MobileIsAdult();
        }
      },
    );
  }
}

class DesktopIsAdult extends StatefulWidget {
  @override
  _DesktopIsAdultState createState() => _DesktopIsAdultState();
}

class _DesktopIsAdultState extends State<DesktopIsAdult> {
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
              "IsAdult",
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
              Icons.face,
              color: Colors.grey,
            ),
          ),
          MaterialButton(
            child: Text(
              "Yes",
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
              Icons.tag_faces,
              color: Colors.grey,
            ),
          ),
          MaterialButton(
            child: Text(
              "No",
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

class MobileIsAdult extends StatefulWidget {
  @override
  _MobileIsAdultState createState() => _MobileIsAdultState();
}

class _MobileIsAdultState extends State<MobileIsAdult> {
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
              "IsAdult",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          MaterialButton(
            child: Text(
              "Yes",
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
              "No",
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
