import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/widgets/app_surface_card.dart';
import 'package:uiren/src/features/progress/data/models/student_test_result.dart';
import 'package:uiren/src/features/progress/data/student_test_history_repository.dart';

class ProgressTestsChart extends StatelessWidget {
  const ProgressTestsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final tests = StudentTestHistoryRepository.instance.tests;
    final avg = StudentTestHistoryRepository.instance.averageScore;
    final best = StudentTestHistoryRepository.instance.bestScore;

    if (tests.isEmpty) {
      return AppSurfaceCard(
        child: Text(
          context.tr(LocaleKeys.progress_chart_empty),
          style: TextStyles.regular(AppColors.grey, fontSize: 13),
        ),
      );
    }

    final minY = _chartMinY(tests);
    final maxY = _chartMaxY(tests);

    return AppSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('📊', style: TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.tr(LocaleKeys.progress_chart_title),
                  style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 15),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            context.tr(LocaleKeys.progress_chart_subtitle),
            style: TextStyles.regular(AppColors.grey, fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _LegendChip(
                color: AppColors.mainColor,
                label: context.tr(
                  LocaleKeys.progress_chart_avg,
                  namedArgs: {'score': '$avg'},
                ),
              ),
              const SizedBox(width: 8),
              _LegendChip(
                color: AppColors.sunYellow,
                label: context.tr(
                  LocaleKeys.progress_chart_best,
                  namedArgs: {'score': '$best'},
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: LineChart(
              _buildChartData(
                tests: tests,
                avg: avg,
                minY: minY,
                maxY: maxY,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _chartMinY(List<StudentTestResult> tests) {
    final lowest = tests.map((t) => t.score).reduce((a, b) => a < b ? a : b);
    return (lowest - 15).clamp(0, 140).toDouble();
  }

  double _chartMaxY(List<StudentTestResult> tests) {
    final highest = tests.map((t) => t.score).reduce((a, b) => a > b ? a : b);
    return (highest + 10).clamp(0, 140).toDouble();
  }

  LineChartData _buildChartData({
    required List<StudentTestResult> tests,
    required int avg,
    required double minY,
    required double maxY,
  }) {
    final spots = <FlSpot>[];
    for (var i = 0; i < tests.length; i++) {
      spots.add(FlSpot(i.toDouble(), tests[i].score.toDouble()));
    }

    return LineChartData(
      minX: 0,
      maxX: (tests.length - 1).toDouble(),
      minY: minY,
      maxY: maxY,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 10,
        getDrawingHorizontalLine: (value) => FlLine(
          color: AppColors.secondaryColor.withValues(alpha: 0.08),
          strokeWidth: 1,
        ),
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 10,
            getTitlesWidget: (value, meta) => Text(
              value.toInt().toString(),
              style: TextStyles.regular(AppColors.grey, fontSize: 10),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              if (index < 0 || index >= tests.length) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  tests[index].shortLabel,
                  style: TextStyles.regular(AppColors.grey, fontSize: 9),
                ),
              );
            },
          ),
        ),
      ),
      extraLinesData: ExtraLinesData(
        horizontalLines: [
          HorizontalLine(
            y: avg.toDouble(),
            color: AppColors.sunYellow.withValues(alpha: 0.9),
            strokeWidth: 1.5,
            dashArray: [6, 4],
            label: HorizontalLineLabel(
              show: true,
              alignment: Alignment.topRight,
              style: TextStyles.medium(AppColors.secondaryColor, fontSize: 9),
              labelResolver: (_) => 'Ø $avg',
            ),
          ),
        ],
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => AppColors.secondaryColor,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              final index = spot.x.toInt();
              final test = tests[index];
              return LineTooltipItem(
                '${test.shortLabel}\n${test.score} ${test.type.toUpperCase()}',
                TextStyles.semibold(AppColors.white, fontSize: 12),
              );
            }).toList();
          },
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          curveSmoothness: 0.25,
          color: AppColors.mainColor,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, bar, index) {
              final isLast = index == tests.length - 1;
              return FlDotCirclePainter(
                radius: isLast ? 6 : 4,
                color: isLast ? AppColors.sunYellow : AppColors.white,
                strokeWidth: 2,
                strokeColor: AppColors.mainColor,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.mainColor.withValues(alpha: 0.25),
                AppColors.mainColor.withValues(alpha: 0.02),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LegendChip extends StatelessWidget {
  const _LegendChip({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyles.medium(AppColors.secondaryColor, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
