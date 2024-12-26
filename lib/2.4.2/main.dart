import 'package: flutter/material.dart';

void main() {
runApp (app: MaterialApp(
home: Counter(),
)); // MaterialApp
}
class Counter extends StatefulWidget {
Counter({super.key});
@override
CounterState createState() _CounterState();
}
class CounterState extends State<Counter> {
int value = 0;
@override
Widget build (BuildContext context) {
return ElevatedButton(
child: Text(data: "Value: $value", style: TextStyle (fontSize: 22)),
onPressed: () {
setState(fn: () {
value++;
});
}); // ElevatedButton
}
}