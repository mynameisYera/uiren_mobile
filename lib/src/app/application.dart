import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/utils/easy_localization_init.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../core/router/router.dart';
import '../core/theme/theme.dart';

part 'flavor_builds.dart';

class MainApp extends StatefulWidget {
  const MainApp({required this.flavor, super.key});
  final AppFlavor flavor;

  void run() => runApp(
        EasyLocalizationInit.wrap(
          DefaultAssetBundle(
            bundle: SentryAssetBundle(),
            child: this,
          ),
        ),
      );

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final GoRouter router;
  late final Talker talker;
  @override
  void initState() {
    super.initState();
    router = routerProvider();
    talker = TalkerFlutter.init();
    getIt.registerSingleton<Talker>(talker);

    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildApp(
      context: context,
      flavor: widget.flavor,
      router: router,
    );
  }
}
