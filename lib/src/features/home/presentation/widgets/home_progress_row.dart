import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class HomeProgressRow extends StatelessWidget {
  const HomeProgressRow({
    super.key,
    this.avgScore = 118,
    this.lastTestScore = 125,
    this.streakDays = 5,
  });

  final int avgScore;
  final int lastTestScore;
  final int streakDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatMiniCard(
            icon: Icons.star_rounded,
            iconColor: AppColors.sunYellow,
            label: context.tr(LocaleKeys.avg_score),
            value: '$avgScore',
            onTap: () => context.push(RoutePaths.progress),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatMiniCard(
            icon: Icons.assignment_turned_in_rounded,
            iconColor: AppColors.mainColor,
            label: context.tr(LocaleKeys.last_test),
            value: '$lastTestScore',
            onTap: () => context.push(RoutePaths.progress),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatMiniCard(
            icon: Icons.local_fire_department_rounded,
            iconColor: AppColors.red,
            label: context.tr(LocaleKeys.stat_streak),
            value: '$streakDays',
            onTap: () => context.push(RoutePaths.progress),
          ),
        ),
      ],
    );
  }
}

class _StatMiniCard extends StatelessWidget {
  const _StatMiniCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondaryColor.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyles.bold(AppColors.secondaryColor, fontSize: 20),
              ),
              Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.regular(AppColors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
