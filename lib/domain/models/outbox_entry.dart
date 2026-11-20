import 'package:freezed_annotation/freezed_annotation.dart';

part 'outbox_entry.freezed.dart';
part 'outbox_entry.g.dart';

/// Operation type for outbox entries.
@freezed
abstract class OutboxOperation with _$OutboxOperation {
  const OutboxOperation._();

  const factory OutboxOperation.create() = Create;
  const factory OutboxOperation.update() = Update;
  const factory OutboxOperation.delete() = Delete;
  const factory OutboxOperation.markUsed() = MarkUsed;

  factory OutboxOperation.fromJson(Map<String, dynamic> json) => _$OutboxOperationFromJson(json);

  String get value => switch (this) {
        Create() => 'create',
        Update() => 'update',
        Delete() => 'delete',
        MarkUsed() => 'mark_used',
        _ => 'unknown',
      };

  static OutboxOperation fromString(String value) {
    return switch (value) {
      'create' => const Create(),
      'update' => const Update(),
      'delete' => const Delete(),
      'mark_used' => const MarkUsed(),
      _ => const Create(),
    };
  }
}

/// Entity type for outbox entries.
@freezed
abstract class OutboxEntityType with _$OutboxEntityType {
  const OutboxEntityType._();

  const factory OutboxEntityType.item() = Item;
  const factory OutboxEntityType.consumption() = Consumption;

  factory OutboxEntityType.fromJson(Map<String, dynamic> json) => _$OutboxEntityTypeFromJson(json);

  String get value => switch (this) {
        Item() => 'item',
        Consumption() => 'consumption',
        _ => 'unknown',
      };

  static OutboxEntityType fromString(String value) {
    return switch (value) {
      'item' => const Item(),
      'consumption' => const Consumption(),
      _ => const Item(),
    };
  }
}

/// Sync status for outbox entries.
@freezed
abstract class OutboxStatus with _$OutboxStatus {
  const OutboxStatus._();

  const factory OutboxStatus.pending() = Pending;
  const factory OutboxStatus.processing() = Processing;
  const factory OutboxStatus.synced() = Synced;
  const factory OutboxStatus.failed() = Failed;

  factory OutboxStatus.fromJson(Map<String, dynamic> json) => _$OutboxStatusFromJson(json);

  String get value => switch (this) {
        Pending() => 'pending',
        Processing() => 'processing',
        Synced() => 'synced',
        Failed() => 'failed',
        _ => 'unknown',
      };

  static OutboxStatus fromString(String value) {
    return switch (value) {
      'pending' => const Pending(),
      'processing' => const Processing(),
      'synced' => const Synced(),
      'failed' => const Failed(),
      _ => const Pending(),
    };
  }
}

/// Outbox entry representing a pending sync operation.
@freezed
abstract class OutboxEntry with _$OutboxEntry {
  const OutboxEntry._();

  const factory OutboxEntry({
    /// Local database ID (auto-increment)
    @Default(0) int id,

    /// Operation type
    required OutboxOperation operation,

    /// Entity type
    required OutboxEntityType entityType,

    /// Entity ID (item.id or consumption.record_id)
    required String entityId,

    /// Full entity payload as JSON at time of mutation
    required String payload,

    /// Expected version for optimistic locking
    @Default(1) int expectedVersion,

    /// Creation timestamp (UTC)
    required DateTime createdAt,

    /// Retry count
    @Default(0) int retryCount,

    /// Last error message (if failed)
    @Default('') String lastError,

    /// Current sync status
    @Default(OutboxStatus.pending()) OutboxStatus status,
  }) = _OutboxEntry;

  factory OutboxEntry.fromJson(Map<String, dynamic> json) => _$OutboxEntryFromJson(json);

  /// Returns true if this entry can be retried.
  bool get canRetry => status == OutboxStatus.failed() && retryCount < 5;

  /// Creates a copy with updated status.
  OutboxEntry withStatus(OutboxStatus newStatus, {String? error}) {
    return copyWith(
      status: newStatus,
      lastError: error ?? lastError,
      retryCount: newStatus == OutboxStatus.failed() ? retryCount + 1 : retryCount,
    );
  }

  /// Creates a copy marked as processing.
  OutboxEntry markProcessing() => withStatus(OutboxStatus.processing());

  /// Creates a copy marked as synced.
  OutboxEntry markSynced() => withStatus(OutboxStatus.synced());

  /// Creates a copy marked as failed with error.
  OutboxEntry markFailed(String error) => withStatus(OutboxStatus.failed(), error: error);
}