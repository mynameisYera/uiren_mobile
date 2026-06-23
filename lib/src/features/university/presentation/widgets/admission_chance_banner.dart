import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/features/university/domain/admission_chance.dart';

class AdmissionChanceBanner extends StatelessWidget {
  const AdmissionChanceBanner({
    super.key,
    required this.chance,
  });

  final AdmissionChance chance;

  @override
  Widget build(BuildContext context) {
    final gap = chance.diff.abs();

    final message = switch (chance.level) {
      AdmissionChanceLevel.below => context.tr(
          LocaleKeys.chance_below,
          namedArgs: {
            'gap': '$gap',
            'threshold': '${chance.threshold}',
          },
        ),
      AdmissionChanceLevel.minimal => context.tr(
          LocaleKeys.chance_minimal,
          namedArgs: {'threshold': '${chance.threshold}'},
        ),
      AdmissionChanceLevel.building => context.tr(
          LocaleKeys.chance_building,
          namedArgs: {
            'gap': '${chance.diff}',
            'threshold': '${chance.threshold}',
          },
        ),
      AdmissionChanceLevel.good => context.tr(
          LocaleKeys.chance_good,
          namedArgs: {
            'gap': '${chance.diff}',
            'threshold': '${chance.threshold}',
          },
        ),
      AdmissionChanceLevel.excellent => context.tr(
          LocaleKeys.chance_excellent,
          namedArgs: {'avg': '${chance.studentAvg}'},
        ),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: chance.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: chance.accentColor.withValues(alpha: 0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(chance.emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyles.regular(chance.accentColor, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
