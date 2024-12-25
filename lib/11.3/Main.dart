import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SQLite Desktop Example')),
        body: const DatabaseExample(),
      ),
    );
  }
}

class DatabaseExample extends StatefulWidget {
  const DatabaseExample({Key? key}) : super(key: key);

  @override
  _DatabaseExampleState createState() => _DatabaseExampleState();
}

class _DatabaseExampleState extends State<DatabaseExample> {
  late Database _database;
  final List<Map<String, dynamic>> _dogs = [];

  @override
  void initState() {
    super.initState();
    _setupDatabase();
  }

  // Настройка базы данных
  Future<void> _setupDatabase() async {
    // Определение пути к базе данных
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'doggie_database.db');

    // Открытие базы данных с созданием таблицы
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
    );
  }

  // Вставка данных
  Future<void> _insertDog(String name, int age) async {
    await _database.insert(
      'dogs',
      {'name': name, 'age': age},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _fetchDogs(); // Обновляем список
  }

  // Получение данных
  Future<void> _fetchDogs() async {
    final List<Map<String, dynamic>> dogs = await _database.query('dogs');
    setState(() {
      _dogs.clear();
      _dogs.addAll(dogs);
    });
  }

  // Удаление записи
  Future<void> _deleteDog(int id) async {
    await _database.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
    _fetchDogs(); // Обновляем список
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            await _insertDog('Buddy', 3);
          },
          child: const Text('Добавить собаку'),
        ),
        ElevatedButton(
          onPressed: _fetchDogs,
          child: const Text('Загрузить собак'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _dogs.length,
            itemBuilder: (context, index) {
              final dog = _dogs[index];
              return ListTile(
                title: Text(dog['name']),
                subtitle: Text('Возраст: ${dog['age']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteDog(dog['id']),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
