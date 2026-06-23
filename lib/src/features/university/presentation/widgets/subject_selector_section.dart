import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class SubjectSelectorSection extends StatelessWidget {
  const SubjectSelectorSection({
    super.key,
    required this.title,
    required this.subjects,
    required this.selected,
    required this.disabledSubject,
    required this.onSelected,
  });

  final String title;
  final List<String> subjects;
  final String? selected;
  final String? disabledSubject;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 15),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: subjects.map((subject) {
            final isSelected = selected == subject;
            final isDisabled = disabledSubject == subject;
            return FilterChip(
              label: Text(
                subject,
                style: TextStyles.medium(
                  isSelected
                      ? AppColors.white
                      : isDisabled
                          ? AppColors.grey
                          : AppColors.secondaryColor,
                  fontSize: 12,
                ),
              ),
              selected: isSelected,
              onSelected: isDisabled
                  ? null
                  : (_) => onSelected(subject),
              selectedColor: AppColors.mainColor,
              backgroundColor: const Color(0xFFEAF5FF),
              checkmarkColor: AppColors.white,
              side: BorderSide(
                color: isSelected
                    ? AppColors.mainColor
                    : AppColors.mainColor.withValues(alpha: 0.2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SubjectStepHeader extends StatelessWidget {
  const SubjectStepHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.university_select_title),
          style: TextStyles.bold(AppColors.secondaryColor, fontSize: 22),
        ),
        const SizedBox(height: 6),
        Text(
          context.tr(LocaleKeys.university_step_subjects),
          style: TextStyles.regular(AppColors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
