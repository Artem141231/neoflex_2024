import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_2/12.4/main.dart'; // Путь к вашему приложению

void main() {
  IntegrationTestWidgetsFlutterBinding
      .ensureInitialized(); // Инициализация для интеграционных тестов

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      // Загружаем виджет приложения
      await tester.pumpWidget(const MyApp());

      // Проверяем, что счётчик начинается с 0
      expect(find.text('0'), findsOneWidget);

      // Находим кнопку для увеличения счётчика
      final Finder fab = find.byTooltip('Increment');

      // Эмулируем клик по кнопке
      await tester.tap(fab);

      // Ждём, пока обновится состояние
      await tester.pumpAndSettle();

      // Проверяем, что счётчик увеличился на 1
      expect(find.text('1'), findsOneWidget);
    });
  });
}
