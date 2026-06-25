import 'package:flutter/material.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/features/auth/presentation/widgets/language_changer_widget.dart';
import 'package:uiren/src/features/home/domain/entities/home_entity.dart';

class CurrentLessonInfo {
  const CurrentLessonInfo({
    required this.chapter,
    required this.lesson,
  });

  final ChapterEntity chapter;
  final LessonEntity lesson;
}

class HomeCourseHeader extends StatelessWidget {
  const HomeCourseHeader({
    super.key,
    required this.courseName,
    required this.currentLesson,
    this.courses = const [],
    this.selectedCourseId,
    this.onCourseSelected,
  });

  final String courseName;
  final CurrentLessonInfo? currentLesson;
  final List<CourseSummaryEntity> courses;
  final int? selectedCourseId;
  final ValueChanged<int>? onCourseSelected;

  static const _radius = 18.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.secondaryColor,
              AppColors.secondaryColor.withValues(alpha: 0.88),
              const Color(0xFF2A4A73),
            ],
          ),
          borderRadius: BorderRadius.circular(_radius),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withValues(alpha: 0.22),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child: Row(
                children: [
                  if (courses.length > 1)
                    _CourseMenuButton(
                      courses: courses,
                      selectedCourseId: selectedCourseId ?? courses.first.id,
                      onCourseSelected: onCourseSelected,
                    )
                  else
                    const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      courseName,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bold(
                        AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const LanguageChangerWidget(),
                ],
              ),
            ),
            if (currentLesson != null)
              Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.14),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${currentLesson!.chapter.name} · ${currentLesson!.lesson.topic}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.regular(
                        AppColors.white.withValues(alpha: 0.78),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      currentLesson!.lesson.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bold(
                        AppColors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CourseMenuButton extends StatelessWidget {
  const _CourseMenuButton({
    required this.courses,
    required this.selectedCourseId,
    this.onCourseSelected,
  });

  final List<CourseSummaryEntity> courses;
  final int selectedCourseId;
  final ValueChanged<int>? onCourseSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.menu_rounded,
        color: AppColors.white.withValues(alpha: 0.92),
      ),
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      onSelected: onCourseSelected,
      itemBuilder: (context) {
        return courses
            .map(
              (course) => PopupMenuItem<int>(
                value: course.id,
                child: Text(
                  course.name,
                  style: TextStyles.medium(
                    course.id == selectedCourseId
                        ? AppColors.mainColor
                        : AppColors.secondaryColor,
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList();
      },
    );
  }
}

CurrentLessonInfo? resolveCurrentLesson(
  List<ChapterEntity> chapters,
  int? lessonId,
) {
  if (chapters.isEmpty) {
    return null;
  }

  for (final chapter in chapters) {
    for (final lesson in chapter.lessons) {
      if (lessonId == null || lesson.id == lessonId) {
        return CurrentLessonInfo(chapter: chapter, lesson: lesson);
      }
    }
  }

  return null;
}
