import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Secession'),
    home: const MyHomePage(),
  )); // MaterialApp
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пример шрифта'),
        centerTitle: true,
      ), // AppBar
      body: const Align(
        alignment: Alignment.center,
        child: Text(
          'Кастомный Шрифт',
          style: TextStyle(fontFamily: 'Шрифт', fontSize: 72),
        ), // Text
      ), // Align
    ); // Scaffold
  }
}
