import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart'; // Сгенерированный файл с методами Freezed
part 'user.g.dart'; // Сгенерированный файл для сериализации в/из JSON

@freezed
class User with _$User {
  // Конструктор для модели
  const factory User({
    required int id,
    required String name,
    required String email,
    required String avatar,
  }) = _User;

  // Метод для создания экземпляра из JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
