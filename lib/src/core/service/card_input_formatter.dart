import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CardFormatter extends TextInputFormatter {

  CardFormatter({
    required this.sample,
    required this.separator,
  });
  final String sample;
  final String separator;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) {
          return oldValue;
        }
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

class DateToSimpleFormatter {
  static String format(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }
}

class DateFormatter extends TextInputFormatter {
  final String sample;
  DateFormatter({required this.sample});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) {
          return oldValue;
        }
      }
    }
    return newValue;
  }
}

String formatForServer(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
