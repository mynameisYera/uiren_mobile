import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:uiren/src/features/university/data/models/university_models.dart';

class UniversityRepository {
  UniversityRepository._();
  static final UniversityRepository instance = UniversityRepository._();

  List<University>? _cache;

  Future<List<University>> loadUniversities() async {
    if (_cache != null) return _cache!;
    final raw = await rootBundle.loadString('assets/data/university_data.json');
    final list = jsonDecode(raw) as List<dynamic>;
    _cache = list
        .map((e) => University.fromJson(e as Map<String, dynamic>))
        .toList();
    return _cache!;
  }

  Future<List<String>> getAllProfileSubjects() async {
    final universities = await loadUniversities();
    final subjects = <String>{};

    for (final university in universities) {
      for (final program in university.programs) {
        for (final required in program.requiredSubjects) {
          if (required.contains('/')) {
            for (final part in required.split('/')) {
              subjects.add(part.trim());
            }
          } else {
            subjects.add(required.trim());
          }
        }
      }
    }

    final sorted = subjects.toList()..sort();
    return sorted;
  }

  Future<List<UniversityMatch>> findMatches({
    required String subject1,
    required String subject2,
  }) async {
    if (subject1 == subject2) return [];

    final universities = await loadUniversities();
    final matches = <UniversityMatch>[];

    for (final university in universities) {
      for (final program in university.programs) {
        if (_programMatches(subject1, subject2, program.requiredSubjects)) {
          matches.add(UniversityMatch(university: university, program: program));
        }
      }
    }

    matches.sort(
      (a, b) => a.university.thresholdScore.compareTo(b.university.thresholdScore),
    );
    return matches;
  }

  bool _programMatches(
    String subject1,
    String subject2,
    List<String> requiredSubjects,
  ) {
    if (requiredSubjects.isEmpty) return false;

    if (requiredSubjects.length == 1) {
      final req = requiredSubjects.first;
      return _subjectMatches(subject1, req) || _subjectMatches(subject2, req);
    }

    if (requiredSubjects.length == 2) {
      final a = requiredSubjects[0];
      final b = requiredSubjects[1];
      return (_subjectMatches(subject1, a) && _subjectMatches(subject2, b)) ||
          (_subjectMatches(subject1, b) && _subjectMatches(subject2, a));
    }

    final s1Ok = requiredSubjects.any((r) => _subjectMatches(subject1, r));
    final s2Ok = requiredSubjects.any((r) => _subjectMatches(subject2, r));
    return s1Ok && s2Ok;
  }

  bool _subjectMatches(String selected, String required) {
    final normalized = _normalize(selected);
    final options = required.split('/').map((e) => _normalize(e.trim()));

    for (final option in options) {
      if (normalized == option ||
          normalized.contains(option) ||
          option.contains(normalized)) {
        return true;
      }
    }
    return false;
  }

  String _normalize(String value) => value.toLowerCase().trim();
}
