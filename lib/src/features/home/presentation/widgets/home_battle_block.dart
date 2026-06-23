import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/widgets/app_surface_card.dart';

class HomeBattleBlock extends StatelessWidget {
  const HomeBattleBlock({
    super.key,
    this.onlineCount = 12,
    this.streakDays = 5,
  });

  final int onlineCount;
  final int streakDays;

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.secondaryColor,
          AppColors.mainColor,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('⚔️', style: TextStyle(fontSize: 28)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys.battle_title),
                      style: TextStyles.bold(AppColors.white, fontSize: 17),
                    ),
                    Text(
                      context.tr(LocaleKeys.battle_subtitle),
                      style: TextStyles.regular(
                        AppColors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.sunYellow.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '🔥 ${context.tr(LocaleKeys.streak_label, namedArgs: {'days': '$streakDays'})}',
                  style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            context.tr(LocaleKeys.online_now, namedArgs: {'count': '$onlineCount'}),
            style: TextStyles.regular(
              AppColors.white.withValues(alpha: 0.8),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.push(RoutePaths.battle),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.secondaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                context.tr(LocaleKeys.find_opponent),
                style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
