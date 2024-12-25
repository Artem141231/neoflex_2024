import 'package:flutter/material.dart';
import 'dart:convert'; // Для работы с JSON

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Это JSON'),
        ),
        body: JsonExample(),
      ),
    );
  }
}

class JsonExample extends StatelessWidget {
  // Пример JSON-строки
  final String jsonString = '''
    {
      "name": "Иван",
      "age": 30,
      "city": "Москва"
    }
  ''';

  @override
  Widget build(BuildContext context) {
    // Парсинг JSON в карту (словарь)
    final Map<String, dynamic> data = jsonDecode(jsonString);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Имя: ${data['name']}'),
          Text('Возраст: ${data['age']}'),
          Text('Город: ${data['city']}'),
        ],
      ),
    );
  }
}
