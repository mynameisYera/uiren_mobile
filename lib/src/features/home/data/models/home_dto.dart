import 'package:uiren/src/features/home/domain/entities/home_entity.dart';

class LessonDto {
  const LessonDto({
    required this.id,
    required this.name,
    required this.topic,
    required this.videoUrl,
    required this.firstTestId,
    required this.secondTestId,
    required this.thirdTestId,
  });

  factory LessonDto.fromJson(Map<String, dynamic> json) {
    return LessonDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
      topic: json['topic'] as String? ?? '',
      videoUrl: json['video_url'] as String? ?? '',
      firstTestId: (json['first_test_id'] as num).toInt(),
      secondTestId: (json['second_test_id'] as num).toInt(),
      thirdTestId: (json['third_test_id'] as num).toInt(),
    );
  }

  final int id;
  final String name;
  final String topic;
  final String videoUrl;
  final int firstTestId;
  final int secondTestId;
  final int thirdTestId;

  LessonEntity toEntity() {
    return LessonEntity(
      id: id,
      name: name,
      topic: topic,
      videoUrl: videoUrl,
      firstTestId: firstTestId,
      secondTestId: secondTestId,
      thirdTestId: thirdTestId,
    );
  }
}

class ChapterDto {
  const ChapterDto({
    required this.id,
    required this.name,
    required this.lessons,
  });

  factory ChapterDto.fromJson(Map<String, dynamic> json) {
    final lessonsJson = json['lessons'] as List<dynamic>? ?? [];
    return ChapterDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
      lessons: lessonsJson
          .map((item) => LessonDto.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList(),
    );
  }

  final int id;
  final String name;
  final List<LessonDto> lessons;

  ChapterEntity toEntity() {
    return ChapterEntity(
      id: id,
      name: name,
      lessons: lessons.map((lesson) => lesson.toEntity()).toList(),
    );
  }
}

class CourseRoadmapDto {
  const CourseRoadmapDto({
    required this.id,
    required this.name,
    required this.chapters,
  });

  factory CourseRoadmapDto.fromJson(Map<String, dynamic> json) {
    final chaptersJson = json['chapters'] as List<dynamic>? ?? [];
    return CourseRoadmapDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
      chapters: chaptersJson
          .map((item) => ChapterDto.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList(),
    );
  }

  final int id;
  final String name;
  final List<ChapterDto> chapters;

  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      name: name,
      chapters: chapters.map((chapter) => chapter.toEntity()).toList(),
    );
  }
}

class CourseSummaryDto {
  const CourseSummaryDto({
    required this.id,
    required this.name,
  });

  factory CourseSummaryDto.fromJson(Map<String, dynamic> json) {
    return CourseSummaryDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
    );
  }

  final int id;
  final String name;

  CourseSummaryEntity toEntity() {
    return CourseSummaryEntity(id: id, name: name);
  }
}

class HomeDto {
  const HomeDto({
    required this.hasCourses,
    required this.currentCourseId,
    required this.courses,
    required this.roadmap,
  });

  factory HomeDto.fromJson(Map<String, dynamic> json) {
    final coursesJson = json['courses'] as List<dynamic>? ?? [];
    final roadmapJson = json['roadmap'] as List<dynamic>? ?? [];

    return HomeDto(
      hasCourses: json['has_courses'] as bool? ?? false,
      currentCourseId: (json['current_course_id'] as num?)?.toInt(),
      courses: coursesJson
          .map((item) => CourseSummaryDto.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList(),
      roadmap: roadmapJson
          .map((item) => CourseRoadmapDto.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList(),
    );
  }

  final bool hasCourses;
  final int? currentCourseId;
  final List<CourseSummaryDto> courses;
  final List<CourseRoadmapDto> roadmap;

  HomeEntity toEntity() {
    return HomeEntity(
      hasCourses: hasCourses,
      currentCourseId: currentCourseId,
      courses: courses.map((course) => course.toEntity()).toList(),
      roadmap: roadmap.map((course) => course.toEntity()).toList(),
    );
  }
}
