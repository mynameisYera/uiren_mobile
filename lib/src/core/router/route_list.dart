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
  GoRoute(
    name: RouteNames.battle,
    path: RoutePaths.battle,
    builder: (context, state) => const BattlePage(),
  ),
  GoRoute(
    name: RouteNames.progress,
    path: RoutePaths.progress,
    builder: (context, state) => const ProgressPage(),
  ),
  GoRoute(
    name: RouteNames.repeatTest,
    path: RoutePaths.repeatTest,
    builder: (context, state) => const RepeatTestPage(),
  ),
  GoRoute(
    name: RouteNames.testStart,
    path: RoutePaths.testStart,
    builder: (context, state) => const TestStartPage(),
  ),
  GoRoute(
    name: RouteNames.universitySelect,
    path: RoutePaths.universitySelect,
    builder: (context, state) => const UniversitySelectionPage(),
  ),
];
