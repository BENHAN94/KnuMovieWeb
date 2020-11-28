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
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(
            width: 40.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.7,
            color: Colors.red[50],
            child: TextField(
              controller: text,
              style: TextStyle(
                fontSize: 15.0,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[50],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[50],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: "$content",
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
