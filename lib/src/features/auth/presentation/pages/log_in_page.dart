import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:uiren/gen/locale_keys.g.dart';
import 'package:uiren/gen/assets.gen.dart';
import 'package:uiren/src/core/router/router.dart';
import 'package:uiren/src/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:uiren/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:uiren/src/core/colors/colors.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/utils/firebase_utils.dart';
import 'package:uiren/src/core/utils/formatters/kazakh_phone_formatter.dart';
import 'package:uiren/src/core/utils/helpers/phone_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/src/core/widgets/custom_text_field.dart';
import 'package:uiren/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uiren/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:uiren/src/features/auth/presentation/widgets/language_changer_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  final phoneOrEmailController = TextEditingController(text: '+7 ');
  final passwordController = TextEditingController();
  late final AuthBloc _authBloc;
  String _identifierError = '';
  String _passwordError = '';

  @override
  void dispose() {
    phoneOrEmailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _initializeFirebase() async {
    await FirebaseUtil().initialize();
    if (!mounted) return;
    setState(() {});
  }

  bool _validateFields() {
    var isValid = true;

    if (!isPhoneComplete(phoneOrEmailController.text)) {
      _identifierError = context.tr(LocaleKeys.invalid_phone);
      isValid = false;
    } else {
      _identifierError = '';
    }

    if (passwordController.text.isEmpty) {
      _passwordError = context.tr(LocaleKeys.password_required);
      isValid = false;
    } else {
      _passwordError = '';
    }

    setState(() {});
    return isValid;
  }

  @override
  void initState() {
    _authBloc = getIt<AuthBloc>();
    _initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget<AuthBloc, AuthEvent, AuthState>(
      bloc: _authBloc,
      builder: (context, state, bloc) {
        final locale = context.locale;
        final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

        return Scaffold(
          key: ValueKey(locale.languageCode),
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(20),
                  const LanguageChangerWidget(),
                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Assets.images.group330.image(),
                  ),
                  const SizedBox(height: 100),
                  AppTextField(
                    labelText: context.tr(LocaleKeys.phone_label),
                    inputFormatters: [KazakhPhoneNumberFormatter()],
                    controller: phoneOrEmailController,
                    prefixIcon: Icons.phone_outlined,
                    errorText: _identifierError,
                    enabled: !isLoading,
                    onChanged: (_) {
                      if (_identifierError.isNotEmpty) {
                        setState(() => _identifierError = '');
                      }
                    },
                  ),
                  const Gap(10),
                  AppTextField(
                    labelText: context.tr(LocaleKeys.password_label),
                    prefixIcon: Icons.lock_outline,
                    errorText: _passwordError,
                    obscureText: true,
                    controller: passwordController,
                    enabled: !isLoading,
                    onChanged: (_) {
                      if (_passwordError.isNotEmpty) {
                        setState(() => _passwordError = '');
                      }
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    color: AppColors.mainColor,
                    text: context.tr(LocaleKeys.log_in),
                    textColor: AppColors.white,
                    isLoading: isLoading,
                    onPressed: () {
                            if (_validateFields()) {
                              _authBloc.add(
                                AuthEvent.doLogin(
                                  password: passwordController.text,
                                  identifier: formatPhoneForApi(
                                    phoneOrEmailController.text,
                                  ),
                                  onSuccess: () {
                                    context.go(RoutePaths.home);
                                  },
                                ),
                              );
                            }
                          },
                  ),
                  const Gap(8),
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => context.push(RoutePaths.register),
                    child: Text(
                      context.tr(LocaleKeys.no_account),
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
