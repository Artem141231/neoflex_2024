import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(AppDataProvider(
    appData: AppData(backgroundColor: Colors.green),
    child: const MyApp(),
  ));
}

class AppData {
  Color backgroundColor;

  AppData({required this.backgroundColor});

  void changeBackgroundColor(Color newColor) {
    backgroundColor = newColor;
  }
}

class AppDataProvider extends InheritedWidget {
  const AppDataProvider({
    required this.appData,
    required super.child,
    super.key,
  });

  final AppData appData;

  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  bool updateShouldNotify(AppDataProvider oldWidget) {
    return oldWidget.appData.backgroundColor != appData.backgroundColor;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Получаем данные из InheritedWidget
    final appData = AppDataProvider.of(context)?.appData;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: appData?.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Отображаем текущий цвет фона
              Text(appData?.backgroundColor.toString() ?? ''),
              ElevatedButton(
                onPressed: () {
                  // Меняем цвет при нажатии на кнопку
                  setState(() {
                    appData?.changeBackgroundColor(Util.randomColor());
                  });
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
