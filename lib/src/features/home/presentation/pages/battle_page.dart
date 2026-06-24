import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/features/home/presentation/pages/main_shell_page.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTabScaffold(
      title: context.tr(LocaleKeys.battle_page_title),
      body: Center(
        child: Icon(
          Icons.sports_martial_arts_rounded,
          size: 72,
          color: AppColors.mainColor.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}
