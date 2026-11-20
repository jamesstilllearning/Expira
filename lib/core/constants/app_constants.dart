/// Application-wide constants.
class AppConstants {
  AppConstants._();

  // App info
  static const String appName = 'Expira';
  static const String appVersion = '1.0.0';
  static const int buildNumber = 1;

  // Database
  static const String databaseName = 'expira.db';
  static const int databaseVersion = 4; // Incremented for migration columns

  // Sync
  static const Duration syncInterval = Duration(seconds: 30);
  static const int maxSyncRetries = 3;
  static const Duration syncRetryBaseDelay = Duration(seconds: 2);

  // Notifications
  static const String notificationChannelId = 'expira_reminders';
  static const String notificationChannelName = 'Expiration Reminders';
  static const String notificationChannelDescription = 'Reminders for expiring items';

  // Barcode scanning
  static const Duration barcodeLookupTimeout = Duration(seconds: 5);
  static const int maxBarcodeRetries = 2;

  // Product lookup
  static const Duration productCacheTtl = Duration(days: 30);
  static const String openFoodFactsBaseUrl = 'https://world.openfoodfacts.org/api/v0/product/';
  static const String upcItemDbBaseUrl = 'https://api.upcitemdb.com/prod/trial/lookup';

  // Backup
  static const String backupFormatVersion = '1.0';
  static const String backupFilePrefix = 'expira_backup_';

  // Analytics
  static const int analyticsDefaultPeriodDays = 30;
  static const int analyticsMaxPeriodDays = 365;

  // UI
  static const Duration animationDuration = Duration(milliseconds: 200);
  static const Duration snackBarDuration = Duration(seconds: 3);
  static const double maxImageDimension = 1024.0;
  static const int imageQuality = 85;

  // Migration
  static const String migrationQueueTable = 'migration_queue';
  static const int maxMigrationBatchSize = 100;

  // Security
  static const String secureStorageAuthTokenKey = 'auth_token';
  static const String secureStorageRefreshTokenKey = 'refresh_token';
  static const String secureStorageFcmTokenKey = 'fcm_token';
  static const String secureStorageUserIdKey = 'user_id';
}