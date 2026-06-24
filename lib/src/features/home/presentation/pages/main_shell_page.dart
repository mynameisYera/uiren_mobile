import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/assets.gen.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class MainShellPage extends StatelessWidget {
  const MainShellPage({
    super.key,
    required this.navigationShell,
  });

  static const int battleIndex = 3;

  final StatefulNavigationShell navigationShell;

  void _onTabSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      floatingActionButton: _BattleCenterButton(
        isSelected: navigationShell.currentIndex == battleIndex,
        onTap: () => _onTabSelected(battleIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _ShellBottomBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}

class _ShellBottomBar extends StatelessWidget {
  const _ShellBottomBar({
    required this.currentIndex,
    required this.onTap,
  });

  static const _inactiveColor = Color(0xFFB8C4CE);

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 12,
      shadowColor: AppColors.secondaryColor.withValues(alpha: 0.1),
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _ShellNavItem(
                index: 0,
                currentIndex: currentIndex,
                icon: _navSvg(Assets.icons.home, _inactiveColor),
                selectedIcon: _navSvg(Assets.icons.home, AppColors.mainColor),
                onTap: onTap,
              ),
              const SizedBox(width: 28),
              _ShellNavItem(
                index: 1,
                currentIndex: currentIndex,
                icon: _navSvg(Assets.icons.repeat, _inactiveColor),
                selectedIcon: _navSvg(Assets.icons.repeat, AppColors.mainColor),
                onTap: onTap,
              ),
            ],
          ),
          Row(
            children: [
              _ShellNavItem(
                index: 2,
                currentIndex: currentIndex,
                icon: _navIcon(Icons.emoji_events_outlined, _inactiveColor),
                selectedIcon: _navIcon(Icons.emoji_events_rounded, AppColors.mainColor),
                onTap: onTap,
              ),
              const SizedBox(width: 28),
              _ShellNavItem(
                index: 4,
                currentIndex: currentIndex,
                icon: _navSvg(Assets.icons.profile, _inactiveColor),
                selectedIcon: _navSvg(Assets.icons.profile, AppColors.mainColor),
                onTap: onTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _navSvg(SvgGenImage asset, Color color) {
    return asset.svg(
      width: 26,
      height: 26,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  static Widget _navIcon(IconData icon, Color color) {
    return Icon(icon, color: color, size: 26);
  }
}

class _ShellNavItem extends StatelessWidget {
  const _ShellNavItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
  });

  final int index;
  final int currentIndex;
  final Widget icon;
  final Widget selectedIcon;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap(index),
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: isSelected ? selectedIcon : icon,
        ),
      ),
    );
  }
}

class _BattleCenterButton extends StatelessWidget {
  const _BattleCenterButton({
    required this.isSelected,
    required this.onTap,
  });

  static const _selectedScale = 1.05;

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? _selectedScale : 1,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      child: SizedBox(
        width: 64,
        height: 64,
        child: Material(
          elevation: isSelected ? 12 : 4,
          shadowColor: AppColors.mainColor.withValues(alpha: 0.35),
          color: AppColors.mainColor,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 1.5),
              ),
              child: Assets.icons.battle.svg(
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 12, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyles.bold(
                        AppColors.secondaryColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  if (actions != null) ...actions!,
                ],
              ),
            ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
