import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/widgets/app_surface_card.dart';
import 'package:uiren/src/features/university/data/university_repository.dart';
import 'package:uiren/src/features/university/data/university_selection_storage.dart';
import 'package:uiren/src/features/university/domain/admission_chance.dart';
import 'package:uiren/src/features/university/presentation/widgets/admission_chance_banner.dart';

class HomeUniversityCard extends StatefulWidget {
  const HomeUniversityCard({super.key});

  @override
  State<HomeUniversityCard> createState() => _HomeUniversityCardState();
}

class _HomeUniversityCardState extends State<HomeUniversityCard> {
  final _storage = UniversitySelectionStorage.instance;
  final _repository = UniversityRepository.instance;

  List<String> _shortNames = [];
  String? _subject1;
  String? _subject2;
  String _closestName = '';
  AdmissionChance? _primaryChance;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _subject1 = _storage.subject1;
    _subject2 = _storage.subject2;
    final selected = _storage.selectedUniversityNames;

    if (selected.isNotEmpty) {
      final universities = await _repository.loadUniversities();
      _shortNames = selected.map((fullName) {
        final uni = universities.where((u) => u.name == fullName).firstOrNull;
        return uni?.shortName ?? fullName;
      }).toList();
      _closestName = _shortNames.first;

      final primary = universities
          .where((u) => u.name == selected.first)
          .firstOrNull;
      if (primary != null) {
        _primaryChance = AdmissionChance.evaluate(
          studentAvg: _storage.studentAvgScore,
          threshold: primary.thresholdScore,
        );
      }
    } else {
      _primaryChance = null;
    }

    if (mounted) setState(() {});
  }

  Future<void> _openSelection() async {
    final saved = await context.push<bool>(RoutePaths.universitySelect);
    if (saved == true) await _load();
  }

  @override
  Widget build(BuildContext context) {
    final hasSelection = _shortNames.isNotEmpty;

    return AppSurfaceCard(
      onTap: _openSelection,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🎓', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.tr(LocaleKeys.universities_title),
                  style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 15),
                ),
              ),
              Icon(
                Icons.edit_outlined,
                size: 18,
                color: AppColors.mainColor,
              ),
            ],
          ),
          if (_subject1 != null && _subject2 != null) ...[
            const SizedBox(height: 8),
            Text(
              context.tr(
                LocaleKeys.university_subjects_label,
                namedArgs: {'subjects': '$_subject1 + $_subject2'},
              ),
              style: TextStyles.regular(AppColors.grey, fontSize: 12),
            ),
          ],
          const SizedBox(height: 12),
          if (hasSelection)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _shortNames
                  .map(
                    (name) => Chip(
                      label: Text(
                        name,
                        style: TextStyles.medium(AppColors.secondaryColor, fontSize: 12),
                      ),
                      backgroundColor: const Color(0xFFEAF5FF),
                      side: BorderSide(
                        color: AppColors.mainColor.withValues(alpha: 0.3),
                      ),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  )
                  .toList(),
            )
          else
            Text(
              context.tr(LocaleKeys.university_empty_hint),
              style: TextStyles.regular(AppColors.grey, fontSize: 13),
            ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _openSelection,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.mainColor,
                side: BorderSide(color: AppColors.mainColor.withValues(alpha: 0.4)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                hasSelection
                    ? context.tr(LocaleKeys.university_select)
                    : context.tr(LocaleKeys.university_select_title),
                style: TextStyles.semibold(AppColors.mainColor, fontSize: 14),
              ),
            ),
          ),
          if (hasSelection && _primaryChance != null) ...[
            const SizedBox(height: 12),
            AdmissionChanceBanner(chance: _primaryChance!),
          ],
        ],
      ),
    );
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    return iterator.current;
  }
}
