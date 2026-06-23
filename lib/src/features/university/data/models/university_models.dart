class UniversityProgram {
  const UniversityProgram({
    required this.fieldOfStudy,
    required this.requiredSubjects,
  });

  final String fieldOfStudy;
  final List<String> requiredSubjects;

  factory UniversityProgram.fromJson(Map<String, dynamic> json) {
    return UniversityProgram(
      fieldOfStudy: json['field_of_study'] as String,
      requiredSubjects: (json['required_subjects'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }
}

class University {
  const University({
    required this.name,
    required this.city,
    required this.type,
    required this.thresholdScore,
    required this.programs,
    this.note,
  });

  final String name;
  final String city;
  final String type;
  final int thresholdScore;
  final List<UniversityProgram> programs;
  final String? note;

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['university_name'] as String,
      city: json['city'] as String,
      type: json['type'] as String,
      thresholdScore: json['threshold_score'] as int,
      note: json['note'] as String?,
      programs: (json['programs'] as List<dynamic>)
          .map((e) => UniversityProgram.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String get shortName {
    final match = RegExp(r'\(([^)]+)\)').firstMatch(name);
    if (match != null) return match.group(1)!;
    if (name.length <= 24) return name;
    return '${name.substring(0, 22)}…';
  }
}

class UniversityMatch {
  const UniversityMatch({
    required this.university,
    required this.program,
  });

  final University university;
  final UniversityProgram program;
}
