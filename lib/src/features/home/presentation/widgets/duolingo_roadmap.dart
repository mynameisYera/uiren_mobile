import 'package:flutter/material.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/features/home/domain/entities/home_entity.dart';

class DuolingoRoadmap extends StatelessWidget {
  const DuolingoRoadmap({
    super.key,
    required this.chapters,
    required this.currentLessonId,
    this.onLessonTap,
  });

  final List<ChapterEntity> chapters;
  final int? currentLessonId;
  final ValueChanged<LessonEntity>? onLessonTap;

  static const _nodeSize = 62.0;
  static const _currentNodeSize = 72.0;
  static const _rowHeight = 108.0;
  static const _horizontalPadding = 36.0;

  @override
  Widget build(BuildContext context) {
    final items = _buildItems();
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final pathWidth = constraints.maxWidth - _horizontalPadding * 2;

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 210),
          child: SizedBox(
            width: constraints.maxWidth,
            child: CustomPaint(
              painter: _RoadmapPathPainter(
                items: items,
                rowHeight: _rowHeight,
                horizontalPadding: _horizontalPadding,
                pathWidth: pathWidth,
                nodeRadius: _currentNodeSize / 2,
              ),
              child: Column(
                children: [
                  for (final item in items) ...[
                    if (item is _ChapterHeaderItem)
                      _SectionDivider(title: item.title)
                    else if (item is _LessonNodeItem)
                      _LessonRow(
                        lesson: item.lesson,
                        lessonIndex: item.lessonIndex,
                        isLeft: item.isLeft,
                        isCurrent: item.isCurrent,
                        isCompleted: item.isCompleted,
                        isLocked: item.isLocked,
                        rowHeight: _rowHeight,
                        horizontalPadding: _horizontalPadding,
                        pathWidth: pathWidth,
                        nodeSize: item.isCurrent ? _currentNodeSize : _nodeSize,
                        onTap: onLessonTap,
                      ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<_RoadmapItem> _buildItems() {
    final items = <_RoadmapItem>[];
    var lessonIndex = 0;
    final resolvedCurrentLessonId = currentLessonId ?? _firstLessonId();
    var seenCurrent = false;

    for (final chapter in chapters) {
      if (chapter.lessons.isEmpty) {
        continue;
      }

      items.add(_ChapterHeaderItem(title: chapter.name));

      for (final lesson in chapter.lessons) {
        final isCurrent = lesson.id == resolvedCurrentLessonId;
        final isCompleted = !seenCurrent && !isCurrent;
        final isLocked = seenCurrent && !isCurrent;

        if (isCurrent) {
          seenCurrent = true;
        }

        items.add(
          _LessonNodeItem(
            lesson: lesson,
            lessonIndex: lessonIndex,
            isLeft: lessonIndex.isEven,
            isCurrent: isCurrent,
            isCompleted: isCompleted,
            isLocked: isLocked,
          ),
        );
        lessonIndex++;
      }
    }

    return items;
  }

  int? _firstLessonId() {
    for (final chapter in chapters) {
      if (chapter.lessons.isNotEmpty) {
        return chapter.lessons.first.id;
      }
    }
    return null;
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 14),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Color(0xFFD0DCE6),
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.medium(
                AppColors.secondaryColor.withValues(alpha: 0.72),
                fontSize: 13,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Color(0xFFD0DCE6),
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonRow extends StatelessWidget {
  const _LessonRow({
    required this.lesson,
    required this.lessonIndex,
    required this.isLeft,
    required this.isCurrent,
    required this.isCompleted,
    required this.isLocked,
    required this.rowHeight,
    required this.horizontalPadding,
    required this.pathWidth,
    required this.nodeSize,
    this.onTap,
  });

  final LessonEntity lesson;
  final int lessonIndex;
  final bool isLeft;
  final bool isCurrent;
  final bool isCompleted;
  final bool isLocked;
  final double rowHeight;
  final double horizontalPadding;
  final double pathWidth;
  final double nodeSize;
  final ValueChanged<LessonEntity>? onTap;

  @override
  Widget build(BuildContext context) {
    final alignment = isLeft ? Alignment.centerLeft : Alignment.centerRight;

    return SizedBox(
      height: rowHeight,
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: _LessonNode(
            lesson: lesson,
            lessonIndex: lessonIndex,
            size: nodeSize,
            isCurrent: isCurrent,
            isCompleted: isCompleted,
            isLocked: isLocked,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class _LessonNode extends StatelessWidget {
  const _LessonNode({
    required this.lesson,
    required this.lessonIndex,
    required this.size,
    required this.isCurrent,
    required this.isCompleted,
    required this.isLocked,
    this.onTap,
  });

  final LessonEntity lesson;
  final int lessonIndex;
  final double size;
  final bool isCurrent;
  final bool isCompleted;
  final bool isLocked;
  final ValueChanged<LessonEntity>? onTap;

  IconData _iconForLesson() {
    if (isLocked) {
      return Icons.lock_outline_rounded;
    }
    if (isCompleted) {
      return Icons.check_rounded;
    }

    switch (lessonIndex % 3) {
      case 0:
        return Icons.menu_book_outlined;
      case 1:
        return Icons.edit_note_outlined;
      default:
        return Icons.calculate_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isLocked
        ? const Color(0xFFE8EEF3)
        : isCurrent
            ? AppColors.secondaryColor
            : isCompleted
                ? AppColors.white
                : AppColors.white;
    final borderColor = isCurrent
        ? AppColors.white
        : isCompleted
            ? AppColors.mainColor.withValues(alpha: 0.55)
            : isLocked
                ? const Color(0xFFCBD5E1)
                : AppColors.secondaryColor.withValues(alpha: 0.28);
    final iconColor = isLocked
        ? const Color(0xFF94A3B8)
        : isCurrent || isCompleted
            ? isCurrent
                ? AppColors.white
                : AppColors.mainColor
            : AppColors.secondaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isLocked ? null : () => onTap?.call(lesson),
                customBorder: const CircleBorder(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor,
                    border: Border.all(
                      color: borderColor,
                      width: isCurrent ? 4 : 2.5,
                    ),
                    boxShadow: isCurrent
                        ? [
                            BoxShadow(
                              color: AppColors.secondaryColor.withValues(alpha: 0.28),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: AppColors.secondaryColor.withValues(alpha: 0.06),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                  ),
                  child: Icon(
                    _iconForLesson(),
                    color: iconColor,
                    size: isCurrent ? 30 : 24,
                  ),
                ),
              ),
            ),
            if (!isLocked && !isCompleted)
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.sunYellow,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.sunYellow.withValues(alpha: 0.35),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.star_rounded,
                    size: 12,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: size + 42,
          child: Text(
            lesson.topic.isNotEmpty ? lesson.topic : lesson.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.regular(
              isLocked
                  ? const Color(0xFF94A3B8)
                  : AppColors.secondaryColor.withValues(alpha: 0.88),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

sealed class _RoadmapItem {}

class _ChapterHeaderItem extends _RoadmapItem {
  _ChapterHeaderItem({required this.title});

  final String title;
}

class _LessonNodeItem extends _RoadmapItem {
  _LessonNodeItem({
    required this.lesson,
    required this.lessonIndex,
    required this.isLeft,
    required this.isCurrent,
    required this.isCompleted,
    required this.isLocked,
  });

  final LessonEntity lesson;
  final int lessonIndex;
  final bool isLeft;
  final bool isCurrent;
  final bool isCompleted;
  final bool isLocked;
}

class _RoadmapPathPainter extends CustomPainter {
  _RoadmapPathPainter({
    required this.items,
    required this.rowHeight,
    required this.horizontalPadding,
    required this.pathWidth,
    required this.nodeRadius,
  });

  final List<_RoadmapItem> items;
  final double rowHeight;
  final double horizontalPadding;
  final double pathWidth;
  final double nodeRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final lessonItems = items.whereType<_LessonNodeItem>().toList();
    if (lessonItems.length < 2) {
      return;
    }

    final paint = Paint()
      ..color = const Color(0xFFD0DCE6)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset nodeCenter(int index, bool isLeft) {
      final x = horizontalPadding +
          (isLeft ? nodeRadius : pathWidth - nodeRadius);
      final y = _lessonTopOffset(index) + nodeRadius + 8;
      return Offset(x, y);
    }

    for (var i = 0; i < lessonItems.length - 1; i++) {
      final current = lessonItems[i];
      final next = lessonItems[i + 1];
      final start = nodeCenter(i, current.isLeft);
      final end = nodeCenter(i + 1, next.isLeft);
      final control = Offset(
        (start.dx + end.dx) / 2,
        (start.dy + end.dy) / 2,
      );

      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

      canvas.drawPath(path, paint);
    }
  }

  double _lessonTopOffset(int lessonIndex) {
    var offset = 0.0;

    for (final item in items) {
      if (item is _ChapterHeaderItem) {
        offset += 52;
        continue;
      }

      if (item is _LessonNodeItem) {
        if (lessonIndex == 0) {
          return offset;
        }
        lessonIndex--;
        offset += rowHeight;
      }
    }

    return offset;
  }

  @override
  bool shouldRepaint(covariant _RoadmapPathPainter oldDelegate) {
    return oldDelegate.items != items;
  }
}
