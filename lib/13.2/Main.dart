import 'user.dart'; // Импорт вашего класса User

void main() {
  // Создание экземпляра
  final user = User(
      id: 1, name: 'John', email: 'john@example.com', avatar: 'avatar_url');

  // Преобразование в JSON
  final userJson = user.toJson();
  print(userJson);

  // Создание нового объекта с изменением некоторых данных
  final updatedUser = user.copyWith(email: 'new_email@example.com');

  // Преобразование из JSON
  final newUser = User.fromJson({
    'id': 1,
    'name': 'John',
    'email': 'john@example.com',
    'avatar': 'avatar_url'
  });

  print(user == newUser); // Проверка на равенство
}
