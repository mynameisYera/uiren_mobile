import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/widgets/app_surface_card.dart';
import 'package:uiren/src/core/widgets/feature_scaffold.dart';
import 'package:uiren/src/features/auth/presentation/widgets/custom_button.dart';

class TestStartPage extends StatelessWidget {
  const TestStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FeatureScaffold(
      title: context.tr(LocaleKeys.test_page_title),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppSurfaceCard(
              child: Column(
                children: [
                  const Text('📝', style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 12),
                  Text(
                    'ОЖСБ · ҰБТ · БЖБ',
                    style: TextStyles.bold(AppColors.secondaryColor, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.tr(LocaleKeys.test_rules),
                    textAlign: TextAlign.center,
                    style: TextStyles.regular(AppColors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  _RuleRow(icon: Icons.block_flipped, text: 'Шығуға болмайды'),
                  _RuleRow(icon: Icons.screenshot_monitor_outlined, text: 'Скриншот тыйым'),
                  _RuleRow(icon: Icons.family_restroom_outlined, text: 'Ата-анаға нәтиже жіберіледі'),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              color: AppColors.mainColor,
              text: context.tr(LocaleKeys.start_now),
              textColor: AppColors.white,
              height: 56,
              borderRadius: 20,
              onPressed: () {},
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _RuleRow extends StatelessWidget {
  const _RuleRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.red),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyles.regular(AppColors.secondaryColor, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
