import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/widgets/app_surface_card.dart';
import 'package:uiren/src/core/widgets/feature_scaffold.dart';
import 'package:uiren/src/features/repeat_test/presentation/widgets/repeat_test_card.dart';

class RepeatTestPage extends StatelessWidget {
  const RepeatTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FeatureScaffold(
      title: context.tr(LocaleKeys.repeat_page_title),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AppSurfaceCard(
            child: Row(
              children: [
                const Text('🧠', style: TextStyle(fontSize: 32)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Ұстаз берген немесе ЕНТ-тен қайталау тесттері — күн сайын',
                    style: TextStyles.regular(AppColors.secondaryColor, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Бүгін',
            style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 16),
          ),
          const SizedBox(height: 10),
          const RepeatTestCard(
            title: 'Математика — ОЖСБ',
            questionsCount: 20,
            isDone: true,
          ),
          const RepeatTestCard(
            title: 'Қазақ тілі — ҰБТ',
            questionsCount: 15,
            isDone: false,
          ),
          const SizedBox(height: 16),
          Text(
            'Кеше',
            style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 16),
          ),
          const SizedBox(height: 10),
          const RepeatTestCard(
            title: 'Физика — БЖБ',
            questionsCount: 25,
            isDone: true,
          ),
        ],
      ),
    );
  }
}
