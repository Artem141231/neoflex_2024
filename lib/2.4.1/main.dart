import 'package:flutter/material.dart';

void main() {
  runApp(
      app: MaterialApp(
    home: MyWidget(),
  ));
// MaterialApp
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(data: 'Привет, мир!');
  }
}
