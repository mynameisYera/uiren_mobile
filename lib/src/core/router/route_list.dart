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
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MainShellPage(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RouteNames.home,
            path: RoutePaths.home,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RouteNames.repeat,
            path: RoutePaths.repeat,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RepeatPage(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RouteNames.rating,
            path: RoutePaths.rating,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RatingPage(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RouteNames.battle,
            path: RoutePaths.battle,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: BattlePage(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RouteNames.profile,
            path: RoutePaths.profile,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfilePage(),
            ),
          ),
        ],
      ),
    ],
  ),
];
