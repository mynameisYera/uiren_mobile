import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/widgets/app_surface_card.dart';

class HomeAchievementBlock extends StatelessWidget {
  const HomeAchievementBlock({
    super.key,
    this.level = 7,
    this.entProgress = 0.72,
    this.avgScore = 118,
    this.lastTestDelta = 7,
    this.streakDays = 5,
    this.battleWins = 12,
  });

  final int level;
  final double entProgress;
  final int avgScore;
  final int lastTestDelta;
  final int streakDays;
  final int battleWins;

  @override
  Widget build(BuildContext context) {
    final percent = (entProgress * 100).round();

    return AppSurfaceCard(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF1B6B4A),
          Color(0xFF3E9970),
          Color(0xFF5BB8E8),
        ],
        stops: [0.0, 0.55, 1.0],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🏅', style: TextStyle(fontSize: 28)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys.achievement_title),
                      style: TextStyles.bold(AppColors.white, fontSize: 17),
                    ),
                    Text(
                      context.tr(
                        LocaleKeys.achievement_level,
                        namedArgs: {'level': '$level'},
                      ),
                      style: TextStyles.regular(
                        AppColors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.sunYellow.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '🔥 $streakDays',
                  style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _ProgressRing(
                progress: entProgress,
                percentLabel: '$percent%',
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(
                        LocaleKeys.achievement_ent_ready,
                        namedArgs: {'percent': '$percent'},
                      ),
                      style: TextStyles.semibold(AppColors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.tr(
                        LocaleKeys.achievement_motivation,
                        namedArgs: {'delta': '$lastTestDelta'},
                      ),
                      style: TextStyles.regular(
                        AppColors.white.withValues(alpha: 0.9),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _AchievementBadge(
                emoji: '⭐',
                value: '$avgScore',
                label: context.tr(LocaleKeys.avg_score),
              ),
              const SizedBox(width: 8),
              _AchievementBadge(
                emoji: '📝',
                value: '+$lastTestDelta',
                label: context.tr(LocaleKeys.last_test),
              ),
              const SizedBox(width: 8),
              _AchievementBadge(
                emoji: '🏆',
                value: '$battleWins',
                label: context.tr(LocaleKeys.achievement_badge_wins),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.push(RoutePaths.progress),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: BorderSide(color: AppColors.white.withValues(alpha: 0.6)),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                context.tr(LocaleKeys.achievement_view_stats),
                style: TextStyles.semibold(AppColors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressRing extends StatelessWidget {
  const _ProgressRing({
    required this.progress,
    required this.percentLabel,
  });

  final double progress;
  final String percentLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 7,
              backgroundColor: AppColors.white.withValues(alpha: 0.2),
              valueColor: const AlwaysStoppedAnimation(AppColors.sunYellow),
              strokeCap: StrokeCap.round,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                percentLabel,
                style: TextStyles.bold(AppColors.white, fontSize: 16),
              ),
              Text(
                'ЕНТ',
                style: TextStyles.regular(
                  AppColors.white.withValues(alpha: 0.8),
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  const _AchievementBadge({
    required this.emoji,
    required this.value,
    required this.label,
  });

  final String emoji;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.25)),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyles.bold(AppColors.white, fontSize: 15),
            ),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyles.regular(
                AppColors.white.withValues(alpha: 0.85),
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
