import 'package:uiren/src/core/base/base_models/base_entity.dart';

class LessonEntity extends BaseEntity {
  const LessonEntity({
    required this.id,
    required this.name,
    required this.topic,
    required this.videoUrl,
    required this.firstTestId,
    required this.secondTestId,
    required this.thirdTestId,
  });

  final int id;
  final String name;
  final String topic;
  final String videoUrl;
  final int firstTestId;
  final int secondTestId;
  final int thirdTestId;
}

class ChapterEntity extends BaseEntity {
  const ChapterEntity({
    required this.id,
    required this.name,
    required this.lessons,
  });

  final int id;
  final String name;
  final List<LessonEntity> lessons;
}

class CourseEntity extends BaseEntity {
  const CourseEntity({
    required this.id,
    required this.name,
    required this.chapters,
  });

  final int id;
  final String name;
  final List<ChapterEntity> chapters;
}

class CourseSummaryEntity extends BaseEntity {
  const CourseSummaryEntity({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
}

class HomeEntity extends BaseEntity {
  const HomeEntity({
    required this.hasCourses,
    required this.currentCourseId,
    required this.courses,
    required this.roadmap,
  });

  final bool hasCourses;
  final int? currentCourseId;
  final List<CourseSummaryEntity> courses;
  final List<CourseEntity> roadmap;

  CourseEntity? courseById(int id) {
    for (final course in roadmap) {
      if (course.id == id) {
        return course;
      }
    }
    return null;
  }
}
