import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'package:uiren/src/features/auth/presentation/widgets/language_changer_widget.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_battle_block.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_cta_button.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_greeting_header.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_achievement_block.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_quick_actions.dart';
import 'package:uiren/src/features/home/presentation/widgets/home_university_card.dart';

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
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const HomeGreetingHeader(
                    studentName: 'Айдар',
                    dailyDone: false,
                  ),
                  const SizedBox(height: 24),
                  const HomeCtaButton(),
                  const SizedBox(height: 20),
                  const HomeQuickActions(),
                  const SizedBox(height: 20),
                  const HomeBattleBlock(),
                  const SizedBox(height: 20),
                  const HomeAchievementBlock(),
                  const SizedBox(height: 20),
                  HomeUniversityCard(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
