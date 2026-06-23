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
import 'package:uiren/src/core/utils/loggers/logger.dart';
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
  final phoneOrEmailController = TextEditingController();
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
    final identifier = phoneOrEmailController.text.trim();
    final password = passwordController.text;

    setState(() {
      _identifierError =
          identifier.isEmpty ? 'Поле не может быть пустым' : '';
      _passwordError = password.isEmpty
          ? 'Поле не может быть пустым'
          : password.length < 8
              ? 'Пароль должен быть не менее 8 символов'
              : '';
    });

    return _identifierError.isEmpty && _passwordError.isEmpty;
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
      listener: (context, state) {
        state.maybeWhen(
          loaded: () {
            Log.i('LOGIN');
          },
          orElse: () {},
        );
      },
      builder: (context, state, bloc) {
        final locale = context.locale;

        return Scaffold(
          key: ValueKey(locale.languageCode),
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          body: state.maybeWhen(
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            orElse: () {
              return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(20),
                        LanguageChangerWidget(),
                        Gap(30),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20), 
                          child: Assets.images.group330.image(),
                        ),
                        const SizedBox(height: 100),
                        AppTextField(
                          labelText: context.tr(LocaleKeys.phone_label),
                          inputFormatters: [KazakhPhoneNumberFormatter()],
                          controller: phoneOrEmailController,
                          prefixIcon: Icons.phone_outlined,
                          errorText: _identifierError,
                          onChanged: (_) {
                            if (_identifierError.isNotEmpty) {
                              setState(() {
                                _identifierError = '';
                              });
                            }
                          },
                        ),
                        Gap(10),
                        AppTextField(
                          labelText: context.tr(LocaleKeys.password_label),
                          prefixIcon: Icons.lock_outline,
                          errorText: _passwordError,
                          obscureText: true,
                          controller: passwordController,
                          onChanged: (_) {
                            if (_passwordError.isNotEmpty) {
                              setState(() {
                                _passwordError = '';
                              });
                            }
                          },
                        ),
                        const Spacer(),
                        CustomButton(
                          color: AppColors.mainColor,
                          text: context.tr(LocaleKeys.log_in),
                          textColor: AppColors.white,
                          // onPressed: () {
                          //   if (_validateFields()) {
                          //     _authBloc.add(
                          //       AuthEvent.doLogin(
                          //         password: passwordController.text,
                          //         identifier: phoneOrEmailController.text,
                          //         onSuccess: () {
                          //           context.go(RoutePaths.home);
                          //         },
                          //       ),
                          //     );
                          //   }
                          // },
                          onPressed: (){
                            context.go(RoutePaths.home);
                          },
                        ),
                        const Gap(8),
                        TextButton(
                          onPressed: () => context.push(RoutePaths.register),
                          child: Text(
                            context.tr(LocaleKeys.no_account),
                            style: TextStyles.medium(AppColors.mainColor, fontSize: 14),
                          ),
                        ),
                        const Gap(10),
                        state.maybeWhen(
                          loadingFailure: () {
                            return Row(
                              children: [
                                Icon(Icons.error, color: AppColors.red),
                                Text(
                                  'Что то пошло не так',
                                  style: TextStyles.regular(AppColors.red),
                                ),
                              ],
                            );
                          },
                          orElse: () {
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
