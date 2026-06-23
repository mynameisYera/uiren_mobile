import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uiren/src/core/service/storage/storage_service_impl.dart';
import 'src/app/application.dart';
import 'src/app/runner.dart';
import 'src/core/utils/loggers/logger.dart';
import 'src/core/utils/easy_localization_init.dart';


Future<void> main(List<String> args) async {
  Log.runLogging(() { 
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        final storageService = StorageServiceImpl();
        await storageService.init();
        await EasyLocalizationInit.init();
        await Runner().initializeAndRun(
          flavor: AppFlavor.development,
          args: args,
        );
      },  
      Log.logZoneError,
    );
  });
}
