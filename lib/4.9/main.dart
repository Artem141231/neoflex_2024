import 'package:flutter/material.dart';

void main() {
  runApp(Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
      child: Stack(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            color: Colors.blueGrey,
          ),
          Container(
            width: 160,
            height: 160,
            color: Colors.cyan,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ],
      )));
}
