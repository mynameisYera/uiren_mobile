import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class EasyLocalizationInit {
  static const String translationsPath = 'assets/translations';

  static const List<Locale> supportedLocales = [
    Locale('kk'),
    Locale('ru'),
  ];

  static const Locale fallbackLocale = Locale('kk');

  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
  }

  static Widget wrap(Widget child) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: translationsPath,
      fallbackLocale: fallbackLocale,
      startLocale: fallbackLocale,
      useOnlyLangCode: true,
      child: child,
    );
  }

  static Future<void> setLocale(BuildContext context, Locale locale) {
    return context.setLocale(locale);
  }
}
