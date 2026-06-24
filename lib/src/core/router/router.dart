
import 'package:flutter/material.dart';
import 'package:uiren/src/core/router/router_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'package:uiren/src/core/utils/loggers/logger.dart';
import 'package:uiren/src/features/auth/presentation/pages/log_in_page.dart';
import 'package:uiren/src/features/auth/presentation/pages/register_page.dart';
import 'package:uiren/src/features/home/presentation/pages/battle_page.dart';
import 'package:uiren/src/features/home/presentation/pages/home_page.dart';
import 'package:uiren/src/features/home/presentation/pages/main_shell_page.dart';
import 'package:uiren/src/features/home/presentation/pages/profile_page.dart';
import 'package:uiren/src/features/home/presentation/pages/rating_page.dart';
import 'package:uiren/src/features/home/presentation/pages/repeat_page.dart';
part 'route_list.dart';
part 'route_transitions.dart';
part 'router_names.dart';
part 'router_paths.dart';


GoRouter routerProvider() {
  final storageService = StorageServiceImpl();
  final accessToken = storageService.getAccessToken();
  Log.i('accessToken: $accessToken');

  final initialLocation = accessToken != null && accessToken.isNotEmpty 
    ? RoutePaths.home 
    : RoutePaths.logIn;
    
  final goRouter = GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: _routes(),
  );
  return goRouter;
}
