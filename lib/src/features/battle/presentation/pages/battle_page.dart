import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/widgets/app_surface_card.dart';
import 'package:uiren/src/core/widgets/feature_scaffold.dart';
import 'package:uiren/src/features/battle/presentation/widgets/battle_opponent_tile.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_battle_block.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  static const _classmates = [
    ('Алина', 'Математика', true),
    ('Нұрлан', 'Физика', true),
    ('Дана', 'Биология', false),
    ('Ерлан', 'Химия', true),
  ];

  @override
  Widget build(BuildContext context) {
    return FeatureScaffold(
      title: context.tr(LocaleKeys.battle_page_title),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const HomeBattleBlock(onlineCount: 12, streakDays: 5),
          const SizedBox(height: 20),
          AppSurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(LocaleKeys.battle_subtitle),
                  style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 15),
                ),
                const SizedBox(height: 12),
                ..._classmates.map(
                  (item) => BattleOpponentTile(
                    name: item.$1,
                    subject: item.$2,
                    isOnline: item.$3,
                    onChallenge: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
