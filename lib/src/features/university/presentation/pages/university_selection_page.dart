import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:uiren/src/features/university/data/models/university_models.dart';
import 'package:uiren/src/features/university/data/university_repository.dart';
import 'package:uiren/src/features/university/data/university_selection_storage.dart';
import 'package:uiren/src/features/university/presentation/widgets/subject_selector_section.dart';
import 'package:uiren/src/features/university/presentation/widgets/university_match_tile.dart';

class UniversitySelectionPage extends StatefulWidget {
  const UniversitySelectionPage({super.key});

  @override
  State<UniversitySelectionPage> createState() => _UniversitySelectionPageState();
}

class _UniversitySelectionPageState extends State<UniversitySelectionPage> {
  static const _maxUniversities = 3;

  final _repository = UniversityRepository.instance;
  final _storage = UniversitySelectionStorage.instance;

  List<String> _subjects = [];
  String? _subject1;
  String? _subject2;
  List<UniversityMatch> _matches = [];
  final Set<String> _selectedUniversityNames = {};
  bool _loadingSubjects = true;
  bool _loadingMatches = false;
  int _step = 0;

  @override
  void initState() {
    super.initState();
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    final subjects = await _repository.getAllProfileSubjects();
    _subject1 = _storage.subject1;
    _subject2 = _storage.subject2;
    _selectedUniversityNames.addAll(_storage.selectedUniversityNames);

    if (mounted) {
      setState(() {
        _subjects = subjects;
        _loadingSubjects = false;
      });
    }

    if (_subject1 != null && _subject2 != null) {
      await _searchUniversities(goToResults: false);
    }
  }

  Future<void> _searchUniversities({bool goToResults = true}) async {
    if (_subject1 == null || _subject2 == null) return;

    setState(() {
      _loadingMatches = true;
      if (goToResults) _step = 1;
    });

    final matches = await _repository.findMatches(
      subject1: _subject1!,
      subject2: _subject2!,
    );

    final uniqueByUniversity = <String, UniversityMatch>{};
    for (final match in matches) {
      uniqueByUniversity.putIfAbsent(match.university.name, () => match);
    }

    if (mounted) {
      setState(() {
        _matches = uniqueByUniversity.values.toList();
        _loadingMatches = false;
        _selectedUniversityNames.removeWhere(
          (name) => !_matches.any((m) => m.university.name == name),
        );
      });
    }
  }

  void _toggleUniversity(String name) {
    setState(() {
      if (_selectedUniversityNames.contains(name)) {
        _selectedUniversityNames.remove(name);
      } else if (_selectedUniversityNames.length < _maxUniversities) {
        _selectedUniversityNames.add(name);
      }
    });
  }

  Future<void> _save() async {
    if (_subject1 == null || _subject2 == null) return;

    await _storage.saveSubjects(
      subject1: _subject1!,
      subject2: _subject2!,
    );
    await _storage.saveSelectedUniversities(_selectedUniversityNames.toList());

    if (mounted) context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          color: AppColors.secondaryColor,
          onPressed: () => context.pop(),
        ),
        title: Text(
          context.tr(LocaleKeys.university_select_title),
          style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _StepIndicator(currentStep: _step),
          Expanded(
            child: _step == 0 ? _buildSubjectsStep() : _buildUniversitiesStep(),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectsStep() {
    if (_loadingSubjects) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SubjectStepHeader(),
        const SizedBox(height: 24),
        SubjectSelectorSection(
          title: context.tr(LocaleKeys.university_subject_1),
          subjects: _subjects,
          selected: _subject1,
          disabledSubject: _subject2,
          onSelected: (value) => setState(() => _subject1 = value),
        ),
        const SizedBox(height: 20),
        SubjectSelectorSection(
          title: context.tr(LocaleKeys.university_subject_2),
          subjects: _subjects,
          selected: _subject2,
          disabledSubject: _subject1,
          onSelected: (value) => setState(() => _subject2 = value),
        ),
        const SizedBox(height: 32),
        CustomButton(
          color: _subject1 != null &&
                  _subject2 != null &&
                  _subject1 != _subject2
              ? AppColors.mainColor
              : AppColors.grey,
          text: context.tr(LocaleKeys.university_find),
          textColor: AppColors.white,
          height: 54,
          borderRadius: 18,
          onPressed: () async {
            if (_subject1 == null ||
                _subject2 == null ||
                _subject1 == _subject2) {
              return;
            }
            await _storage.saveSubjects(
              subject1: _subject1!,
              subject2: _subject2!,
            );
            await _searchUniversities();
          },
        ),
      ],
    );
  }

  Widget _buildUniversitiesStep() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(LocaleKeys.university_step_results),
                style: TextStyles.bold(AppColors.secondaryColor, fontSize: 18),
              ),
              const SizedBox(height: 6),
              Text(
                '$_subject1 + $_subject2',
                style: TextStyles.medium(AppColors.mainColor, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                context.tr(
                  LocaleKeys.university_your_avg,
                  namedArgs: {'score': '${_storage.studentAvgScore}'},
                ),
                style: TextStyles.medium(AppColors.secondaryColor, fontSize: 13),
              ),
              const SizedBox(height: 4),
              Text(
                context.tr(
                  LocaleKeys.university_pick_hint,
                  namedArgs: {'count': '$_maxUniversities'},
                ),
                style: TextStyles.regular(AppColors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => setState(() => _step = 0),
          child: Text(
            context.tr(LocaleKeys.university_change_subjects),
            style: TextStyles.medium(AppColors.mainColor, fontSize: 13),
          ),
        ),
        Expanded(
          child: _loadingMatches
              ? const Center(child: CircularProgressIndicator())
              : _matches.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          context.tr(LocaleKeys.university_no_results),
                          textAlign: TextAlign.center,
                          style: TextStyles.regular(AppColors.grey, fontSize: 14),
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                      itemCount: _matches.length,
                      itemBuilder: (context, index) {
                        final match = _matches[index];
                        final name = match.university.name;
                        return UniversityMatchTile(
                          match: match,
                          studentAvgScore: _storage.studentAvgScore,
                          isSelected: _selectedUniversityNames.contains(name),
                          onToggle: () => _toggleUniversity(name),
                        );
                      },
                    ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomButton(
            color: AppColors.secondaryColor,
            text: context.tr(
              LocaleKeys.university_save,
              namedArgs: {'count': '${_selectedUniversityNames.length}'},
            ),
            textColor: AppColors.white,
            height: 54,
            borderRadius: 18,
            onPressed: _selectedUniversityNames.isNotEmpty ? _save : () {},
          ),
        ),
      ],
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: Row(
        children: [
          _StepDot(active: currentStep == 0, label: '1'),
          Expanded(
            child: Container(
              height: 2,
              color: currentStep >= 1
                  ? AppColors.mainColor
                  : AppColors.mainColor.withValues(alpha: 0.2),
            ),
          ),
          _StepDot(active: currentStep == 1, label: '2'),
        ],
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({required this.active, required this.label});

  final bool active;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? AppColors.mainColor : const Color(0xFFEAF5FF),
        border: Border.all(
          color: active ? AppColors.mainColor : AppColors.mainColor.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        label,
        style: TextStyles.semibold(
          active ? AppColors.white : AppColors.secondaryColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
