import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'package:uiren/src/features/auth/presentation/widgets/language_changer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Row(
                  children: [
                    const Spacer(),
                    const LanguageChangerWidget(),
                    IconButton(
                      onPressed: () async {
                        await StorageServiceImpl().deleteAccessToken();
                        await StorageServiceImpl().deleteRefreshToken();
                        if (context.mounted) {
                          context.go(RoutePaths.logIn);
                        }
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
