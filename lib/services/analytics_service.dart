import 'package:flutter/material.dart';

import '../models/analytics.dart';
import '../models/consumption_record.dart';
import '../models/food_item.dart';
import '../services/consumption_storage.dart';
import '../services/item_storage.dart';

/// Service for computing analytics from inventory and consumption data
class AnalyticsService {
  AnalyticsService({
    required ItemStorage itemStorage,
    required ConsumptionStorage consumptionStorage,
  })  : _itemStorage = itemStorage,
        _consumptionStorage = consumptionStorage;

  final ItemStorage _itemStorage;
  final ConsumptionStorage _consumptionStorage;

  /// Generate a complete analytics report for the given period
  Future<AnalyticsReport> generateReport({
    required AnalyticsPeriod period,
    DateTime? customStart,
    DateTime? customEnd,
  }) async {
    final now = DateTime.now();
    final periodEnd = period == AnalyticsPeriod.custom ? (customEnd ?? now) : now;
    final periodStart = _calculatePeriodStart(period, customStart, now);

    // Load all data
    final items = await _itemStorage.load();
    final records = await _consumptionStorage.load();

    // Filter records to the period
    final periodRecords = records.where((r) {
      final usedDate = DateUtils.dateOnly(r.usedOn);
      return !usedDate.isBefore(periodStart) && !usedDate.isAfter(periodEnd);
    }).toList();

    // Compute summary
    final summary = _computeSummary(items, periodRecords, periodStart, periodEnd);

    // Compute distributions
    final categoryDistribution = _computeCategoryDistribution(items);
    final expiryStatusDistribution = _computeExpiryStatusDistribution(items);

    // Compute monthly trends (last 12 months)
    final monthlyRegistrations = _computeMonthlyTrend(
      items,
      (item) => DateUtils.dateOnly(item.expiryDate),
      months: 12,
    );
    final monthlyExpired = _computeMonthlyTrend(
      periodRecords,
      (record) => DateUtils.dateOnly(record.usedOn),
      months: 12,
    );
    final monthlyWasteTrend = _computeMonthlyWasteTrend(periodRecords, 12);

    // Generate insights
    final insights = _generateInsights(
      items,
      periodRecords,
      categoryDistribution,
      summary,
    );

    return AnalyticsReport(
      summary: summary,
      categoryDistribution: categoryDistribution,
      expiryStatusDistribution: expiryStatusDistribution,
      monthlyRegistrations: monthlyRegistrations,
      monthlyExpired: monthlyExpired,
      monthlyWasteTrend: monthlyWasteTrend,
      insights: insights,
      period: period,
      customStart: customStart,
      customEnd: customEnd,
    );
  }

  DateTime _calculatePeriodStart(
    AnalyticsPeriod period,
    DateTime? customStart,
    DateTime now,
  ) {
    switch (period) {
      case AnalyticsPeriod.week:
        return now.subtract(const Duration(days: 7));
      case AnalyticsPeriod.month:
        return now.subtract(const Duration(days: 30));
      case AnalyticsPeriod.year:
        return now.subtract(const Duration(days: 365));
      case AnalyticsPeriod.custom:
        return customStart ?? now.subtract(const Duration(days: 30));
    }
  }

  AnalyticsSummary _computeSummary(
    List<FoodItem> items,
    List<ConsumptionRecord> periodRecords,
    DateTime periodStart,
    DateTime periodEnd,
  ) {
    // Current inventory metrics
    int totalRegisteredProducts = items.length;
    int totalExpiredProducts = 0;
    int totalExpiringSoonProducts = 0;

    for (final item in items) {
      final daysLeft = item.daysLeft;
      if (daysLeft < 0) {
        totalExpiredProducts++;
      } else if (daysLeft <= 7) { // Using default "soon" threshold
        totalExpiringSoonProducts++;
      }
    }

    // Consumption metrics for the period
    int productsUsedBeforeExpiry = 0;
    int productsDiscardedExpired = 0;

    for (final record in periodRecords) {
      if (record.usedBeforeExpiry) {
        productsUsedBeforeExpiry += record.wasExpiringAtUse ? 1 : 1;
      } else {
        productsDiscardedExpired++;
      }
    }

    // Total waste = discarded expired + expired in current inventory
    final totalWasteItems = productsDiscardedExpired + totalExpiredProducts;

    // Waste rate = waste / (used + waste)
    final totalConsumed = productsUsedBeforeExpiry + productsDiscardedExpired;
    final wasteRate = totalConsumed > 0
        ? (productsDiscardedExpired / totalConsumed) * 100
        : 0.0;

    return AnalyticsSummary(
      totalRegisteredProducts: totalRegisteredProducts,
      totalExpiredProducts: totalExpiredProducts,
      totalExpiringSoonProducts: totalExpiringSoonProducts,
      productsUsedBeforeExpiry: productsUsedBeforeExpiry,
      productsDiscardedExpired: productsDiscardedExpired,
      totalWasteItems: totalWasteItems,
      wasteRate: wasteRate,
      periodStart: periodStart,
      periodEnd: periodEnd,
    );
  }

  List<CategoryDataPoint> _computeCategoryDistribution(List<FoodItem> items) {
    final Map<String, int> categoryCounts = {};

    for (final item in items) {
      categoryCounts[item.category] = (categoryCounts[item.category] ?? 0) + item.quantity;
    }

    // Sort by count descending
    final sortedEntries = categoryCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Assign colors
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.amber,
      Colors.cyan,
    ];

    return sortedEntries.asMap().entries.map((entry) {
      final index = entry.key;
      final categoryEntry = entry.value;
      return CategoryDataPoint(
        category: categoryEntry.key,
        count: categoryEntry.value,
        color: colors[index % colors.length],
      );
    }).toList();
  }

  List<ExpiryStatusDataPoint> _computeExpiryStatusDistribution(List<FoodItem> items) {
    final Map<ExpiryStatus, int> statusCounts = {
      ExpiryStatus.safe: 0,
      ExpiryStatus.soon: 0,
      ExpiryStatus.expiring: 0,
      ExpiryStatus.expired: 0,
    };

    // Use default thresholds for classification
    const thresholds = ExpiryThresholds(expiringWithinDays: 2, soonWithinDays: 7);

    for (final item in items) {
      final status = thresholds.classify(item.daysLeft);
      statusCounts[status] = (statusCounts[status] ?? 0) + item.quantity;
    }

    return [
      ExpiryStatusDataPoint(
        status: ExpiryStatus.safe,
        count: statusCounts[ExpiryStatus.safe]!,
        color: Colors.green,
        label: 'Safe (>7 days)',
      ),
      ExpiryStatusDataPoint(
        status: ExpiryStatus.soon,
        count: statusCounts[ExpiryStatus.soon]!,
        color: Colors.orange,
        label: 'Soon (3-7 days)',
      ),
      ExpiryStatusDataPoint(
        status: ExpiryStatus.expiring,
        count: statusCounts[ExpiryStatus.expiring]!,
        color: Colors.red,
        label: 'Expiring (≤2 days)',
      ),
      ExpiryStatusDataPoint(
        status: ExpiryStatus.expired,
        count: statusCounts[ExpiryStatus.expired]!,
        color: Colors.grey,
        label: 'Expired',
      ),
    ];
  }

  List<MonthlyTrendDataPoint> _computeMonthlyTrend<T>(
    List<T> data,
    DateTime Function(T) dateExtractor, {
    int months = 12,
  }) {
    final now = DateTime.now();
    final Map<String, int> monthlyCounts = {};

    // Initialize all months with 0
    for (int i = 0; i < months; i++) {
      final date = DateTime(now.year, now.month - i, 1);
      final key = '${date.year}-${date.month.toString().padLeft(2, '0')}';
      monthlyCounts[key] = 0;
    }

    for (final item in data) {
      final date = dateExtractor(item);
      final key = '${date.year}-${date.month.toString().padLeft(2, '0')}';
      if (monthlyCounts.containsKey(key)) {
        monthlyCounts[key] = (monthlyCounts[key] ?? 0) + 1;
      }
    }

    // Convert to list, sorted by date ascending (oldest first)
    final sortedKeys = monthlyCounts.keys.toList()..sort();
    return sortedKeys.map((key) {
      final parts = key.split('-');
      return MonthlyTrendDataPoint(
        month: int.parse(parts[1]),
        year: int.parse(parts[0]),
        value: monthlyCounts[key]!,
      );
    }).toList();
  }

  List<MonthlyTrendDataPoint> _computeMonthlyWasteTrend(
    List<ConsumptionRecord> records,
    int months,
  ) {
    final now = DateTime.now();
    final Map<String, int> monthlyWaste = {};

    // Initialize all months with 0
    for (int i = 0; i < months; i++) {
      final date = DateTime(now.year, now.month - i, 1);
      final key = '${date.year}-${date.month.toString().padLeft(2, '0')}';
      monthlyWaste[key] = 0;
    }

    for (final record in records) {
      if (!record.usedBeforeExpiry) {
        final date = DateUtils.dateOnly(record.usedOn);
        final key = '${date.year}-${date.month.toString().padLeft(2, '0')}';
        if (monthlyWaste.containsKey(key)) {
          monthlyWaste[key] = (monthlyWaste[key] ?? 0) + 1;
        }
      }
    }

    // Convert to list, sorted by date ascending
    final sortedKeys = monthlyWaste.keys.toList()..sort();
    return sortedKeys.map((key) {
      final parts = key.split('-');
      return MonthlyTrendDataPoint(
        month: int.parse(parts[1]),
        year: int.parse(parts[0]),
        value: monthlyWaste[key]!,
      );
    }).toList();
  }

  List<SmartInsight> _generateInsights(
    List<FoodItem> items,
    List<ConsumptionRecord> periodRecords,
    List<CategoryDataPoint> categoryDistribution,
    AnalyticsSummary summary,
  ) {
    final insights = <SmartInsight>[];

    // Insight 1: Most wasted category
    if (categoryDistribution.isNotEmpty) {
      final topCategory = categoryDistribution.first;
      final categoryRecords = periodRecords.where((r) => r.category == topCategory.category).toList();
      final categoryWaste = categoryRecords.where((r) => !r.usedBeforeExpiry).length;
      final categoryTotal = categoryRecords.length;

      if (categoryTotal > 0 && categoryWaste > 0) {
        final wasteRate = (categoryWaste / categoryTotal) * 100;
        insights.add(SmartInsight(
          type: InsightType.mostWastedCategory,
          title: 'Most Wasted Category: ${topCategory.category}',
          description: '${topCategory.category} has a ${wasteRate.toStringAsFixed(1)}% waste rate ($categoryWaste of $categoryTotal items discarded).',
          severity: wasteRate > 30 ? InsightSeverity.warning : InsightSeverity.info,
          actionable: true,
          actionLabel: 'View ${topCategory.category}',
        ));
      }
    }

    // Insight 2: Frequently wasted products
    final productWasteMap = <String, int>{};
    final productTotalMap = <String, int>{};

    for (final record in periodRecords) {
      productTotalMap[record.itemName] = (productTotalMap[record.itemName] ?? 0) + 1;
      if (!record.usedBeforeExpiry) {
        productWasteMap[record.itemName] = (productWasteMap[record.itemName] ?? 0) + 1;
      }
    }

    final wastedProducts = productWasteMap.entries
        .where((e) => e.value > 0 && (productTotalMap[e.key] ?? 0) >= 2)
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (wastedProducts.isNotEmpty) {
      final topWasted = wastedProducts.first;
      final total = productTotalMap[topWasted.key] ?? 0;
      insights.add(SmartInsight(
        type: InsightType.frequentlyWastedProduct,
        title: 'Frequently Wasted: ${topWasted.key}',
        description: 'Discarded ${topWasted.value} of $total times. Consider buying smaller quantities.',
        severity: InsightSeverity.warning,
        actionable: true,
        actionLabel: 'Adjust quantity',
      ));
    }

    // Insight 3: Categories needing better management
    if (categoryDistribution.length > 1) {
      final problematicCategories = categoryDistribution
          .where((c) => c.count > 5) // Only categories with significant items
          .toList();

      if (problematicCategories.length > 1) {
        insights.add(SmartInsight(
          type: InsightType.needsBetterManagement,
          title: 'Multiple Categories Need Attention',
          description: 'You have ${problematicCategories.length} categories with 5+ items. Consider organizing by expiration date.',
          severity: InsightSeverity.info,
          actionable: true,
          actionLabel: 'View Inventory',
        ));
      }
    }

    // Insight 4: Expiration trend
    final expiringSoonCount = summary.totalExpiringSoonProducts;
    final expiredCount = summary.totalExpiredProducts;
    if (expiringSoonCount > 0 || expiredCount > 0) {
      insights.add(SmartInsight(
        type: InsightType.expirationTrend,
        title: 'Expiration Alert',
        description: '$expiringSoonCount items expiring soon, $expiredCount already expired. Plan meals accordingly.',
        severity: expiredCount > 0 ? InsightSeverity.critical : InsightSeverity.warning,
        actionable: true,
        actionLabel: 'View Expiring',
      ));
    }

    // Insight 5: Low waste achievement
    if (summary.wasteRate < 10 && summary.productsUsedBeforeExpiry > 10) {
      insights.add(SmartInsight(
        type: InsightType.lowWasteAchievement,
        title: 'Great Job! Low Waste Rate',
        description: 'Your waste rate is only ${summary.wasteRate.toStringAsFixed(1)}%. Keep up the good work!',
        severity: InsightSeverity.positive,
      ));
    }

    // Insight 6: Upcoming expiry spike
    final now = DateTime.now();
    final nextWeek = now.add(const Duration(days: 7));
    int upcomingExpiry = 0;
    for (final item in items) {
      final expiryDate = DateUtils.dateOnly(item.expiryDate);
      if (!expiryDate.isBefore(now) && !expiryDate.isAfter(nextWeek)) {
        upcomingExpiry += item.quantity;
      }
    }
    if (upcomingExpiry > 5) {
      insights.add(SmartInsight(
        type: InsightType.upcomingExpirySpike,
        title: 'Upcoming Expiry Spike',
        description: '$upcomingExpiry items expiring in the next 7 days. Prioritize using these.',
        severity: InsightSeverity.warning,
        actionable: true,
        actionLabel: 'Plan Meals',
      ));
    }

    return insights;
  }
}