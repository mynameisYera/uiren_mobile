import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_daily_task_chip.dart';

class HomeGreetingHeader extends StatelessWidget {
  const HomeGreetingHeader({
    super.key,
    this.studentName = 'Айдар',
    this.dailyDone = false,
  });

  final String studentName;
  final bool dailyDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.home_greeting, namedArgs: {'name': studentName}),
          style: TextStyles.bold(AppColors.secondaryColor, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          context.tr(LocaleKeys.home_subtitle),
          style: TextStyles.regular(AppColors.grey, fontSize: 14),
        ),
        const SizedBox(height: 12),
        HomeDailyTaskChip(isDone: dailyDone),
      ],
    );
  }
}
