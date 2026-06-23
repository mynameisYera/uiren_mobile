import 'package:flutter/material.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class RepeatTestCard extends StatelessWidget {
  const RepeatTestCard({
    super.key,
    required this.title,
    required this.questionsCount,
    required this.isDone,
    this.onTap,
  });

  final String title;
  final int questionsCount;
  final bool isDone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDone
                  ? const Color(0xFF3E9970).withValues(alpha: 0.3)
                  : AppColors.mainColor.withValues(alpha: 0.15),
            ),
          ),
          child: Row(
            children: [
              Icon(
                isDone ? Icons.check_circle_rounded : Icons.quiz_rounded,
                color: isDone ? const Color(0xFF3E9970) : AppColors.mainColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 14),
                    ),
                    Text(
                      '$questionsCount сұрақ',
                      style: TextStyles.regular(AppColors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: AppColors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
