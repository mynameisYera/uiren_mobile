import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/features/university/data/models/university_models.dart';
import 'package:uiren/src/features/university/domain/admission_chance.dart';
import 'package:uiren/src/features/university/presentation/widgets/admission_chance_banner.dart';

class UniversityMatchTile extends StatelessWidget {
  const UniversityMatchTile({
    super.key,
    required this.match,
    required this.isSelected,
    required this.onToggle,
    required this.studentAvgScore,
    this.selectionEnabled = true,
  });

  final UniversityMatch match;
  final bool isSelected;
  final VoidCallback onToggle;
  final int studentAvgScore;
  final bool selectionEnabled;

  @override
  Widget build(BuildContext context) {
    final university = match.university;
    final program = match.program;
    final chance = AdmissionChance.evaluate(
      studentAvg: studentAvgScore,
      threshold: university.thresholdScore,
    );

    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: selectionEnabled ? onToggle : null,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? AppColors.mainColor
                  : AppColors.mainColor.withValues(alpha: 0.15),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondaryColor.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          university.shortName,
                          style: TextStyles.semibold(
                            AppColors.secondaryColor,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${university.city} · ${university.type}',
                          style: TextStyles.regular(AppColors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  if (selectionEnabled)
                    Icon(
                      isSelected
                          ? Icons.check_circle_rounded
                          : Icons.circle_outlined,
                      color: isSelected ? AppColors.mainColor : AppColors.grey,
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF5FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  program.fieldOfStudy,
                  style: TextStyles.medium(AppColors.secondaryColor, fontSize: 12),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _InfoChip(
                    icon: Icons.school_outlined,
                    label: context.tr(
                      LocaleKeys.university_threshold,
                      namedArgs: {'score': '${university.thresholdScore}'},
                    ),
                  ),
                  const SizedBox(width: 8),
                  _InfoChip(
                    icon: Icons.menu_book_outlined,
                    label: program.requiredSubjects.join(' + '),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              AdmissionChanceBanner(chance: chance),
              if (university.note != null) ...[
                const SizedBox(height: 8),
                Text(
                  university.note!,
                  style: TextStyles.regular(AppColors.grey, fontSize: 10),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppColors.mainColor),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.regular(AppColors.secondaryColor, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
