class NumberTextFieldHelper {
  static String? onChangedInt(String text) {
    if (text == '0') {
      return text;
    }

    if (text.length <= 3) {
      if (text[0] == '0') {
        /// this is for "0X" case
        /// if we have "0X" we should remove "X" and leave "0"
        /// where X is any symbol - digit or minus
        final String subString = text.substring(1, text.length);
        return subString;
      }

      if (text[0] == '-') {
        /// this is for "-0X" case
        /// if we have "-0X" we should remove "X" and leave "-0"
        /// where X is any symbol - digit or minus
        if (text[1] == '0') {
          final String subString = text.substring(2, text.length);
          return '-$subString';
        }
      }
    }

    final int length = text.length;
    final String lastSymbol = text[length - 1];
    if (lastSymbol == '-') {
      /// this is for prevent input any symbol after digit
      if (length > 2) {
        final String subString = text.substring(0, length - 1);
        return subString;
      }

      /// this is for prevent input two minus symbols in a row
      final String firstSymbol = text[0];
      if (firstSymbol == '-') {
        return '-';
      }

      return null;
    }

    return null;
  }

  static String? onChangedDouble(String text) {
    if (text == '0') {
      return text;
    }

    if (text.length == 2 && text[0] == '0') {
      /// this is for "0." case
      if (text[1] == '.') {
        return null;
      }

      /// this is for "0X" case
      /// if we have "0X" we should remove "X" and leave "0"
      /// where X is any symbol - digit or minus
      final String subString = text.substring(1, text.length);

      return subString;
    }

    final int length = text.length;
    final String lastSymbol = text[length - 1];
    if (lastSymbol == '-') {
      /// this is for prevent input any symbol after digit
      if (length > 2) {
        final String subString = text.substring(0, length - 1);
        return subString;
      }

      /// this is for prevent input two minus symbols in a row
      final String firstSymbol = text[0];
      if (firstSymbol == '-') {
        return '-';
      }

      return null;
    }

    /// prevent duplicate dots
    /// if we have "0." and we input "." we should remove last dot
    if (lastSymbol == '.' && length > 2) {
      final bool isDotExist = text.substring(0, length - 1).contains('.');
      if (isDotExist) {
        final String subString = text.substring(0, length - 1);
        return subString;
      }
      return null;
    }

    return null;
  }
}
