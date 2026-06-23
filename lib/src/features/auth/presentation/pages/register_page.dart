import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:uiren/src/core/utils/formatters/kazakh_phone_formatter.dart';
import 'package:uiren/src/core/utils/helpers/phone_helper.dart';
import 'package:uiren/src/core/widgets/custom_error_widget.dart';
import 'package:uiren/src/core/widgets/custom_text_field.dart';
import 'package:uiren/src/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:uiren/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:uiren/src/features/auth/presentation/widgets/language_changer_widget.dart';
import 'package:uiren/src/features/auth/presentation/widgets/otp_pin_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _phoneController = TextEditingController(text: '+7 ');
  final _otpController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpFocusNode = FocusNode();
  late final RegisterBloc _registerBloc;
  Timer? _otpTimer;
  int _otpSecondsLeft = 0;

  @override
  void initState() {
    super.initState();
    _registerBloc = getIt<RegisterBloc>();
  }

  @override
  void dispose() {
    _otpTimer?.cancel();
    _phoneController.dispose();
    _otpController.dispose();
    _otpFocusNode.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _startOtpCountdown(int seconds) {
    _otpTimer?.cancel();
    setState(() => _otpSecondsLeft = seconds);
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_otpSecondsLeft <= 1) {
        timer.cancel();
        setState(() => _otpSecondsLeft = 0);
      } else {
        setState(() => _otpSecondsLeft--);
      }
    });
  }

  String _formatTimer(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  void _verifyOtp(RegisterBloc bloc) {
    if (_otpController.text.trim().length < 4) {
      CustomErrorWidget.show(
        message: context.tr(LocaleKeys.invalid_otp),
      );
      return;
    }
    bloc.add(
      RegisterEvent.verifyOtp(otp: _otpController.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget<RegisterBloc, RegisterEvent, RegisterState>(
      bloc: _registerBloc,
      listener: (context, state) {
        if (state.step == RegisterStep.otp && state.otpExpiresIn > 0) {
          _startOtpCountdown(state.otpExpiresIn);
        }
        if (state.step == RegisterStep.otp) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _otpFocusNode.requestFocus();
          });
        }
        if (state.step == RegisterStep.phone) {
          _otpController.clear();
          _otpFocusNode.unfocus();
        }
      },
      builder: (context, state, bloc) {
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
                  if (state.step != RegisterStep.otp)
                    Text(
                      context.tr(LocaleKeys.register_title),
                      style: TextStyles.bold(
                        AppColors.secondaryColor,
                        fontSize: 26,
                      ),
                    ),
                  if (state.step != RegisterStep.otp) const Gap(24),
                  if (state.step == RegisterStep.phone) ...[
                    AppTextField(
                      controller: _phoneController,
                      labelText: context.tr(LocaleKeys.phone_label),
                      prefixIcon: Icons.phone_outlined,
                      inputFormatters: [KazakhPhoneNumberFormatter()],
                      enabled: !state.isLoading,
                    ),
                    const Gap(10),
                    CustomButton(
                      color: AppColors.secondaryColor,
                      text: context.tr(LocaleKeys.otp_send),
                      textColor: AppColors.white,
                      height: 52,
                      borderRadius: 16,
                      isLoading: state.isLoading,
                      onPressed: () {
                        if (!isPhoneComplete(_phoneController.text)) {
                          CustomErrorWidget.show(
                            message: context.tr(LocaleKeys.invalid_phone),
                          );
                          return;
                        }
                        bloc.add(
                          RegisterEvent.requestOtp(phone: _phoneController.text),
                        );
                      },
                    ),
                  ],
                  if (state.step == RegisterStep.otp) ...[
                    Text(
                      context.tr(LocaleKeys.otp_label),
                      style: TextStyles.bold(
                        AppColors.secondaryColor,
                        fontSize: 20,
                      ),
                    ),
                    // const Gap(6),
                    // Text(
                    //   context.tr(
                    //     LocaleKeys.otp_sent_to,
                    //     namedArgs: {'phone': state.phone},
                    //   ),
                    //   style: TextStyles.regular(
                    //     AppColors.grey,
                    //     fontSize: 14,
                    //   ),
                    // ),
                    const Gap(50),
                    OtpPinInput(
                      controller: _otpController,
                      focusNode: _otpFocusNode,
                      enabled: !state.isLoading,
                      onCompleted: state.isLoading ? null : (_) => _verifyOtp(bloc),
                    ),
                    const Gap(12),
                    if (_otpSecondsLeft > 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 16,
                            color: AppColors.mainColor,
                          ),
                          const Gap(6),
                          Text(
                            context.tr(
                              LocaleKeys.otp_timer,
                              namedArgs: {
                                'time': _formatTimer(_otpSecondsLeft),
                              },
                            ),
                            style: TextStyles.regular(
                              AppColors.secondaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    const Gap(16),
                    CustomButton(
                      color: AppColors.secondaryColor,
                      text: context.tr(LocaleKeys.otp_verify),
                      textColor: AppColors.white,
                      height: 52,
                      borderRadius: 16,
                      isLoading: state.isLoading,
                      onPressed: () => _verifyOtp(bloc),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 44,
                            child: OutlinedButton.icon(
                              onPressed: state.isLoading || _otpSecondsLeft > 0
                                  ? null
                                  : () => bloc.add(const RegisterEvent.resendOtp()),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.mainColor,
                                disabledForegroundColor: AppColors.grey,
                                side: BorderSide(
                                  color: _otpSecondsLeft > 0 || state.isLoading
                                      ? AppColors.grey.withValues(alpha: 0.35)
                                      : AppColors.mainColor.withValues(alpha: 0.5),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              icon: const Icon(Icons.refresh_rounded, size: 18),
                              label: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  context.tr(LocaleKeys.otp_resend),
                                  style: TextStyles.medium(
                                    _otpSecondsLeft > 0 || state.isLoading
                                        ? AppColors.grey
                                        : AppColors.mainColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: SizedBox(
                            height: 44,
                            child: OutlinedButton.icon(
                              onPressed: state.isLoading
                                  ? null
                                  : () {
                                      _otpController.clear();
                                      bloc.add(const RegisterEvent.resetToPhoneStep());
                                    },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.secondaryColor,
                                disabledForegroundColor: AppColors.grey,
                                side: BorderSide(
                                  color: state.isLoading
                                      ? AppColors.grey.withValues(alpha: 0.35)
                                      : AppColors.secondaryColor.withValues(alpha: 0.35),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              icon: const Icon(Icons.edit_outlined, size: 17),
                              label: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  context.tr(LocaleKeys.change_phone),
                                  style: TextStyles.medium(
                                    state.isLoading
                                        ? AppColors.grey
                                        : AppColors.secondaryColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (state.step == RegisterStep.profile) ...[
                    AppTextField(
                      controller: _firstNameController,
                      labelText: context.tr(LocaleKeys.first_name),
                      prefixIcon: Icons.person_outline,
                      enabled: !state.isLoading,
                    ),
                    const Gap(10),
                    AppTextField(
                      controller: _lastNameController,
                      labelText: context.tr(LocaleKeys.last_name),
                      prefixIcon: Icons.badge_outlined,
                      enabled: !state.isLoading,
                    ),
                    const Gap(10),
                    AppTextField(
                      controller: _passwordController,
                      labelText: context.tr(LocaleKeys.password_label),
                      prefixIcon: Icons.lock_outline,
                      obscureText: true,
                      enabled: !state.isLoading,
                    ),
                    const Gap(20),
                    CustomButton(
                      color: AppColors.mainColor,
                      text: context.tr(LocaleKeys.register_btn),
                      textColor: AppColors.white,
                      isLoading: state.isLoading,
                      onPressed: () {
                        final firstName = _firstNameController.text.trim();
                        final lastName = _lastNameController.text.trim();
                        final password = _passwordController.text;

                        if (firstName.isEmpty || lastName.isEmpty) {
                          CustomErrorWidget.show(
                            message: context.tr(LocaleKeys.fill_all_fields),
                          );
                          return;
                        }
                        if (password.length < 8) {
                          CustomErrorWidget.show(
                            message: context.tr(LocaleKeys.password_min_length),
                          );
                          return;
                        }

                        bloc.add(
                          RegisterEvent.completeRegistration(
                            firstName: firstName,
                            lastName: lastName,
                            password: password,
                            onSuccess: () => context.go(RoutePaths.home),
                          ),
                        );
                      },
                    ),
                  ],
                  const Gap(16),
                  TextButton(
                    onPressed: state.isLoading
                        ? null
                        : () => context.go(RoutePaths.logIn),
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
      },
    );
  }
}
