import 'package:flutter/material.dart';

import 'food_item.dart';

/// Time range for analytics filtering
enum AnalyticsPeriod {
  week,
  month,
  year,
  custom,
}

/// Summary of key metrics for a given period
@immutable
class AnalyticsSummary {
  const AnalyticsSummary({
    required this.totalRegisteredProducts,
    required this.totalExpiredProducts,
    required this.totalExpiringSoonProducts,
    required this.productsUsedBeforeExpiry,
    required this.productsDiscardedExpired,
    required this.totalWasteItems,
    required this.wasteRate,
    required this.periodStart,
    required this.periodEnd,
  });

  final int totalRegisteredProducts;
  final int totalExpiredProducts;
  final int totalExpiringSoonProducts;
  final int productsUsedBeforeExpiry;
  final int productsDiscardedExpired;
  final int totalWasteItems;
  final double wasteRate; // percentage
  final DateTime periodStart;
  final DateTime periodEnd;

  /// Number of products currently in inventory (not consumed)
  int get currentInventory => totalRegisteredProducts - productsUsedBeforeExpiry - productsDiscardedExpired;

  Map<String, dynamic> toJson() => {
        'totalRegisteredProducts': totalRegisteredProducts,
        'totalExpiredProducts': totalExpiredProducts,
        'totalExpiringSoonProducts': totalExpiringSoonProducts,
        'productsUsedBeforeExpiry': productsUsedBeforeExpiry,
        'productsDiscardedExpired': productsDiscardedExpired,
        'totalWasteItems': totalWasteItems,
        'wasteRate': wasteRate,
        'periodStart': periodStart.toIso8601String(),
        'periodEnd': periodEnd.toIso8601String(),
      };

  factory AnalyticsSummary.fromJson(Map<String, dynamic> json) => AnalyticsSummary(
        totalRegisteredProducts: json['totalRegisteredProducts'] as int,
        totalExpiredProducts: json['totalExpiredProducts'] as int,
        totalExpiringSoonProducts: json['totalExpiringSoonProducts'] as int,
        productsUsedBeforeExpiry: json['productsUsedBeforeExpiry'] as int,
        productsDiscardedExpired: json['productsDiscardedExpired'] as int,
        totalWasteItems: json['totalWasteItems'] as int,
        wasteRate: (json['wasteRate'] as num).toDouble(),
        periodStart: DateTime.parse(json['periodStart'] as String),
        periodEnd: DateTime.parse(json['periodEnd'] as String),
      );
}

/// Data point for category distribution chart
@immutable
class CategoryDataPoint {
  const CategoryDataPoint({
    required this.category,
    required this.count,
    required this.color,
  });

  final String category;
  final int count;
  final Color color;

  Map<String, dynamic> toJson() => {
        'category': category,
        'count': count,
        'color': color.toARGB32(),
      };
}

/// Data point for expiration status distribution
@immutable
class ExpiryStatusDataPoint {
  const ExpiryStatusDataPoint({
    required this.status,
    required this.count,
    required this.color,
    required this.label,
  });

  final ExpiryStatus status;
  final int count;
  final Color color;
  final String label;

  Map<String, dynamic> toJson() => {
        'status': status.name,
        'count': count,
        'color': color.toARGB32(),
        'label': label,
      };
}

/// Data point for monthly trend charts
@immutable
class MonthlyTrendDataPoint {
  const MonthlyTrendDataPoint({
    required this.month,
    required this.year,
    required this.value,
  });

  final int month; // 1-12
  final int year;
  final int value;

  DateTime get date => DateTime(year, month);
  String get label => '${_monthName(month)} $year';

  static String _monthName(int month) {
    const names = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return names[month - 1];
  }

  Map<String, dynamic> toJson() => {
        'month': month,
        'year': year,
        'value': value,
      };
}

/// Smart insight generated from analytics
@immutable
class SmartInsight {
  const SmartInsight({
    required this.type,
    required this.title,
    required this.description,
    required this.severity,
    this.actionable = false,
    this.actionLabel,
    this.actionCallback,
  });

  final InsightType type;
  final String title;
  final String description;
  final InsightSeverity severity;
  final bool actionable;
  final String? actionLabel;
  final VoidCallback? actionCallback;

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'title': title,
        'description': description,
        'severity': severity.name,
        'actionable': actionable,
        'actionLabel': actionLabel,
      };
}

enum InsightType {
  mostWastedCategory,
  frequentlyWastedProduct,
  needsBetterManagement,
  expirationTrend,
  lowWasteAchievement,
  upcomingExpirySpike,
}

enum InsightSeverity {
  info,
  warning,
  critical,
  positive,
}

/// Complete analytics report for a period
@immutable
class AnalyticsReport {
  const AnalyticsReport({
    required this.summary,
    required this.categoryDistribution,
    required this.expiryStatusDistribution,
    required this.monthlyRegistrations,
    required this.monthlyExpired,
    required this.monthlyWasteTrend,
    required this.insights,
    required this.period,
    this.customStart,
    this.customEnd,
  });

  final AnalyticsSummary summary;
  final List<CategoryDataPoint> categoryDistribution;
  final List<ExpiryStatusDataPoint> expiryStatusDistribution;
  final List<MonthlyTrendDataPoint> monthlyRegistrations;
  final List<MonthlyTrendDataPoint> monthlyExpired;
  final List<MonthlyTrendDataPoint> monthlyWasteTrend;
  final List<SmartInsight> insights;
  final AnalyticsPeriod period;
  final DateTime? customStart;
  final DateTime? customEnd;

  DateTime get periodStart {
    switch (period) {
      case AnalyticsPeriod.week:
        return DateTime.now().subtract(const Duration(days: 7));
      case AnalyticsPeriod.month:
        return DateTime.now().subtract(const Duration(days: 30));
      case AnalyticsPeriod.year:
        return DateTime.now().subtract(const Duration(days: 365));
      case AnalyticsPeriod.custom:
        return customStart ?? DateTime.now().subtract(const Duration(days: 30));
    }
  }

  DateTime get periodEnd {
    switch (period) {
      case AnalyticsPeriod.custom:
        return customEnd ?? DateTime.now();
      default:
        return DateTime.now();
    }
  }

  Map<String, dynamic> toJson() => {
        'summary': summary.toJson(),
        'categoryDistribution': categoryDistribution.map((e) => e.toJson()).toList(),
        'expiryStatusDistribution': expiryStatusDistribution.map((e) => e.toJson()).toList(),
        'monthlyRegistrations': monthlyRegistrations.map((e) => e.toJson()).toList(),
        'monthlyExpired': monthlyExpired.map((e) => e.toJson()).toList(),
        'monthlyWasteTrend': monthlyWasteTrend.map((e) => e.toJson()).toList(),
        'insights': insights.map((e) => e.toJson()).toList(),
        'period': period.name,
        'customStart': customStart?.toIso8601String(),
        'customEnd': customEnd?.toIso8601String(),
      };
}