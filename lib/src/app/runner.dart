
import 'package:firebase_core/firebase_core.dart';
import 'package:uiren/src/core/service/injectable/injectable_service.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'package:uiren/src/core/utils/loggers/logger.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'application.dart';

class Runner {
  Future<void> initializeAndRun({
    required AppFlavor flavor,
    required List<String> args,
  }) async {
    FlutterError.onError = Log.logFlutterError;
    WidgetsFlutterBinding.ensureInitialized();
    if (Firebase.apps.isEmpty) {
      try {
        await Firebase.initializeApp();
      } catch (e, st) {
        Log.e('Firebase init skipped: $e', stackTrace: st);
      }
    }
    
    await StorageServiceImpl().init();
    await configureDependencies();

    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: SystemUiOverlay.values,
    // );

    MainApp(flavor: flavor).run();
  }
}
