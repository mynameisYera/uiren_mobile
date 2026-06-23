part of 'application.dart';

Widget _buildApp({
  required BuildContext context,
  required AppFlavor flavor,
  required GoRouter router,
}) {
  switch (flavor) {
    case AppFlavor.development:
      return _devApp(context, router);
    case AppFlavor.production:
      return _prodApp(context, router);
  }
}

MaterialApp _devApp(BuildContext context, GoRouter router) =>
    _buildMaterialApp(
      context: context,
      router: router,
      title: AppFlavor.development.toString(),
    );

MaterialApp _prodApp(BuildContext context, GoRouter router) =>
    _buildMaterialApp(
      context: context,
      router: router,
      title: AppFlavor.production.toString(),
    );

MaterialApp _buildMaterialApp({
  required BuildContext context,
  required GoRouter router,
  required String title,
}) {
  return MaterialApp.router(
    key: ValueKey(context.locale.toString()),
    title: title,
    locale: context.locale,
    supportedLocales: context.supportedLocales,
    localizationsDelegates: context.localizationDelegates,
    routerDelegate: router.routerDelegate,
    routeInformationParser: router.routeInformationParser,
    routeInformationProvider: router.routeInformationProvider,
    theme: MaterialAppTheme.theme,
    darkTheme: MaterialAppTheme.dark,
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
  );
}

enum AppFlavor {
  development('development'),
  production('production');

  final String envPath;
  const AppFlavor(this.envPath);
}
