import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewExample(),
    );
  }
}

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: Column(
        children: [
          // Первый ListView (вертикальный)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: const [
                Text(
                  "ListView (вертикальный):",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("Tom", style: TextStyle(fontSize: 22)),
                Text("Alice", style: TextStyle(fontSize: 22)),
                Text("Bob", style: TextStyle(fontSize: 22)),
                Text("Sam", style: TextStyle(fontSize: 22)),
                Text("Kate", style: TextStyle(fontSize: 22)),
              ],
            ),
          ),
          const Divider(thickness: 2, color: Colors.black),
          // Второй ListView (горизонтальный)
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: const [
                Text("ListView (горизонтальный): ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Tom", style: TextStyle(fontSize: 22)),
                SizedBox(width: 8),
                Text("Alice", style: TextStyle(fontSize: 22)),
                SizedBox(width: 8),
                Text("Bob", style: TextStyle(fontSize: 22)),
                SizedBox(width: 8),
                Text("Sam", style: TextStyle(fontSize: 22)),
              ],
            ),
          ),
          const Divider(thickness: 2, color: Colors.black),
          // Третий ListView (с разделителями)
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: 5,
              separatorBuilder: (context, index) => const Divider(thickness: 2),
              itemBuilder: (context, index) {
                const users = ["Tom", "Alice", "Bob", "Sam", "Kate"];
                return Text(
                  users[index],
                  style: const TextStyle(fontSize: 22),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
