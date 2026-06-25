import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/features/home/domain/entities/home_entity.dart';

class HomeLessonCta extends StatelessWidget {
  const HomeLessonCta({
    super.key,
    required this.lesson,
    this.onStart,
  });

  final LessonEntity lesson;
  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: 8,
            shadowColor: AppColors.mainColor.withValues(alpha: 0.35),
            color: AppColors.mainColor,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onStart,
              customBorder: const CircleBorder(),
              child: Container(
                width: 62,
                height: 62,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.mainGradient,
                  border: Border.all(
                    color: AppColors.white,
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: AppColors.white,
                  size: 34,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
