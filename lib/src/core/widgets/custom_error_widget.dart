import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router_navigation.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.message,
    this.onDismiss,
  });

  final String message;
  final VoidCallback? onDismiss;

  static OverlayEntry? _entry;
  static Timer? _hideTimer;

  static void show({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    hide();

    void insert() {
      final overlay = rootNavigatorKey.currentState?.overlay;
      if (overlay == null) return;

      late OverlayEntry entry;
      entry = OverlayEntry(
        builder: (context) => _FlashMessageOverlay(
          message: message,
          onDismiss: hide,
        ),
      );

      _entry = entry;
      overlay.insert(entry);
      _hideTimer = Timer(duration, hide);
    }

    insert();

    if (_entry == null) {
      SchedulerBinding.instance.addPostFrameCallback((_) => insert());
    }
  }

  static void hide() {
    _hideTimer?.cancel();
    _hideTimer = null;
    _entry?.remove();
    _entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.red.withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.white, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyles.medium(AppColors.white, fontSize: 14),
              ),
            ),
            if (onDismiss != null) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onDismiss,
                child: const Icon(Icons.close, color: AppColors.white, size: 20),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _FlashMessageOverlay extends StatefulWidget {
  const _FlashMessageOverlay({
    required this.message,
    required this.onDismiss,
  });

  final String message;
  final VoidCallback onDismiss;

  @override
  State<_FlashMessageOverlay> createState() => _FlashMessageOverlayState();
}

class _FlashMessageOverlayState extends State<_FlashMessageOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: GestureDetector(
              onTap: _dismiss,
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity != null &&
                    details.primaryVelocity! < 0) {
                  _dismiss();
                }
              },
              child: CustomErrorWidget(
                message: widget.message,
                onDismiss: _dismiss,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
