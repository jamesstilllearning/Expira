// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekImpl _$$WeekImplFromJson(Map<String, dynamic> json) => _$WeekImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WeekImplToJson(_$WeekImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MonthImpl _$$MonthImplFromJson(Map<String, dynamic> json) => _$MonthImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MonthImplToJson(_$MonthImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$YearImpl _$$YearImplFromJson(Map<String, dynamic> json) => _$YearImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$YearImplToJson(_$YearImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CustomImpl _$$CustomImplFromJson(Map<String, dynamic> json) => _$CustomImpl(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CustomImplToJson(_$CustomImpl instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$AnalyticsSummaryImpl _$$AnalyticsSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsSummaryImpl(
      totalConsumed: (json['totalConsumed'] as num?)?.toInt() ?? 0,
      usedBeforeExpiry: (json['usedBeforeExpiry'] as num?)?.toInt() ?? 0,
      wasted: (json['wasted'] as num?)?.toInt() ?? 0,
      savedFromExpiring: (json['savedFromExpiring'] as num?)?.toInt() ?? 0,
      usedBeforeExpiryRate:
          (json['usedBeforeExpiryRate'] as num?)?.toDouble() ?? 0.0,
      avgDaysBeforeExpiry:
          (json['avgDaysBeforeExpiry'] as num?)?.toDouble() ?? 0.0,
      totalItemsTracked: (json['totalItemsTracked'] as num?)?.toInt() ?? 0,
      currentInventoryCount:
          (json['currentInventoryCount'] as num?)?.toInt() ?? 0,
      expiringSoonCount: (json['expiringSoonCount'] as num?)?.toInt() ?? 0,
      expiredCount: (json['expiredCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AnalyticsSummaryImplToJson(
        _$AnalyticsSummaryImpl instance) =>
    <String, dynamic>{
      'totalConsumed': instance.totalConsumed,
      'usedBeforeExpiry': instance.usedBeforeExpiry,
      'wasted': instance.wasted,
      'savedFromExpiring': instance.savedFromExpiring,
      'usedBeforeExpiryRate': instance.usedBeforeExpiryRate,
      'avgDaysBeforeExpiry': instance.avgDaysBeforeExpiry,
      'totalItemsTracked': instance.totalItemsTracked,
      'currentInventoryCount': instance.currentInventoryCount,
      'expiringSoonCount': instance.expiringSoonCount,
      'expiredCount': instance.expiredCount,
    };

_$CategoryDataPointImpl _$$CategoryDataPointImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryDataPointImpl(
      category: json['category'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$CategoryDataPointImplToJson(
        _$CategoryDataPointImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'count': instance.count,
      'percentage': instance.percentage,
    };

_$ExpiryStatusDataPointImpl _$$ExpiryStatusDataPointImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpiryStatusDataPointImpl(
      status: json['status'] as String,
      count: (json['count'] as num?)?.toInt() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ExpiryStatusDataPointImplToJson(
        _$ExpiryStatusDataPointImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'percentage': instance.percentage,
    };

_$MonthlyTrendDataPointImpl _$$MonthlyTrendDataPointImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlyTrendDataPointImpl(
      month: json['month'] as String? ?? '',
      added: (json['added'] as num?)?.toInt() ?? 0,
      consumed: (json['consumed'] as num?)?.toInt() ?? 0,
      wasted: (json['wasted'] as num?)?.toInt() ?? 0,
      saved: (json['saved'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MonthlyTrendDataPointImplToJson(
        _$MonthlyTrendDataPointImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'added': instance.added,
      'consumed': instance.consumed,
      'wasted': instance.wasted,
      'saved': instance.saved,
    };

_$WasteReductionImpl _$$WasteReductionImplFromJson(Map<String, dynamic> json) =>
    _$WasteReductionImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WasteReductionImplToJson(
        _$WasteReductionImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ExpiryPatternsImpl _$$ExpiryPatternsImplFromJson(Map<String, dynamic> json) =>
    _$ExpiryPatternsImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExpiryPatternsImplToJson(
        _$ExpiryPatternsImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CategoryBalanceImpl _$$CategoryBalanceImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryBalanceImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CategoryBalanceImplToJson(
        _$CategoryBalanceImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UsageTrendsImpl _$$UsageTrendsImplFromJson(Map<String, dynamic> json) =>
    _$UsageTrendsImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UsageTrendsImplToJson(_$UsageTrendsImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ShoppingOptimizationImpl _$$ShoppingOptimizationImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingOptimizationImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ShoppingOptimizationImplToJson(
        _$ShoppingOptimizationImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CelebrationImpl _$$CelebrationImplFromJson(Map<String, dynamic> json) =>
    _$CelebrationImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CelebrationImplToJson(_$CelebrationImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$InfoImpl _$$InfoImplFromJson(Map<String, dynamic> json) => _$InfoImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InfoImplToJson(_$InfoImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$WarningImpl _$$WarningImplFromJson(Map<String, dynamic> json) =>
    _$WarningImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WarningImplToJson(_$WarningImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SuccessImpl _$$SuccessImplFromJson(Map<String, dynamic> json) =>
    _$SuccessImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessImplToJson(_$SuccessImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CriticalImpl _$$CriticalImplFromJson(Map<String, dynamic> json) =>
    _$CriticalImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CriticalImplToJson(_$CriticalImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SmartInsightImpl _$$SmartInsightImplFromJson(Map<String, dynamic> json) =>
    _$SmartInsightImpl(
      type: InsightType.fromJson(json['type'] as Map<String, dynamic>),
      severity:
          InsightSeverity.fromJson(json['severity'] as Map<String, dynamic>),
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      recommendation: json['recommendation'] as String? ?? '',
      data: json['data'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$SmartInsightImplToJson(_$SmartInsightImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'severity': instance.severity,
      'title': instance.title,
      'description': instance.description,
      'recommendation': instance.recommendation,
      'data': instance.data,
    };

_$AnalyticsReportImpl _$$AnalyticsReportImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsReportImpl(
      period: AnalyticsPeriod.fromJson(json['period'] as Map<String, dynamic>),
      summary:
          AnalyticsSummary.fromJson(json['summary'] as Map<String, dynamic>),
      categoryDistribution: (json['categoryDistribution'] as List<dynamic>?)
              ?.map(
                  (e) => CategoryDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      expiryStatusDistribution:
          (json['expiryStatusDistribution'] as List<dynamic>?)
                  ?.map((e) =>
                      ExpiryStatusDataPoint.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
      monthlyTrends: (json['monthlyTrends'] as List<dynamic>?)
              ?.map((e) =>
                  MonthlyTrendDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      insights: (json['insights'] as List<dynamic>?)
              ?.map((e) => SmartInsight.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$$AnalyticsReportImplToJson(
        _$AnalyticsReportImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'summary': instance.summary,
      'categoryDistribution': instance.categoryDistribution,
      'expiryStatusDistribution': instance.expiryStatusDistribution,
      'monthlyTrends': instance.monthlyTrends,
      'insights': instance.insights,
      'generatedAt': instance.generatedAt.toIso8601String(),
    };
