import 'package:hive_flutter/hive_flutter.dart';

class UniversitySelectionStorage {
  UniversitySelectionStorage._();
  static final UniversitySelectionStorage instance = UniversitySelectionStorage._();

  static const _subject1Key = 'UNI_PROFILE_SUBJECT_1';
  static const _subject2Key = 'UNI_PROFILE_SUBJECT_2';
  static const _universitiesKey = 'SELECTED_UNIVERSITY_NAMES';
  static const _avgScoreKey = 'STUDENT_AVG_SCORE';

  Box get _box => Hive.box('isLoggedIn');

  /// Demo default until API/stats are connected.
  int get studentAvgScore => (_box.get(_avgScoreKey) as int?) ?? 118;

  Future<void> saveStudentAvgScore(int score) async {
    await _box.put(_avgScoreKey, score);
  }

  String? get subject1 => _box.get(_subject1Key) as String?;
  String? get subject2 => _box.get(_subject2Key) as String?;

  List<String> get selectedUniversityNames {
    final raw = _box.get(_universitiesKey);
    if (raw is List) {
      return raw.map((e) => e.toString()).toList();
    }
    return [];
  }

  Future<void> saveSubjects({
    required String subject1,
    required String subject2,
  }) async {
    await _box.put(_subject1Key, subject1);
    await _box.put(_subject2Key, subject2);
  }

  Future<void> saveSelectedUniversities(List<String> names) async {
    await _box.put(_universitiesKey, names);
  }

  bool get hasSubjects => subject1 != null && subject2 != null;
}
