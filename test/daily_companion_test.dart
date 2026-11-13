import 'package:expira/data/daily_messages.dart';
import 'package:expira/services/daily_message.dart';
import 'package:expira/widgets/daily_companion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('daily message collection', () {
    test('has at least 30 non-blank, unique messages', () {
      expect(dailyInspirationMessages.length, greaterThanOrEqualTo(30));
      expect(
          dailyInspirationMessages.every((m) => m.trim().isNotEmpty), isTrue);
      expect(dailyInspirationMessages.toSet().length,
          dailyInspirationMessages.length);
    });
  });

  group('dailyMessageFor', () {
    test('same calendar day gives the same message at any time of day', () {
      final morning = DateTime(2030, 3, 14, 7, 5);
      final night = DateTime(2030, 3, 14, 23, 50);
      expect(dailyMessageFor(morning), dailyMessageFor(night));
    });

    test('a new calendar day gives a different message', () {
      final today = dailyMessageFor(DateTime(2030, 3, 14));
      final tomorrow = dailyMessageFor(DateTime(2030, 3, 15));
      expect(tomorrow, isNot(today));
    });

    test('the result is always from the collection', () {
      for (var day = 0; day < 400; day++) {
        final date = DateTime(2031, 1, 1).add(Duration(days: day));
        expect(dailyInspirationMessages, contains(dailyMessageFor(date)));
      }
    });

    test('is stable across daylight saving changes', () {
      // Clocks change at the end of March in many regions.
      final before = dailyMessageFor(DateTime(2030, 3, 30, 12));
      final after = dailyMessageFor(DateTime(2030, 3, 31, 12));
      expect(dailyMessageFor(DateTime(2030, 3, 30, 1)), before);
      expect(after, isNot(before));
    });
  });

  testWidgets('shows the supplied message in the speech bubble',
      (tester) async {
    const message = 'Small steps today make a brighter tomorrow!';
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: DailyCompanion(message: message)),
    ));
    await tester.pump();

    expect(find.text(message), findsOneWidget);
    expect(find.text('Hello!'), findsOneWidget);
  });
}
