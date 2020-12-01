import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;
  var text = TextEditingController();

  InputField({this.label, this.content, this.text});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(
              "$label",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red[300]),
            ),
          ),
          SizedBox(
            width: 40.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.7,
            color: Colors.white,
            child: TextField(
              controller: text,
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 15.0,
              ),
              decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[50],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[50],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "$content",
                hintStyle: TextStyle(color: Colors.black54),
                fillColor: Colors.red[50],
              ),
            ),
          ),
          SizedBox(
            width: 70.0,
          ),
        ],
      );
    });
  }
}

class InputPasswordField extends StatelessWidget {
  final String label;
  final String content;
  var text = TextEditingController();

  InputPasswordField({this.label, this.content, this.text});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(
              "$label",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red[300]),
            ),
          ),
          SizedBox(
            width: 40.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.7,
            color: Colors.white,
            child: TextFormField(
              obscureText: true,
              controller: text,
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 15.0,
              ),
              decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[50],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[50],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "$content",
                hintStyle: TextStyle(color: Colors.black54),
                fillColor: Colors.red[50],
              ),
            ),
          ),
          SizedBox(
            width: 70.0,
          ),
        ],
      );
    });
  }
}
