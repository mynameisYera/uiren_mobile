import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'package:uiren/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:uiren/src/features/auth/presentation/widgets/language_changer_widget.dart';
import 'package:uiren/src/features/home/presentation/pages/main_shell_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTabScaffold(
      title: context.tr(LocaleKeys.nav_profile),
      actions: const [
        LanguageChangerWidget(),
      ],
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 44,
              backgroundColor: AppColors.mainColor.withValues(alpha: 0.12),
              child: const Icon(
                Icons.person_rounded,
                size: 44,
                color: AppColors.mainColor,
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              color: AppColors.red,
              text: context.tr(LocaleKeys.logout),
              textColor: AppColors.white,
              height: 52,
              borderRadius: 16,
              onPressed: () async {
                await StorageServiceImpl().deleteAccessToken();
                await StorageServiceImpl().deleteRefreshToken();
                if (context.mounted) {
                  context.go(RoutePaths.logIn);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
