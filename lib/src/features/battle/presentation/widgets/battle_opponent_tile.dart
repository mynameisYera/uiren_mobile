import 'package:flutter/material.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class BattleOpponentTile extends StatelessWidget {
  const BattleOpponentTile({
    super.key,
    required this.name,
    required this.subject,
    required this.isOnline,
    this.onChallenge,
  });

  final String name;
  final String subject;
  final bool isOnline;
  final VoidCallback? onChallenge;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.mainColor.withValues(alpha: 0.15),
            child: Text(
              name.isNotEmpty ? name[0] : '?',
              style: TextStyles.bold(AppColors.mainColor, fontSize: 16),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 15),
                ),
                Text(
                  subject,
                  style: TextStyles.regular(AppColors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOnline ? const Color(0xFF3E9970) : AppColors.grey,
            ),
          ),
          const SizedBox(width: 12),
          IconButton.filled(
            onPressed: onChallenge,
            icon: const Icon(Icons.sports_kabaddi_rounded, size: 20),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              foregroundColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
