// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:uuid/uuid.dart';

class UuidHelper {
  /// 16 byte uuid
  static const int uuidLength = 16;
  static (int p1, int p2) convertToBytes({String? uuid}) {
    final String uuidString = uuid ?? const Uuid().v4();
    final List<int> uuidBytes = <int>[...uuidString.codeUnits];
    if (uuidBytes.length < uuidLength) {
      /// Fill with zeros
      uuidBytes.addAll(List.filled(uuidLength - uuidBytes.length, 0));
    }
    final Int16List int16List = Int16List.fromList(uuidBytes);

    final int p1 = int16List.sublist(0, 8).buffer.asByteData().getInt64(0);
    final int p2 =
        int16List.sublist(8, uuidLength).buffer.asByteData().getInt64(0);
    return (p1, p2);
  }

  static int get getIntUuid {
    final String uuidString = const Uuid().v4();

    final List<int> uuidBytes = <int>[...uuidString.codeUnits];
    final Int16List int16List = Int16List.fromList(uuidBytes);
    final int uuidInt =
        int16List.sublist(8, uuidLength).buffer.asByteData().getInt64(0);

    if (uuidInt < 0) {
      return uuidInt * -1;
    }
    return uuidInt;
  }
}
