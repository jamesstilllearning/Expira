import 'package:flutter/foundation.dart';

import 'consumption_record.dart';

/// Summary statistics derived from consumption records.
@immutable
class ImpactStats {
  const ImpactStats({
    required this.totalConsumed,
    required this.usedBeforeExpiry,
    required this.savedFromExpiring,
  });

  factory ImpactStats.fromRecords(Iterable<ConsumptionRecord> records) {
    var total = 0;
    var beforeExpiry = 0;
    var saved = 0;
    for (final record in records) {
      total++;
      if (record.usedBeforeExpiry) {
        beforeExpiry++;
        if (record.wasExpiringAtUse) saved++;
      }
    }
    return ImpactStats(
      totalConsumed: total,
      usedBeforeExpiry: beforeExpiry,
      savedFromExpiring: saved,
    );
  }

  final int totalConsumed;
  final int usedBeforeExpiry;
  final int savedFromExpiring;

  double get usedBeforeExpiryRate =>
      totalConsumed == 0 ? 0 : usedBeforeExpiry / totalConsumed;
}
