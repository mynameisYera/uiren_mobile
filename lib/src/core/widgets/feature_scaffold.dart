import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class FeatureScaffold extends StatelessWidget {
  const FeatureScaffold({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  final String title;
  final Widget body;
  final Widget? floatingActionButton;

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
          title,
          style: TextStyles.semibold(AppColors.secondaryColor, fontSize: 18),
        ),
        centerTitle: true,
      ),
      floatingActionButton: floatingActionButton,
      body: body,
    );
  }
}

class FeatureBackButton extends StatelessWidget {
  const FeatureBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => context.pop(),
      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
      label: Text(
        context.tr(LocaleKeys.back),
        style: TextStyles.medium(AppColors.mainColor, fontSize: 14),
      ),
    );
  }
}
