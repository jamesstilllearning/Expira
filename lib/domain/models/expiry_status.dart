import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expiry_status.freezed.dart';
part 'expiry_status.g.dart';

/// Expiry status classification for food items.
@freezed
sealed class ExpiryStatus with _$ExpiryStatus {
  const ExpiryStatus._();

  const factory ExpiryStatus.expired() = Expired;
  const factory ExpiryStatus.expiring() = Expiring;
  const factory ExpiryStatus.soon() = Soon;
  const factory ExpiryStatus.safe() = Safe;

  factory ExpiryStatus.fromJson(Map<String, dynamic> json) => _$ExpiryStatusFromJson(json);

  /// Returns the display label for this status.
  String get label => switch (this) {
        Expired() => 'Expired',
        Expiring() => 'Expiring',
        Soon() => 'Soon',
        Safe() => 'Safe',
        // Exhaustive switch - all cases covered by freezed sealed class
      };

  /// Returns the sort priority (lower = more urgent).
  int get priority => switch (this) {
        Expired() => 0,
        Expiring() => 1,
        Soon() => 2,
        Safe() => 3,
        // Exhaustive switch - all cases covered by freezed sealed class
      };

  /// Returns all statuses in priority order.
  static List<ExpiryStatus> get allInPriorityOrder => [
        const Expired(),
        const Expiring(),
        const Soon(),
        const Safe(),
      ];
}