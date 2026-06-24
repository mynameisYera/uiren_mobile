import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/features/home/presentation/pages/main_shell_page.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTabScaffold(
      title: context.tr(LocaleKeys.nav_rating),
      body: Center(
        child: Icon(
          Icons.leaderboard_rounded,
          size: 72,
          color: AppColors.mainColor.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}
