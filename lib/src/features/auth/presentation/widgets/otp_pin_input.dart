import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/theme/text_styles.dart';

class OtpPinInput extends StatefulWidget {
  const OtpPinInput({
    super.key,
    required this.controller,
    required this.focusNode,
    this.length = 4,
    this.enabled = true,
    this.onChanged,
    this.onCompleted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final int length;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  @override
  State<OtpPinInput> createState() => _OtpPinInputState();
}

class _OtpPinInputState extends State<OtpPinInput> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _onInput(String value) {
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');
    final trimmed = digits.length > widget.length
        ? digits.substring(0, widget.length)
        : digits;

    if (trimmed != widget.controller.text) {
      widget.controller.value = TextEditingValue(
        text: trimmed,
        selection: TextSelection.collapsed(offset: trimmed.length),
      );
    }

    widget.onChanged?.call(trimmed);

    if (trimmed.length == widget.length) {
      widget.onCompleted?.call(trimmed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final code = widget.controller.text;
    final focusedIndex = code.length.clamp(0, widget.length - 1);

    return GestureDetector(
      onTap: widget.enabled ? () => widget.focusNode.requestFocus() : null,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.length, (index) {
              final hasDigit = index < code.length;
              final isActive =
                  widget.enabled && widget.focusNode.hasFocus && index == focusedIndex;

              return Padding(
                padding: EdgeInsets.only(
                  right: index == widget.length - 1 ? 0 : 10,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: hasDigit
                        ? AppColors.mainColor.withValues(alpha: 0.08)
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isActive
                          ? AppColors.mainColor
                          : hasDigit
                              ? AppColors.mainColor.withValues(alpha: 0.45)
                              : AppColors.secondaryColor.withValues(alpha: 0.15),
                      width: isActive ? 2 : 1,
                    ),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: AppColors.mainColor.withValues(alpha: 0.12),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    hasDigit ? code[index] : '',
                    style: TextStyles.bold(
                      AppColors.secondaryColor,
                      fontSize: 22,
                    ),
                  ),
                ),
              );
            }),
          ),
          Opacity(
            opacity: 0,
            child: SizedBox(
              width: 1,
              height: 1,
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                enabled: widget.enabled,
                autofocus: true,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                maxLength: widget.length,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
                onChanged: _onInput,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
