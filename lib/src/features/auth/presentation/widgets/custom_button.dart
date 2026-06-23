import 'package:flutter/material.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
// import 'package:wagtech/src/core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? borderColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Widget? icon;
  final double borderRadius;
  final bool? isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.borderColor,
    required this.textColor,
    required this.onPressed,
    this.width = 15000,
    this.height = 60,
    this.fontSize = 15,
    this.icon,
    this.isLoading = false,
    this.borderRadius = 15,
  });

  @override
  Widget build(BuildContext context) {
    final loading = isLoading ?? false;
    final child = loading
        ? CircularProgressIndicator.adaptive(backgroundColor: AppColors.white)
        : Text(
            text,
            style: TextStyles.semibold(textColor, fontSize: 18),
          );

      return SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: Ink(
                decoration: BoxDecoration(color: color, border: Border.all(color: borderColor ?? Colors.transparent)),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
      ),
    );
  }
}
