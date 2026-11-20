// Domain models exports
export 'food_item.dart';
export 'storage_location.dart';
export 'expiry_status.dart' hide Expired;
export 'consumption_record.dart';
export 'app_settings.dart';
export 'catalog_product.dart' hide Pending;
export 'household.dart' hide Expired;
export 'user_profile.dart';
export 'notification_record.dart' hide ItemUsed, ItemExpired, SettingsChanged;
export 'analytics.dart';
export 'activity_event.dart';