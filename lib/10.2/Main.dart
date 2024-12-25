import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class Util {
  static Color randomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}

abstract class ColorEvent {}

class ColorChangePressed extends ColorEvent {}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.green) {
    on<ColorChangePressed>(
      (event, emit) => emit(Util.randomColor()),
    );
  }
}

// Главная страница
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Changer')),
      body: BlocProvider(
        create: (context) => ColorBloc(),
        child: Center(
          child: BlocBuilder<ColorBloc, Color>(
            builder: (context, state) {
              return Container(
                width: 200,
                height: 200,
                color: state,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Color: ${state.toString()}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ColorChangePressed());
                      },
                      child: const Text('Change Color'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
