import 'package:flutter/material.dart';

/// Compares student average score with university [thresholdScore].
enum AdmissionChanceLevel {
  below,
  minimal,
  building,
  good,
  excellent,
}

class AdmissionChance {
  const AdmissionChance({
    required this.level,
    required this.studentAvg,
    required this.threshold,
  });

  final AdmissionChanceLevel level;
  final int studentAvg;
  final int threshold;

  int get diff => studentAvg - threshold;

  static AdmissionChance evaluate({
    required int studentAvg,
    required int threshold,
  }) {
    final difference = studentAvg - threshold;

    AdmissionChanceLevel level;
    if (difference < 0) {
      level = AdmissionChanceLevel.below;
    } else if (difference == 0) {
      level = AdmissionChanceLevel.minimal;
    } else if (difference > 50) {
      level = AdmissionChanceLevel.excellent;
    } else if (difference >= 20) {
      level = AdmissionChanceLevel.good;
    } else {
      level = AdmissionChanceLevel.building;
    }

    return AdmissionChance(
      level: level,
      studentAvg: studentAvg,
      threshold: threshold,
    );
  }

  Color get backgroundColor => switch (level) {
        AdmissionChanceLevel.below => const Color(0xFFFFF4E5),
        AdmissionChanceLevel.minimal => const Color(0xFFE8F0FA),
        AdmissionChanceLevel.building => const Color(0xFFE8F4FF),
        AdmissionChanceLevel.good => const Color(0xFFE8F8EE),
        AdmissionChanceLevel.excellent => const Color(0xFFFFF9E5),
      };

  Color get accentColor => switch (level) {
        AdmissionChanceLevel.below => const Color(0xFFE67E22),
        AdmissionChanceLevel.minimal => const Color(0xFF5B7C99),
        AdmissionChanceLevel.building => const Color(0xFF3399FF),
        AdmissionChanceLevel.good => const Color(0xFF3E9970),
        AdmissionChanceLevel.excellent => const Color(0xFFD4A017),
      };

  String get emoji => switch (level) {
        AdmissionChanceLevel.below => '🌱',
        AdmissionChanceLevel.minimal => '🎯',
        AdmissionChanceLevel.building => '📈',
        AdmissionChanceLevel.good => '🌟',
        AdmissionChanceLevel.excellent => '🎓',
      };
}
