import 'package:fixnum/fixnum.dart';
import 'package:intl/intl.dart';

import '../../exceptions/domain_exception.dart';

class DateTimeHelper {
  static DateFormat fullTime = DateFormat('HH:mm:ss');
  static DateFormat minutesAndSecondsFormat = DateFormat('mm:ss');
  static DateFormat hoursOnly = DateFormat('HH');
  static DateFormat fullDateTime = DateFormat('dd.MM.yyyy HH:mm:ss');
  static DateFormat fullDateTileDMY = DateFormat('dd/MM/yyyy HH:mm:ss');
  static DateFormat fullDate = DateFormat('dd.MM.yyyy');
  static DateFormat yearToSsDate = DateFormat('yyyy-MM-dd-HH-mm-ss');
  static DateFormat yearToSSSDate = DateFormat('yyyy-MM-dd-HH-mm-ss-SSS');
  static DateFormat yearToDayDate = DateFormat('yyyy-MM-dd');

  static String calculateDurationAndFormat(
    int startTimestamp,
    int endTimestamp,
  ) {
    DateTime startTime = fromIntToDateTime(startTimestamp);
    DateTime endTime = fromIntToDateTime(endTimestamp);
    Duration duration = endTime.difference(startTime);
    String formattedDuration = formatDuration(duration);

    return formattedDuration;
  }

  static String formatDuration(Duration duration) {
    String formattedDuration =
        '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

    return formattedDuration;
  }

  static DateTime fromDynamic(data) {
    if (data is int) {
      return fromIntToDateTime(data);
    } else {
      return DateTime.parse(data);
    }
  }

  static DateTime fromInt64ToDateTime(Int64 timestamp) {
    final int dateTime = timestamp.toInt();
    return DateTime.fromMillisecondsSinceEpoch(dateTime);
  }

  static DateTime fromIntToDateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  static DateTime fromNumToDateTime(num timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());

  static String millisecondsToDateTime(
    int milliseconds, {
    String? divider,
  }) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    if (divider != null) {
      DateFormat newFormat =
          DateFormat('dd${divider}MM${divider}yyyy HH${divider}mm${divider}ss');

      return newFormat.format(dateTime);
    }

    return fullDateTime.format(dateTime);
  }

  static String millisecondsToTime(
    int milliseconds, {
    String? divider,
  }) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    if (divider != null) {
      DateFormat newFormat = DateFormat('HH${divider}mm${divider}ss');
      return newFormat.format(dateTime);
    }

    return fullTime.format(dateTime);
  }

  static String formatTime(
    DateTime dateTime, {
    String? divider,
  }) {
    if (divider != null) {
      DateFormat newFormat = DateFormat('HH${divider}mm${divider}ss');
      return newFormat.format(dateTime);
    }

    return fullTime.format(dateTime);
  }

  static String formatHours(
    DateTime dateTime, {
    String? divider,
  }) {
    if (divider != null) {
      DateFormat newFormat = DateFormat('HH');
      return newFormat.format(dateTime);
    }

    return hoursOnly.format(dateTime);
  }

  static String formatTimeWithoutHours(
    DateTime dateTime, {
    String? divider,
  }) {
    if (divider != null) {
      DateFormat newFormat = DateFormat('${divider}mm${divider}ss');
      return newFormat.format(dateTime);
    }

    return fullTime.format(dateTime);
  }

  static String formatDateFilter(
    DateTime dateTime,
  ) {
    DateFormat newFormat = DateFormat('dd.MM.yyyy HH:mm:ss');
    return newFormat.format(dateTime);
  }

  static String formatDateTime(
    DateTime dateTime, {
    String? divider,
  }) {
    if (divider != null) {
      DateFormat newFormat =
          DateFormat('dd${divider}MM${divider}yyyy HH${divider}mm${divider}ss');
      return newFormat.format(dateTime);
    }

    return fullDateTime.format(dateTime);
  }

  static String formatDate(
    DateTime dateTime, {
    String? divider,
  }) {
    if (divider != null) {
      DateFormat newFormat = DateFormat('MM${divider}dd${divider}yyyy');
      return newFormat.format(dateTime);
    }

    return fullDate.format(dateTime);
  }

  static String intToTime(int timestamp, {String? divider}) {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    return formatDate(dateTime, divider: divider);
  }

  static String int64ToTimeString(Int64 timestamp, {String? divider}) {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    return formatTime(dateTime, divider: divider);
  }

  static int convertDateTimeToMilliseconds(String inputText) {
    DateTime dateTime =
        DateFormat('dd.MM.yyyy HH:mm:ss').parseStrict(inputText);

    return dateTime.millisecondsSinceEpoch;
  }

  static DateTime parseDateTime(String dateString, {DateFormat? format}) {
    try {
      final DateFormat dateFormat = format ?? fullDateTime;
      final DateTime parsedDate = dateFormat.parse(dateString);

      return parsedDate;
    } catch (e) {
      UnknownException(message: e.toString());
    }
    return DateTime.now();
  }
}
