import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'analytics.freezed.dart';
part 'analytics.g.dart';

/// Analytics period for reporting.
@freezed
abstract class AnalyticsPeriod with _$AnalyticsPeriod {
  const AnalyticsPeriod._();

  const factory AnalyticsPeriod.week() = Week;
  const factory AnalyticsPeriod.month() = Month;
  const factory AnalyticsPeriod.year() = Year;
  const factory AnalyticsPeriod.custom({
    required DateTime start,
    required DateTime end,
  }) = Custom;

  factory AnalyticsPeriod.fromJson(Map<String, dynamic> json) => _$AnalyticsPeriodFromJson(json);

  String get label => switch (this) {
        Week() => 'Week',
        Month() => 'Month',
        Year() => 'Year',
        Custom(:final start, :final end) => 'Custom (${start.toLocal().toString().split(' ').first} - ${end.toLocal().toString().split(' ').first})',
        _ => 'Unknown',
      };
}

/// Analytics summary statistics.
@freezed
abstract class AnalyticsSummary with _$AnalyticsSummary {
  const AnalyticsSummary._();

  const factory AnalyticsSummary({
    /// Total items consumed
    @Default(0) int totalConsumed,

    /// Items used before expiry
    @Default(0) int usedBeforeExpiry,

    /// Items used after expiry (wasted)
    @Default(0) int wasted,

    /// Items saved from expiring (used during warning period)
    @Default(0) int savedFromExpiring,

    /// On-time usage rate (0.0 - 1.0)
    @Default(0.0) double usedBeforeExpiryRate,

    /// Average days before expiry when used
    @Default(0.0) double avgDaysBeforeExpiry,

    /// Total unique items tracked
    @Default(0) int totalItemsTracked,

    /// Current inventory count
    @Default(0) int currentInventoryCount,

    /// Items expiring soon
    @Default(0) int expiringSoonCount,

    /// Expired items
    @Default(0) int expiredCount,
  }) = _AnalyticsSummary;

  factory AnalyticsSummary.fromJson(Map<String, dynamic> json) => _$AnalyticsSummaryFromJson(json);
}

/// Category distribution data point.
@freezed
abstract class CategoryDataPoint with _$CategoryDataPoint {
  const CategoryDataPoint._();

  const factory CategoryDataPoint({
    /// Category name
    @Default('') String category,

    /// Item count
    @Default(0) int count,

    /// Percentage (0.0 - 1.0)
    @Default(0.0) double percentage,
  }) = _CategoryDataPoint;

  factory CategoryDataPoint.fromJson(Map<String, dynamic> json) => _$CategoryDataPointFromJson(json);
}

/// Expiry status distribution data point.
@freezed
abstract class ExpiryStatusDataPoint with _$ExpiryStatusDataPoint {
  const ExpiryStatusDataPoint._();

  const factory ExpiryStatusDataPoint({
    /// Status
    required String status,

    /// Item count
    @Default(0) int count,

    /// Percentage (0.0 - 1.0)
    @Default(0.0) double percentage,
  }) = _ExpiryStatusDataPoint;

  factory ExpiryStatusDataPoint.fromJson(Map<String, dynamic> json) => _$ExpiryStatusDataPointFromJson(json);
}

/// Monthly trend data point.
@freezed
abstract class MonthlyTrendDataPoint with _$MonthlyTrendDataPoint {
  const MonthlyTrendDataPoint._();

  const factory MonthlyTrendDataPoint({
    /// Month (YYYY-MM format)
    @Default('') String month,

    /// Items added
    @Default(0) int added,

    /// Items consumed
    @Default(0) int consumed,

    /// Items wasted
    @Default(0) int wasted,

    /// Items saved
    @Default(0) int saved,
  }) = _MonthlyTrendDataPoint;

  factory MonthlyTrendDataPoint.fromJson(Map<String, dynamic> json) => _$MonthlyTrendDataPointFromJson(json);
}

/// Smart insight type.
@freezed
abstract class InsightType with _$InsightType {
  const InsightType._();

  const factory InsightType.wasteReduction() = WasteReduction;
  const factory InsightType.expiryPatterns() = ExpiryPatterns;
  const factory InsightType.categoryBalance() = CategoryBalance;
  const factory InsightType.usageTrends() = UsageTrends;
  const factory InsightType.shoppingOptimization() = ShoppingOptimization;
  const factory InsightType.celebration() = Celebration;

  factory InsightType.fromJson(Map<String, dynamic> json) => _$InsightTypeFromJson(json);

  String get title => switch (this) {
        WasteReduction() => 'Waste Reduction',
        ExpiryPatterns() => 'Expiry Patterns',
        CategoryBalance() => 'Category Balance',
        UsageTrends() => 'Usage Trends',
        ShoppingOptimization() => 'Shopping Optimization',
        Celebration() => 'Achievement',
        _ => 'Insight',
      };

  String get icon => switch (this) {
        WasteReduction() => '🌱',
        ExpiryPatterns() => '📊',
        CategoryBalance() => '⚖️',
        UsageTrends() => '📈',
        ShoppingOptimization() => '🛒',
        Celebration() => '🎉',
        _ => '💡',
      };
}

/// Insight severity.
@freezed
abstract class InsightSeverity with _$InsightSeverity {
  const InsightSeverity._();

  const factory InsightSeverity.info() = Info;
  const factory InsightSeverity.warning() = Warning;
  const factory InsightSeverity.success() = Success;
  const factory InsightSeverity.critical() = Critical;

  factory InsightSeverity.fromJson(Map<String, dynamic> json) => _$InsightSeverityFromJson(json);
}

/// Smart insight.
@freezed
abstract class SmartInsight with _$SmartInsight {
  const SmartInsight._();

  const factory SmartInsight({
    /// Insight type
    required InsightType type,

    /// Severity
    required InsightSeverity severity,

    /// Title
    @Default('') String title,

    /// Description
    @Default('') String description,

    /// Actionable recommendation
    @Default('') String recommendation,

    /// Related data (optional)
    @Default({}) Map<String, dynamic> data,
  }) = _SmartInsight;

  factory SmartInsight.fromJson(Map<String, dynamic> json) => _$SmartInsightFromJson(json);
}

/// Complete analytics report.
@freezed
abstract class AnalyticsReport with _$AnalyticsReport {
  const AnalyticsReport._();

  const factory AnalyticsReport({
    /// Report period
    required AnalyticsPeriod period,

    /// Summary statistics
    required AnalyticsSummary summary,

    /// Category distribution
    @Default([]) List<CategoryDataPoint> categoryDistribution,

    /// Expiry status distribution
    @Default([]) List<ExpiryStatusDataPoint> expiryStatusDistribution,

    /// Monthly trends (last 12 months)
    @Default([]) List<MonthlyTrendDataPoint> monthlyTrends,

    /// Smart insights
    @Default([]) List<SmartInsight> insights,

    /// Generated at timestamp
    required DateTime generatedAt,
  }) = _AnalyticsReport;

  factory AnalyticsReport.fromJson(Map<String, dynamic> json) => _$AnalyticsReportFromJson(json);
}