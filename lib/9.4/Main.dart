import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AppData(backgroundColor: Colors.green)),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}

class AppData with ChangeNotifier {
  Color backgroundColor;

  AppData({required this.backgroundColor});

  void changeBackgroundColor(Color newColor) {
    backgroundColor = newColor;
    notifyListeners(); // Уведомляем об изменении
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: context.watch<AppData>().backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.watch<AppData>().backgroundColor.toString(),
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<AppData>()
                      .changeBackgroundColor(Util.randomColor());
                },
                child: const Text('Change color'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Util {
  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff));
  }
}
