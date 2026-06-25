import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/features/auth/presentation/widgets/language_changer_widget.dart';
import 'package:uiren/src/features/home/domain/entities/home_entity.dart';
import 'package:uiren/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:uiren/src/features/home/presentation/widgets/duolingo_roadmap.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_course_header.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_lesson_cta.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_stats_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = getIt<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget<HomeBloc, HomeEvent, HomeState>(
      bloc: _homeBloc,
      starterEvent: const HomeEvent.started(),
      builder: (context, state, bloc) {
        return Scaffold(
          backgroundColor: const Color(0xFFF4F7FA),
          body: SafeArea(
            bottom: false,
            child: state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ),
              ),
              empty: () => _HomeEmptyState(
                onRetry: () => bloc.add(const HomeEvent.refreshed()),
              ),
              loaded: (home, selectedCourseId) => _HomeLoadedBody(
                home: home,
                selectedCourseId: selectedCourseId,
                onCourseSelected: (courseId) {
                  bloc.add(HomeEvent.courseSelected(courseId));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HomeLoadedBody extends StatelessWidget {
  const _HomeLoadedBody({
    required this.home,
    required this.selectedCourseId,
    required this.onCourseSelected,
  });

  final HomeEntity home;
  final int selectedCourseId;
  final ValueChanged<int> onCourseSelected;

  @override
  Widget build(BuildContext context) {
    final selectedCourse = home.courseById(selectedCourseId);
    final chapters = selectedCourse?.chapters ?? const <ChapterEntity>[];
    final currentLessonId = _resolveCurrentLessonId(chapters);
    final currentLesson = resolveCurrentLesson(chapters, currentLessonId);
    final courseName = selectedCourse?.name ??
        home.courses
            .where((course) => course.id == selectedCourseId)
            .map((course) => course.name)
            .firstOrNull ??
        context.tr(LocaleKeys.nav_home);

    if (chapters.isEmpty) {
      return Column(
        children: [
          const HomeStatsBar(),
          HomeCourseHeader(
            courseName: courseName,
            currentLesson: null,
            courses: home.courses,
            selectedCourseId: selectedCourseId,
            onCourseSelected: onCourseSelected,
          ),
          Expanded(
            child: _HomeEmptyChaptersState(courseName: courseName),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HomeStatsBar(),
        HomeCourseHeader(
          courseName: courseName,
          currentLesson: currentLesson,
          courses: home.courses,
          selectedCourseId: selectedCourseId,
          onCourseSelected: onCourseSelected,
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              DuolingoRoadmap(
                chapters: chapters,
                currentLessonId: currentLessonId,
              ),
            ],
          ),
        ),
      ],
    );
  }

  int? _resolveCurrentLessonId(List<ChapterEntity> chapters) {
    for (final chapter in chapters) {
      if (chapter.lessons.isNotEmpty) {
        return chapter.lessons.first.id;
      }
    }
    return null;
  }
}

class _HomeEmptyState extends StatelessWidget {
  const _HomeEmptyState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 12, 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  context.tr(LocaleKeys.nav_home),
                  style: TextStyles.bold(
                    AppColors.secondaryColor,
                    fontSize: 24,
                  ),
                ),
              ),
              const LanguageChangerWidget(),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_outlined,
                    size: 72,
                    color: AppColors.mainColor.withValues(alpha: 0.35),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.tr(LocaleKeys.home_no_courses),
                    textAlign: TextAlign.center,
                    style: TextStyles.medium(
                      AppColors.secondaryColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: onRetry,
                    child: Text(context.tr(LocaleKeys.home_retry)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeEmptyChaptersState extends StatelessWidget {
  const _HomeEmptyChaptersState({required this.courseName});

  final String courseName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          context.tr(
            LocaleKeys.home_no_chapters,
            namedArgs: {'course': courseName},
          ),
          textAlign: TextAlign.center,
          style: TextStyles.medium(
            AppColors.secondaryColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
