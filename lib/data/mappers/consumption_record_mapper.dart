import 'package:expira/domain/models/consumption_record.dart' as domain;
import 'package:expira/models/consumption_record.dart' as legacy;

/// Mapper to convert between domain and legacy ConsumptionRecord models.
class ConsumptionRecordMapper {
  ConsumptionRecordMapper._();

  /// Converts a legacy ConsumptionRecord to a domain ConsumptionRecord.
  static domain.ConsumptionRecord toDomain(legacy.ConsumptionRecord legacy) {
    return domain.ConsumptionRecord(
      id: '', // Legacy doesn't have id
      itemId: legacy.itemName, // Legacy doesn't have itemId, use itemName as fallback
      itemName: legacy.itemName,
      category: legacy.category,
      expiryDate: legacy.expiryDate,
      usedOn: legacy.usedOn,
      usedBy: '', // Legacy doesn't track who used it
      wasExpiringAtUse: legacy.wasExpiringAtUse,
    );
  }

  /// Converts a domain ConsumptionRecord to a legacy ConsumptionRecord.
  static legacy.ConsumptionRecord toLegacy(domain.ConsumptionRecord domain) {
    return legacy.ConsumptionRecord(
      itemName: domain.itemName,
      category: domain.category,
      expiryDate: domain.expiryDate,
      usedOn: domain.usedOn,
      wasExpiringAtUse: domain.wasExpiringAtUse,
    );
  }

  /// Converts a list of legacy records to domain records.
  static List<domain.ConsumptionRecord> toDomainList(List<legacy.ConsumptionRecord> legacy) {
    return legacy.map(toDomain).toList();
  }

  /// Converts a list of domain records to legacy records.
  static List<legacy.ConsumptionRecord> toLegacyList(List<domain.ConsumptionRecord> domain) {
    return domain.map(toLegacy).toList();
  }
}