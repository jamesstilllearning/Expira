import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:file_picker/file_picker.dart';

import '../controllers/inventory_controller.dart';
import '../models/analytics.dart';
import '../services/analytics_service.dart';
import '../services/consumption_storage.dart';
import '../services/item_storage.dart';
import '../theme/app_colors.dart';
import '../widgets/app_card.dart';
import '../widgets/app_loading_indicator.dart';
import '../widgets/empty_state.dart';
import '../widgets/section_header.dart';
import '../widgets/stat_card.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({
    super.key,
    required this.controller,
  });

  final InventoryController controller;

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AnalyticsService _analyticsService = AnalyticsService(
    itemStorage: ItemStorage(),
    consumptionStorage: ConsumptionStorage(),
  );

  AnalyticsPeriod _selectedPeriod = AnalyticsPeriod.month;
  DateTime? _customStart;
  DateTime? _customEnd;
  AnalyticsReport? _report;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadReport();
  }

  Future<void> _loadReport() async {
    setState(() => _isLoading = true);
    try {
      final report = await _analyticsService.generateReport(
        period: _selectedPeriod,
        customStart: _customStart,
        customEnd: _customEnd,
      );
      if (mounted) {
        setState(() {
          _report = report;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load analytics: $e')),
        );
      }
    }
  }

  Future<void> _onPeriodChanged(AnalyticsPeriod period) async {
    if (period == _selectedPeriod) return;
    setState(() {
      _selectedPeriod = period;
      _customStart = null;
      _customEnd = null;
    });
    await _loadReport();
  }

  Future<void> _pickCustomRange() async {
    final now = DateTime.now();
    final initialStart = _customStart ?? now.subtract(const Duration(days: 30));
    final initialEnd = _customEnd ?? now;

    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
      initialDateRange: DateTimeRange(start: initialStart, end: initialEnd),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppColors.brand,
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null && mounted) {
      setState(() {
        _selectedPeriod = AnalyticsPeriod.custom;
        _customStart = picked.start;
        _customEnd = picked.end;
      });
      await _loadReport();
    }
  }

  String _getPeriodLabel() {
    switch (_selectedPeriod) {
      case AnalyticsPeriod.week:
        return 'Last 7 Days';
      case AnalyticsPeriod.month:
        return 'Last 30 Days';
      case AnalyticsPeriod.year:
        return 'Last 365 Days';
      case AnalyticsPeriod.custom:
        if (_customStart != null && _customEnd != null) {
          return '${_formatDate(_customStart!)} - ${_formatDate(_customEnd!)}';
        }
        return 'Custom Range';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  Future<void> _exportCSV() async {
    if (_report == null) return;

    final report = _report!;
    final summary = report.summary;

    // Build CSV content
    final buffer = StringBuffer();

    // Summary section
    buffer.writeln('Expira Analytics Report');
    buffer.writeln('Period,${_getPeriodLabel()}');
    buffer.writeln('Generated,${DateTime.now().toIso8601String()}');
    buffer.writeln('');
    buffer.writeln('Summary');
    buffer.writeln('Metric,Value');
    buffer.writeln('Total Registered Products,${summary.totalRegisteredProducts}');
    buffer.writeln('Total Expired Products,${summary.totalExpiredProducts}');
    buffer.writeln('Total Expiring Soon Products,${summary.totalExpiringSoonProducts}');
    buffer.writeln('Products Used Before Expiry,${summary.productsUsedBeforeExpiry}');
    buffer.writeln('Products Discarded Expired,${summary.productsDiscardedExpired}');
    buffer.writeln('Total Waste Items,${summary.totalWasteItems}');
    buffer.writeln('Waste Rate,${summary.wasteRate.toStringAsFixed(1)}%');
    buffer.writeln('');

    // Category distribution
    buffer.writeln('Category Distribution');
    buffer.writeln('Category,Count,Percentage');
    final totalItems = report.categoryDistribution.fold(0, (sum, d) => sum + d.count);
    for (final point in report.categoryDistribution) {
      final pct = totalItems > 0 ? (point.count / totalItems * 100).toStringAsFixed(1) : '0';
      buffer.writeln('${point.category},${point.count},$pct%');
    }
    buffer.writeln('');

    // Expiry status distribution
    buffer.writeln('Expiration Status Distribution');
    buffer.writeln('Status,Count,Percentage');
    final totalStatus = report.expiryStatusDistribution.fold(0, (sum, d) => sum + d.count);
    for (final point in report.expiryStatusDistribution) {
      if (point.count > 0) {
        final pct = totalStatus > 0 ? (point.count / totalStatus * 100).toStringAsFixed(1) : '0';
        buffer.writeln('${point.label},${point.count},$pct%');
      }
    }
    buffer.writeln('');

    // Monthly trends
    buffer.writeln('Monthly Trends (Last 12 Months)');
    buffer.writeln('Month,Registrations,Expired,Wasted');
    for (int i = 0; i < 12; i++) {
      final regIdx = report.monthlyRegistrations.length - 1 - i;
      final expIdx = report.monthlyExpired.length - 1 - i;
      final wasteIdx = report.monthlyWasteTrend.length - 1 - i;

      String monthLabel = '';
      int reg = 0, exp = 0, waste = 0;

      if (regIdx >= 0 && regIdx < report.monthlyRegistrations.length) {
        monthLabel = report.monthlyRegistrations[regIdx].label;
        reg = report.monthlyRegistrations[regIdx].value;
      }
      if (expIdx >= 0 && expIdx < report.monthlyExpired.length) {
        exp = report.monthlyExpired[expIdx].value;
      }
      if (wasteIdx >= 0 && wasteIdx < report.monthlyWasteTrend.length) {
        waste = report.monthlyWasteTrend[wasteIdx].value;
      }

      if (monthLabel.isNotEmpty) {
        buffer.writeln('$monthLabel,$reg,$exp,$waste');
      }
    }
    buffer.writeln('');

    // Smart Insights
    if (report.insights.isNotEmpty) {
      buffer.writeln('Smart Insights');
      buffer.writeln('Type,Title,Description,Severity');
      for (final insight in report.insights) {
        buffer.writeln(
            '${insight.type.name},"${insight.title}","${insight.description}",${insight.severity.name}');
      }
    }

    // Save to file
    final csvContent = buffer.toString();
    final now = DateTime.now();
    final fileName =
        'expira_analytics_${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}.csv';

    try {
      final saved = await FilePicker.saveFile(
        dialogTitle: 'Save Analytics Report',
        fileName: fileName,
        type: FileType.custom,
        allowedExtensions: ['csv'],
        bytes: utf8.encode(csvContent),
      );

      if (saved != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Report saved to $saved')),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Export cancelled')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to export: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        actions: [
          PopupMenuButton<AnalyticsPeriod>(
            tooltip: 'Time Period',
            icon: const Icon(Icons.date_range),
            initialValue: _selectedPeriod,
            onSelected: _onPeriodChanged,
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: AnalyticsPeriod.week,
                child: Row(
                  children: [
                    Icon(Icons.calendar_view_week, size: 20),
                    SizedBox(width: 8),
                    Text('Week'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: AnalyticsPeriod.month,
                child: Row(
                  children: [
                    Icon(Icons.calendar_view_month, size: 20),
                    SizedBox(width: 8),
                    Text('Month'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: AnalyticsPeriod.year,
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 20),
                    SizedBox(width: 8),
                    Text('Year'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: AnalyticsPeriod.custom,
                child: Row(
                  children: [
                    Icon(Icons.tune, size: 20),
                    SizedBox(width: 8),
                    Text('Custom Range'),
                  ],
                ),
              ),
            ],
          ),
          if (_selectedPeriod == AnalyticsPeriod.custom)
            IconButton(
              tooltip: 'Edit Custom Range',
              onPressed: _pickCustomRange,
              icon: const Icon(Icons.edit_calendar),
            ),
          if (_report != null)
            IconButton(
              tooltip: 'Export CSV',
              onPressed: _exportCSV,
              icon: const Icon(Icons.download),
            ),
        ],
      ),
      body: _isLoading
          ? const AppLoadingIndicator(showText: true, text: 'Loading analytics...')
          : _report == null
              ? const EmptyState(
                  icon: Icons.analytics_outlined,
                  message: 'No analytics data available.\nAdd items to your inventory to see reports.',
                )
              : RefreshIndicator(
                  onRefresh: _loadReport,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                    children: [
                      // Period selector chips
                      _PeriodSelector(
                        selectedPeriod: _selectedPeriod,
                        onPeriodChanged: _onPeriodChanged,
                        onCustomTap: _pickCustomRange,
                        customLabel: _customStart != null
                            ? '${_formatDate(_customStart!)} - ${_formatDate(_customEnd!)}'
                            : null,
                      ),
                      const SizedBox(height: 20),

                      // Summary Cards
                      _SummarySection(report: _report!),
                      const SizedBox(height: 24),

                      // Charts
                      _ChartsSection(report: _report!),
                      const SizedBox(height: 24),

                      // Smart Insights
                      if (_report!.insights.isNotEmpty) ...[
                        _InsightsSection(insights: _report!.insights),
                        const SizedBox(height: 24),
                      ],

                      // Detailed Tables
                      _DetailedTablesSection(report: _report!),
                    ],
                  ),
                ),
    );
  }
}

/// Period selector with chips
class _PeriodSelector extends StatelessWidget {
  const _PeriodSelector({
    required this.selectedPeriod,
    required this.onPeriodChanged,
    required this.onCustomTap,
    this.customLabel,
  });

  final AnalyticsPeriod selectedPeriod;
  final ValueChanged<AnalyticsPeriod> onPeriodChanged;
  final VoidCallback onCustomTap;
  final String? customLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final periods = [
      (AnalyticsPeriod.week, 'Week', Icons.calendar_view_week),
      (AnalyticsPeriod.month, 'Month', Icons.calendar_view_month),
      (AnalyticsPeriod.year, 'Year', Icons.calendar_today),
      (AnalyticsPeriod.custom, 'Custom', Icons.tune),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: periods.map((period) {
          final isSelected = selectedPeriod == period.$1;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              selected: isSelected,
              onSelected: (_) => onPeriodChanged(period.$1),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(period.$3, size: 16),
                  const SizedBox(width: 6),
                  Text(period.$2),
                ],
              ),
              avatar: period.$1 == AnalyticsPeriod.custom && customLabel != null
                  ? CircleAvatar(
                      radius: 10,
                      backgroundColor: theme.colorScheme.primary,
                      child: Text(
                        customLabel!,
                        style: const TextStyle(fontSize: 8, color: Colors.white),
                      ),
                    )
                  : null,
              showCheckmark: false,
              selectedColor: theme.colorScheme.primaryContainer,
              checkmarkColor: theme.colorScheme.onPrimaryContainer,
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Summary metrics section
class _SummarySection extends StatelessWidget {
  const _SummarySection({required this.report});

  final AnalyticsReport report;

  @override
  Widget build(BuildContext context) {
    final summary = report.summary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Summary'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: 'Registered',
                value: summary.totalRegisteredProducts.toString(),
                icon: Icons.inventory_2,
                color: AppColors.brand,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                title: 'Used in Time',
                value: summary.productsUsedBeforeExpiry.toString(),
                icon: Icons.check_circle,
                color: AppColors.safe,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: 'Expiring Soon',
                value: summary.totalExpiringSoonProducts.toString(),
                icon: Icons.schedule,
                color: AppColors.soon,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                title: 'Expired',
                value: summary.totalExpiredProducts.toString(),
                icon: Icons.warning_amber,
                color: AppColors.expired,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: 'Discarded',
                value: summary.productsDiscardedExpired.toString(),
                icon: Icons.delete_outline,
                color: AppColors.expiring,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                title: 'Waste Rate',
                value: '${summary.wasteRate.toStringAsFixed(1)}%',
                icon: Icons.trending_up,
                color: summary.wasteRate > 20 ? AppColors.expiring : AppColors.safe,
                trend: summary.wasteRate > 20 ? 'High' : 'Good',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Charts section with interactive visualizations
class _ChartsSection extends StatelessWidget {
  const _ChartsSection({required this.report});

  final AnalyticsReport report;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Visualizations'),
        const SizedBox(height: 12),

        // 1. Products by Category - Pie Chart
        _ChartCard(
          title: 'Products by Category',
          subtitle: 'Distribution across categories',
          child: SizedBox(
            height: 250,
            child: _CategoryPieChart(data: report.categoryDistribution),
          ),
        ),
        const SizedBox(height: 16),

        // 2. Expiration Status Distribution - Pie Chart
        _ChartCard(
          title: 'Expiration Status',
          subtitle: 'Current inventory status breakdown',
          child: SizedBox(
            height: 250,
            child: _ExpiryStatusPieChart(data: report.expiryStatusDistribution),
          ),
        ),
        const SizedBox(height: 16),

        // 3. Monthly Registrations - Bar Chart
        _ChartCard(
          title: 'Monthly Registrations',
          subtitle: 'Products added per month',
          child: SizedBox(
            height: 250,
            child: _MonthlyBarChart(
              data: report.monthlyRegistrations,
              color: AppColors.brand,
              label: 'Registrations',
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 4. Monthly Expired - Bar Chart
        _ChartCard(
          title: 'Monthly Expired Products',
          subtitle: 'Items discarded per month',
          child: SizedBox(
            height: 250,
            child: _MonthlyBarChart(
              data: report.monthlyExpired,
              color: AppColors.expiring,
              label: 'Expired',
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 5. Household Food Waste Trends - Line Chart
        _ChartCard(
          title: 'Food Waste Trend',
          subtitle: 'Monthly waste over time',
          child: SizedBox(
            height: 250,
            child: _WasteTrendLineChart(data: report.monthlyWasteTrend),
          ),
        ),
      ],
    );
  }
}

/// Wrapper card for charts
class _ChartCard extends StatelessWidget {
  const _ChartCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

/// Category Pie Chart
class _CategoryPieChart extends StatelessWidget {
  const _CategoryPieChart({required this.data});

  final List<CategoryDataPoint> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No category data'));
    }

    final total = data.fold(0, (sum, d) => sum + d.count);

    return Column(
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 60,
              sections: data.map((point) {
                final percentage = total > 0 ? (point.count / total) * 100 : 0;
                return PieChartSectionData(
                  value: point.count.toDouble(),
                  color: point.color,
                  title: percentage >= 5 ? '${percentage.toStringAsFixed(1)}%' : '',
                  radius: 80,
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                  badgeWidget: percentage < 5
                      ? _LegendBadge(color: point.color, label: point.category)
                      : null,
                  badgePositionPercentageOffset: 1.3,
                );
              }).toList(),
            ),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
          ),
        ),
        const SizedBox(height: 16),
        _CategoryLegend(data: data, total: total),
      ],
    );
  }
}

class _CategoryLegend extends StatelessWidget {
  const _CategoryLegend({required this.data, required this.total});

  final List<CategoryDataPoint> data;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: data.map((point) {
        final percentage = total > 0 ? (point.count / total) * 100 : 0;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: point.color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Text(
              '${point.category} (${percentage.toStringAsFixed(1)}%)',
              style: theme.textTheme.bodySmall,
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _LegendBadge extends StatelessWidget {
  const _LegendBadge({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 8)),
    );
  }
}

/// Expiry Status Pie Chart
class _ExpiryStatusPieChart extends StatelessWidget {
  const _ExpiryStatusPieChart({required this.data});

  final List<ExpiryStatusDataPoint> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No status data'));
    }

    final total = data.fold(0, (sum, d) => sum + d.count);

    return Column(
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 60,
              sections: data.map((point) {
                if (point.count == 0) {
                  return PieChartSectionData(
                    value: 0,
                    color: point.color.withValues(alpha: 0.1),
                    radius: 0,
                  );
                }
                final percentage = total > 0 ? (point.count / total) * 100 : 0;
                return PieChartSectionData(
                  value: point.count.toDouble(),
                  color: point.color,
                  title: percentage >= 5 ? '${percentage.toStringAsFixed(1)}%' : '',
                  radius: 80,
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                );
              }).toList(),
            ),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
          ),
        ),
        const SizedBox(height: 16),
        _ExpiryStatusLegend(data: data, total: total),
      ],
    );
  }
}

class _ExpiryStatusLegend extends StatelessWidget {
  const _ExpiryStatusLegend({required this.data, required this.total});

  final List<ExpiryStatusDataPoint> data;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: data.where((p) => p.count > 0).map((point) {
        final percentage = total > 0 ? (point.count / total) * 100 : 0;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: point.color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Text(
              '${point.label} (${percentage.toStringAsFixed(1)}%)',
              style: theme.textTheme.bodySmall,
            ),
          ],
        );
      }).toList(),
    );
  }
}

/// Monthly Bar Chart
class _MonthlyBarChart extends StatelessWidget {
  const _MonthlyBarChart({
    required this.data,
    required this.color,
    required this.label,
  });

  final List<MonthlyTrendDataPoint> data;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No trend data'));
    }

    final maxValue = data.fold(0, (max, d) => d.value > max ? d.value : max);
    const minY = 0.0;
    final maxY = (maxValue * 1.2).ceilToDouble().clamp(1.0, double.infinity);

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY,
        minY: minY,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: (maxY / 4).ceilToDouble(),
          getDrawingHorizontalLine: (value) => FlLine(
            color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < data.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      data[index].label,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
              interval: (maxY / 4).ceilToDouble(),
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                );
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: data.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value.value.toDouble(),
                color: color,
                width: 20,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: maxY,
                  color: color.withValues(alpha: 0.1),
                ),
              ),
            ],
          );
        }).toList(),
      ),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }
}

/// Waste Trend Line Chart
class _WasteTrendLineChart extends StatelessWidget {
  const _WasteTrendLineChart({required this.data});

  final List<MonthlyTrendDataPoint> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No waste trend data'));
    }

    final maxValue = data.fold(0, (max, d) => d.value > max ? d.value : max);
    const minY = 0.0;
    final maxY = (maxValue * 1.3).ceilToDouble().clamp(1.0, double.infinity);

    final spots = data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.value.toDouble());
    }).toList();

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (data.length - 1).toDouble(),
        minY: minY,
        maxY: maxY,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: (maxY / 4).ceilToDouble(),
          getDrawingHorizontalLine: (value) => FlLine(
            color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < data.length && index % 2 == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      data[index].label,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
              interval: (maxY / 4).ceilToDouble(),
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                );
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppColors.expiring,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                radius: 5,
                color: AppColors.expiring,
                strokeWidth: 2,
                strokeColor: Colors.white,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.expiring.withValues(alpha: 0.1),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (spot) => AppColors.expiring,
            getTooltipItems: (spots) {
              final items = <LineTooltipItem>[];
              for (final spot in spots) {
                final index = spot.x.toInt();
                if (index >= 0 && index < data.length) {
                  items.add(LineTooltipItem(
                    '${data[index].label}\n${data[index].value} items wasted',
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ));
                }
              }
              return items;
            },
          ),
        ),
      ),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }
}

/// Smart Insights Section
class _InsightsSection extends StatelessWidget {
  const _InsightsSection({required this.insights});

  final List<SmartInsight> insights;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Smart Insights'),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: insights.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final insight = insights[index];
            return _InsightCard(insight: insight);
          },
        ),
      ],
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({required this.insight});

  final SmartInsight insight;

  Color _getSeverityColor(InsightSeverity severity, Brightness brightness) {
    switch (severity) {
      case InsightSeverity.critical:
        return AppColors.expiring;
      case InsightSeverity.warning:
        return AppColors.soon;
      case InsightSeverity.info:
        return AppColors.brand;
      case InsightSeverity.positive:
        return AppColors.safe;
    }
  }

  IconData _getSeverityIcon(InsightSeverity severity) {
    switch (severity) {
      case InsightSeverity.critical:
        return Icons.error_outline;
      case InsightSeverity.warning:
        return Icons.warning_amber_outlined;
      case InsightSeverity.info:
        return Icons.info_outline;
      case InsightSeverity.positive:
        return Icons.check_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final severityColor = _getSeverityColor(insight.severity, theme.brightness);
    final severityIcon = _getSeverityIcon(insight.severity);

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: severityColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(severityIcon, color: severityColor, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  insight.title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  insight.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (insight.actionable && insight.actionLabel != null) ...[
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: insight.actionCallback,
                    icon: const Icon(Icons.chevron_right, size: 16),
                    label: Text(insight.actionLabel!),
                    style: TextButton.styleFrom(
                      foregroundColor: severityColor,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Detailed Tables Section
class _DetailedTablesSection extends StatelessWidget {
  const _DetailedTablesSection({required this.report});

  final AnalyticsReport report;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Details'),
        const SizedBox(height: 12),

        // Category Breakdown Table
        _DetailTable(
          title: 'By Category',
          columns: const ['Category', 'Items', 'Percentage'],
          rows: report.categoryDistribution.map((d) {
            final total = report.categoryDistribution.fold(0, (sum, e) => sum + e.count);
            final pct = total > 0 ? (d.count / total * 100).toStringAsFixed(1) : '0';
            return [d.category, d.count.toString(), '$pct%'];
          }).toList(),
        ),
        const SizedBox(height: 16),

        // Expiry Status Table
        _DetailTable(
          title: 'Expiration Status',
          columns: const ['Status', 'Items', 'Percentage'],
          rows: report.expiryStatusDistribution.where((d) => d.count > 0).map((d) {
            final total = report.expiryStatusDistribution.fold(0, (sum, e) => sum + e.count);
            final pct = total > 0 ? (d.count / total * 100).toStringAsFixed(1) : '0';
            return [d.label, d.count.toString(), '$pct%'];
          }).toList(),
        ),
        const SizedBox(height: 16),

        // Monthly Trend Table
        _DetailTable(
          title: 'Monthly Trends (Last 12 Months)',
          columns: const ['Month', 'Registered', 'Expired', 'Wasted'],
          rows: List.generate(12, (i) {
            final idx = report.monthlyRegistrations.length - 1 - i;
            if (idx < 0 || idx >= report.monthlyRegistrations.length) {
              return ['', '', '', ''];
            }
            final reg = report.monthlyRegistrations[idx];
            final exp = report.monthlyExpired.length > idx ? report.monthlyExpired[idx].value : 0;
            final waste = report.monthlyWasteTrend.length > idx ? report.monthlyWasteTrend[idx].value : 0;
            return [reg.label, reg.value.toString(), exp.toString(), waste.toString()];
          }).reversed.toList(),
        ),
      ],
    );
  }
}

class _DetailTable extends StatelessWidget {
  const _DetailTable({
    required this.title,
    required this.columns,
    required this.rows,
  });

  final String title;
  final List<String> columns;
  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.resolveWith(
                (states) => theme.colorScheme.surfaceContainerHighest,
              ),
              columnSpacing: 24,
              horizontalMargin: 0,
              columns: columns.map((c) => DataColumn(
                label: Text(c, style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
              )).toList(),
              rows: rows.map((row) => DataRow(
                cells: row.map((cell) => DataCell(
                  Text(cell, style: theme.textTheme.bodyMedium),
                )).toList(),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}