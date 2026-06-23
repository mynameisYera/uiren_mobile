class StudentTestResult {
  const StudentTestResult({
    required this.date,
    required this.score,
    required this.type,
    this.label,
  });

  final DateTime date;
  final int score;
  final String type;
  final String? label;

  String get shortLabel {
    if (label != null && label!.isNotEmpty) return label!;
    return '${date.day}.${date.month.toString().padLeft(2, '0')}';
  }

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'score': score,
        'type': type,
        'label': label,
      };

  factory StudentTestResult.fromJson(Map<String, dynamic> json) {
    return StudentTestResult(
      date: DateTime.parse(json['date'] as String),
      score: json['score'] as int,
      type: json['type'] as String,
      label: json['label'] as String?,
    );
  }
}
