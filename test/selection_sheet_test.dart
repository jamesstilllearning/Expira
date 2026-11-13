import 'package:expira/widgets/searchable_selection_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Pumps a screen with a button that opens the sheet and records the result.
  Future<void> pumpOpener<T>(
    WidgetTester tester, {
    required List<SelectionOption<T>> options,
    required T current,
    required void Function(({T value})? choice) onResult,
  }) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () async {
                final choice = await showSearchableSelectionSheet<T>(
                  context,
                  title: 'Category',
                  searchHint: 'Search categories',
                  emptyMessage: 'No categories found',
                  options: options,
                  current: current,
                );
                onResult(choice);
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  final categories = [
    for (final c in ['Fridge', 'Freezer', 'Pantry'])
      SelectionOption<String>(value: c, label: c),
  ];

  testWidgets('typing filters the options', (tester) async {
    await pumpOpener<String>(tester,
        options: categories, current: 'Fridge', onResult: (_) {});

    await tester.enterText(find.byType(TextField), 'free');
    await tester.pump();

    expect(find.text('Freezer'), findsOneWidget);
    expect(find.text('Pantry'), findsNothing);
    expect(find.text('Fridge'), findsNothing);
  });

  testWidgets('shows an empty message when nothing matches', (tester) async {
    await pumpOpener<String>(tester,
        options: categories, current: 'Fridge', onResult: (_) {});

    await tester.enterText(find.byType(TextField), 'zzz');
    await tester.pump();

    expect(find.text('No categories found'), findsOneWidget);
  });

  testWidgets('tapping an option returns that value', (tester) async {
    ({String value})? result;
    await pumpOpener<String>(
      tester,
      options: categories,
      current: 'Fridge',
      onResult: (choice) => result = choice,
    );

    await tester.tap(find.text('Pantry'));
    await tester.pumpAndSettle();

    expect(result?.value, 'Pantry');
    expect(find.text('Pantry'), findsNothing);
  });

  testWidgets('a null option is returned as a value, not a dismissal',
      (tester) async {
    ({String? value})? result;
    await pumpOpener<String?>(
      tester,
      options: [
        const SelectionOption<String?>(value: null, label: 'No location'),
        const SelectionOption<String?>(value: 'Pantry', label: 'Pantry'),
      ],
      current: 'Pantry',
      onResult: (choice) => result = choice,
    );

    await tester.tap(find.text('No location'));
    await tester.pumpAndSettle();

    expect(result, isNotNull);
    expect(result!.value, isNull);
  });

  testWidgets('dismissing the sheet returns null', (tester) async {
    var called = false;
    ({String value})? result;
    await pumpOpener<String>(
      tester,
      options: categories,
      current: 'Fridge',
      onResult: (choice) {
        called = true;
        result = choice;
      },
    );

    await tester.tapAt(const Offset(4, 4));
    await tester.pumpAndSettle();

    expect(called, isTrue);
    expect(result, isNull);
  });
}
