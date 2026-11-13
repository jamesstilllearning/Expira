import 'dart:async';

import 'package:expira/controllers/settings_controller.dart';
import 'package:expira/models/app_settings.dart';
import 'package:expira/models/consumption_record.dart';
import 'package:expira/services/settings_storage.dart';
import 'package:expira/widgets/celebration_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _record = ConsumptionRecord(
  itemName: 'Milk',
  category: 'Fridge',
  expiryDate: DateTime(2100),
  usedOn: DateTime(2099),
  wasExpiringAtUse: false,
);

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('shows the celebration when the setting is on', (tester) async {
    final events = StreamController<ConsumptionRecord>.broadcast();
    final settings = SettingsController(SettingsStorage());

    await tester.pumpWidget(MaterialApp(
      home: CelebrationOverlay(
        consumptions: events.stream,
        settings: settings,
        child: const Text('home'),
      ),
    ));

    events.add(_record);
    await tester.pump();

    expect(find.text(CelebrationOverlay.message), findsOneWidget);
    await events.close();
  });

  testWidgets('stays hidden when Celebration Effects is off', (tester) async {
    final events = StreamController<ConsumptionRecord>.broadcast();
    final settings = SettingsController(SettingsStorage());
    await tester.runAsync(
      () => settings.apply(const AppSettings(celebrationEffects: false)),
    );

    await tester.pumpWidget(MaterialApp(
      home: CelebrationOverlay(
        consumptions: events.stream,
        settings: settings,
        child: const Text('home'),
      ),
    ));

    events.add(_record);
    await tester.pump();

    expect(find.text(CelebrationOverlay.message), findsNothing);
    expect(find.text('home'), findsOneWidget);
    await events.close();
  });
}
