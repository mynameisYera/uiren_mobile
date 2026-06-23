import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:uiren/src/features/progress/data/models/student_test_result.dart';
import 'package:uiren/src/features/university/data/university_selection_storage.dart';

class StudentTestHistoryRepository {
  StudentTestHistoryRepository._();
  static final StudentTestHistoryRepository instance =
      StudentTestHistoryRepository._();

  static const _historyKey = 'STUDENT_TEST_HISTORY_JSON';

  Box get _box => Hive.box('isLoggedIn');

  List<StudentTestResult>? _cache;

  List<StudentTestResult> get tests {
    _cache ??= _load();
    return _cache!;
  }

  int get averageScore {
    final list = tests;
    if (list.isEmpty) return 0;
    final sum = list.fold<int>(0, (acc, t) => acc + t.score);
    return (sum / list.length).round();
  }

  int get bestScore =>
      tests.isEmpty ? 0 : tests.map((t) => t.score).reduce((a, b) => a > b ? a : b);

  List<StudentTestResult> _load() {
    final raw = _box.get(_historyKey) as String?;
    if (raw != null) {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => StudentTestResult.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));
    }

    final demo = _demoTests();
    _cache = demo;
    return demo;
  }

  Future<void> saveTests(List<StudentTestResult> tests) async {
    _cache = List.of(tests)..sort((a, b) => a.date.compareTo(b.date));
    final encoded = jsonEncode(_cache!.map((e) => e.toJson()).toList());
    await _box.put(_historyKey, encoded);
    await UniversitySelectionStorage.instance
        .saveStudentAvgScore(averageScore);
  }

  /// Demo data until API is connected.
  List<StudentTestResult> _demoTests() {
    final now = DateTime.now();
    return [
      StudentTestResult(
        date: now.subtract(const Duration(days: 56)),
        score: 98,
        type: 'ent',
        label: 'Т1',
      ),
      StudentTestResult(
        date: now.subtract(const Duration(days: 49)),
        score: 102,
        type: 'repeat',
        label: 'Т2',
      ),
      StudentTestResult(
        date: now.subtract(const Duration(days: 42)),
        score: 105,
        type: 'ent',
        label: 'Т3',
      ),
      StudentTestResult(
        date: now.subtract(const Duration(days: 35)),
        score: 110,
        type: 'repeat',
        label: 'Т4',
      ),
      StudentTestResult(
        date: now.subtract(const Duration(days: 28)),
        score: 112,
        type: 'battle',
        label: 'Т5',
      ),
      StudentTestResult(
        date: now.subtract(const Duration(days: 21)),
        score: 115,
        type: 'ent',
        label: 'Т6',
      ),
      StudentTestResult(
        date: now.subtract(const Duration(days: 14)),
        score: 118,
        type: 'repeat',
        label: 'Т7',
      ),
      StudentTestResult(
        date: now.subtract(const Duration(days: 7)),
        score: 122,
        type: 'ent',
        label: 'Т8',
      ),
      StudentTestResult(
        date: now.subtract(const Duration(days: 2)),
        score: 125,
        type: 'ent',
        label: 'Т9',
      ),
    ];
  }
}
