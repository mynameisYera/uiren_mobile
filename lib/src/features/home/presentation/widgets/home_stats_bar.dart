import 'package:flutter/material.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class HomeStatsBar extends StatelessWidget {
  const HomeStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        children: const [
          _StatChip(
            icon: Icons.monetization_on_outlined,
            iconColor: AppColors.sunYellow,
            value: '0',
          ),
          SizedBox(width: 8),
          _StatChip(
            icon: Icons.local_fire_department_outlined,
            iconColor: Color(0xFFE85D4C),
            value: '0',
          ),
          Spacer(),
          _StatChip(
            icon: Icons.bolt_outlined,
            iconColor: AppColors.mainColor,
            value: 'x1',
            compact: true,
          ),
          SizedBox(width: 8),
          _StatChip(
            icon: Icons.emoji_events_outlined,
            iconColor: AppColors.secondaryColor,
            value: '0',
            compact: true,
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.iconColor,
    required this.value,
    this.compact = false,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2EAF0)),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(width: 6),
          Text(
            value,
            style: TextStyles.semibold(
              AppColors.secondaryColor,
              fontSize: compact ? 13 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
