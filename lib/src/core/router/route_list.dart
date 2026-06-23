part of 'router.dart';

List<RouteBase> _routes() => <RouteBase>[
  GoRoute(
    name: RouteNames.logIn,
    path: RoutePaths.logIn,
    builder: (context, state) => const LogInPage(),
  ),
  GoRoute(
    name: RouteNames.register,
    path: RoutePaths.register,
    builder: (context, state) => const RegisterPage(),
  ),
  GoRoute(
    name: RouteNames.home,
    path: RoutePaths.home,
    builder: (context, state) => const HomePage(),
  ),
];
