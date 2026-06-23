import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../loggers/logger.dart';

class FileHelper {
  static bool hasFileExists({required File file}) {
    return file.existsSync();
  }

  static Future<FileSystemEntity> removeFile({required File file}) {
    final bool exists = hasFileExists(file: file);
    if (!exists) {
      Log.e('The file no longer exists');
    }
    return file.delete();
  }

  Future<String> getDocumentsPath({String? filename}) async {
    Directory path = await getApplicationDocumentsDirectory();
    if (filename == null) {
      return path.path;
    }
    final String filePath = '${path.path}/$filename';
    return filePath;
  }
}
