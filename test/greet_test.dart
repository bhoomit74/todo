import 'package:flutter_test/flutter_test.dart';
import 'package:todo/domain/enums/greet.dart';

void main() {
  group('Greet', () {
    // Test morning greeting
    test('returns Greet.morning for hours between 5 AM and 12 PM', () {
      DateTime morningTime = DateTime(2024, 1, 1, 6); // 6 AM
      Greet greet = Greet.currentGreet(morningTime.hour);
      expect(greet, Greet.morning);
    });

    // Test afternoon greeting
    test('returns Greet.afternoon for hours between 12 PM and 5 PM', () {
      DateTime afternoonTime = DateTime(2024, 1, 1, 13); // 1 PM
      Greet greet = Greet.currentGreet(afternoonTime.hour);
      expect(greet, Greet.afternoon);
    });

    // Test evening greeting
    test('returns Greet.evening for hours between 5 PM and midnight', () {
      DateTime eveningTime = DateTime(2024, 1, 1, 18); // 6 PM
      Greet greet = Greet.currentGreet(eveningTime.hour);
      expect(greet, Greet.evening);
    });

    // Test night greeting
    test('returns Greet.morning for hours between midnight and 5 AM', () {
      DateTime nightTime = DateTime(2024, 1, 1, 2); // 2 AM
      Greet greet = Greet.currentGreet(nightTime.hour);
      expect(greet, Greet.morning);
    });

    // Test message retrieval
    test('returns correct greet message based on current time', () {
      DateTime afternoonTime = DateTime(2024, 1, 1, 13); // 1 PM
      Greet greet = Greet.currentGreet(afternoonTime.hour);
      expect(greet.greetMessage, "Good Afternoon");
    });
  });
}
