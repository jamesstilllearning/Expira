// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outbox_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateImpl _$$CreateImplFromJson(Map<String, dynamic> json) => _$CreateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateImplToJson(_$CreateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UpdateImpl _$$UpdateImplFromJson(Map<String, dynamic> json) => _$UpdateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UpdateImplToJson(_$UpdateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$DeleteImpl _$$DeleteImplFromJson(Map<String, dynamic> json) => _$DeleteImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeleteImplToJson(_$DeleteImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MarkUsedImpl _$$MarkUsedImplFromJson(Map<String, dynamic> json) =>
    _$MarkUsedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MarkUsedImplToJson(_$MarkUsedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ConsumptionImpl _$$ConsumptionImplFromJson(Map<String, dynamic> json) =>
    _$ConsumptionImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConsumptionImplToJson(_$ConsumptionImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PendingImpl _$$PendingImplFromJson(Map<String, dynamic> json) =>
    _$PendingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PendingImplToJson(_$PendingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ProcessingImpl _$$ProcessingImplFromJson(Map<String, dynamic> json) =>
    _$ProcessingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ProcessingImplToJson(_$ProcessingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SyncedImpl _$$SyncedImplFromJson(Map<String, dynamic> json) => _$SyncedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SyncedImplToJson(_$SyncedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FailedImpl _$$FailedImplFromJson(Map<String, dynamic> json) => _$FailedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailedImplToJson(_$FailedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$OutboxEntryImpl _$$OutboxEntryImplFromJson(Map<String, dynamic> json) =>
    _$OutboxEntryImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      operation:
          OutboxOperation.fromJson(json['operation'] as Map<String, dynamic>),
      entityType:
          OutboxEntityType.fromJson(json['entityType'] as Map<String, dynamic>),
      entityId: json['entityId'] as String,
      payload: json['payload'] as String,
      expectedVersion: (json['expectedVersion'] as num?)?.toInt() ?? 1,
      createdAt: DateTime.parse(json['createdAt'] as String),
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      lastError: json['lastError'] as String? ?? '',
      status: json['status'] == null
          ? const OutboxStatus.pending()
          : OutboxStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OutboxEntryImplToJson(_$OutboxEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operation': instance.operation,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'payload': instance.payload,
      'expectedVersion': instance.expectedVersion,
      'createdAt': instance.createdAt.toIso8601String(),
      'retryCount': instance.retryCount,
      'lastError': instance.lastError,
      'status': instance.status,
    };
