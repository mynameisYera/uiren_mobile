import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class HomeDailyTaskChip extends StatelessWidget {
  const HomeDailyTaskChip({super.key, required this.isDone});

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDone
            ? const Color(0xFFE8F8EE)
            : AppColors.sunYellow.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDone
              ? const Color(0xFF3E9970).withValues(alpha: 0.3)
              : AppColors.sunYellow.withValues(alpha: 0.6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isDone ? Icons.check_circle_rounded : Icons.notifications_active_rounded,
            size: 18,
            color: isDone ? const Color(0xFF3E9970) : AppColors.secondaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            context.tr(LocaleKeys.daily_task_title),
            style: TextStyles.medium(AppColors.secondaryColor, fontSize: 13),
          ),
          const SizedBox(width: 8),
          Text(
            isDone
                ? context.tr(LocaleKeys.daily_task_done)
                : context.tr(LocaleKeys.daily_task_pending),
            style: TextStyles.semibold(
              isDone ? const Color(0xFF3E9970) : AppColors.secondaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
