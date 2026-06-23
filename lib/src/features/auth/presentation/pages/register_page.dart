import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/utils/formatters/kazakh_phone_formatter.dart';
import 'package:uiren/src/core/widgets/custom_text_field.dart';
import 'package:uiren/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:uiren/src/features/auth/presentation/widgets/language_changer_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _phoneController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _otpSent = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return Scaffold(
      key: ValueKey(locale.languageCode),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: LanguageChangerWidget(),
              ),
              const Gap(16),
              Text(
                context.tr(LocaleKeys.register_title),
                style: TextStyles.bold(AppColors.secondaryColor, fontSize: 26),
              ),
              const Gap(8),
              Text(
                'OTP → ${context.tr(LocaleKeys.phone_label)}',
                style: TextStyles.regular(AppColors.grey, fontSize: 13),
              ),
              const Gap(24),
              AppTextField(
                controller: _phoneController,
                labelText: context.tr(LocaleKeys.phone_label),
                prefixIcon: Icons.phone_outlined,
                inputFormatters: [KazakhPhoneNumberFormatter()],
              ),
              const Gap(10),
              if (!_otpSent)
                CustomButton(
                  color: AppColors.secondaryColor,
                  text: context.tr(LocaleKeys.otp_send),
                  textColor: AppColors.white,
                  height: 52,
                  borderRadius: 16,
                  onPressed: () => setState(() => _otpSent = true),
                ),
              if (_otpSent) ...[
                AppTextField(
                  controller: _firstNameController,
                  labelText: context.tr(LocaleKeys.first_name),
                  prefixIcon: Icons.person_outline,
                ),
                const Gap(10),
                AppTextField(
                  controller: _lastNameController,
                  labelText: context.tr(LocaleKeys.last_name),
                  prefixIcon: Icons.badge_outlined,
                ),
                const Gap(10),
                AppTextField(
                  controller: _passwordController,
                  labelText: context.tr(LocaleKeys.password_label),
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                const Gap(20),
                CustomButton(
                  color: AppColors.mainColor,
                  text: context.tr(LocaleKeys.register_btn),
                  textColor: AppColors.white,
                  onPressed: () => context.go(RoutePaths.home),
                ),
              ],
              const Gap(16),
              TextButton(
                onPressed: () => context.go(RoutePaths.logIn),
                child: Text(
                  context.tr(LocaleKeys.have_account),
                  style: TextStyles.medium(AppColors.mainColor, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
