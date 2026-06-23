import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/widgets/app_surface_card.dart';
import 'package:uiren/src/core/widgets/feature_scaffold.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_university_card.dart';
import 'package:uiren/src/features/progress/data/student_test_history_repository.dart';
import 'package:uiren/src/features/university/data/university_selection_storage.dart';
import 'package:uiren/src/features/progress/presentation/widgets/progress_stat_card.dart';
import 'package:uiren/src/features/progress/presentation/widgets/progress_tests_chart.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  void initState() {
    super.initState();
    _syncAverageScore();
  }

  Future<void> _syncAverageScore() async {
    final repo = StudentTestHistoryRepository.instance;
    await UniversitySelectionStorage.instance
        .saveStudentAvgScore(repo.averageScore);
  }

  @override
  Widget build(BuildContext context) {
    final repo = StudentTestHistoryRepository.instance;
    final avg = repo.averageScore;
    final best = repo.bestScore;
    final latest = repo.tests.isNotEmpty ? repo.tests.last.score : 0;
    final trend = repo.tests.length >= 2
        ? repo.tests.last.score - repo.tests[repo.tests.length - 2].score
        : 0;

    return FeatureScaffold(
      title: context.tr(LocaleKeys.progress_page_title),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const ProgressTestsChart(),
          const SizedBox(height: 20),
          ProgressStatCard(
            title: context.tr(LocaleKeys.avg_score),
            value: '$avg',
            subtitle: 'ENT · ${context.tr(LocaleKeys.progress_all_tests)}',
            icon: Icons.trending_up_rounded,
            accentColor: AppColors.mainColor,
          ),
          ProgressStatCard(
            title: context.tr(LocaleKeys.last_test),
            value: '$latest',
            subtitle: trend >= 0 ? '+$trend ${context.tr(LocaleKeys.progress_vs_prev)}' : '$trend',
            icon: Icons.assignment_turned_in_rounded,
            accentColor: const Color(0xFF3E9970),
          ),
          ProgressStatCard(
            title: context.tr(LocaleKeys.progress_best_title),
            value: '$best',
            subtitle: '${repo.tests.length} ${context.tr(LocaleKeys.progress_all_tests)}',
            icon: Icons.emoji_events_rounded,
            accentColor: AppColors.sunYellow,
          ),
          const SizedBox(height: 8),
          AppSurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(LocaleKeys.progress_ent_goal),
                  style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 15),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: (avg / 140).clamp(0.0, 1.0),
                    minHeight: 10,
                    backgroundColor: const Color(0xFFE8F0FA),
                    color: AppColors.mainColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.tr(
                    LocaleKeys.progress_ent_percent,
                    namedArgs: {'percent': '${((avg / 140) * 100).round()}'},
                  ),
                  style: TextStyles.regular(AppColors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          HomeUniversityCard(),
        ],
      ),
    );
  }
}
