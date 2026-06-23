import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class LanguageChangerWidget extends StatelessWidget {
  const LanguageChangerWidget({super.key});

  Future<void> _switchLocale(BuildContext context, Locale locale) async {
    if (context.locale == locale) return;
    await context.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    final activeCode = context.locale.languageCode;

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF5FF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.mainColor.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageChip(
              label: 'Қазақ',
              flag: '🇰🇿',
              isSelected: activeCode == 'kk',
              onTap: () => _switchLocale(context, const Locale('kk')),
            ),
            _LanguageChip(
              label: 'Рус',
              flag: '🇷🇺',
              isSelected: activeCode == 'ru',
              onTap: () => _switchLocale(context, const Locale('ru')),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.label,
    required this.flag,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String flag;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            gradient: isSelected ? AppColors.mainGradient : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(flag, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 5),
              Text(
                label,
                style: isSelected
                    ? TextStyles.semibold(AppColors.white, fontSize: 12)
                    : TextStyles.medium(AppColors.secondaryColor, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
