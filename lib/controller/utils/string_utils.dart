import 'package:intl/intl.dart';

class StringUtils {
  static bool isEmpty(String? s) => s == null || s.trim().isEmpty;

  static bool isNotEmpty(String? s) => !isEmpty(s);

  static String replaceSpacesWithHyphens(String inputString) {
    return inputString.replaceAll(' ', '-');
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd yyyy').format(dateTime);
  }
}
