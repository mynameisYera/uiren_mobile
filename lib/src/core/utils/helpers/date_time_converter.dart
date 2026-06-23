import 'package:intl/intl.dart';

class DateTimeConverter {
  /// Default format if none is specified.
  static const String defaultFormat = 'dd.MM.yyyy';

  /// Converts a DateTime object to a formatted string.
  /// [dateTime] is the DateTime object to be formatted.
  /// [format] is the desired output format (optional).
  /// If no format is provided, it uses the default format.
  static String convert(DateTime dateTime, {String? format}) {
    try {
      final dateFormat = DateFormat(format ?? defaultFormat);
      return dateFormat.format(dateTime);
    } catch (e) {
      throw FormatException('Invalid date format: $format');
    }
  }

  /// Converts a DateTime object to a formatted string in UTC.
  /// [dateTime] is the DateTime object to be formatted.
  /// [format] is the desired output format (optional).
  static String convertToUTC(DateTime dateTime, {String? format}) {
    return convert(dateTime.toUtc(), format: format);
  }

  String formatRussianDate(String isoString) {
    final date = DateTime.parse(isoString);
    final formatter = DateFormat("d MMMM y", "ru");
    return "${formatter.format(date)} г.";
  }
}
