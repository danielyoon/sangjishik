import 'package:intl/intl.dart';

class StringUtils {
  static bool isEmpty(String? s) => s == null || s.trim().isEmpty;

  static bool isNotEmpty(String? s) => !isEmpty(s);

  static String replaceSpacesWithHyphens(String inputString) {
    return inputString.replaceAll(' ', '-');
  }

  static String replaceHyphensWithSpaces(String inputString) {
    return inputString.replaceAll('-', ' ');
  }

  static String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    DateFormat outputFormat = DateFormat('MMM dd, yyyy');
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }

  static List<String> formatTags(String tags) {
    String trim = tags.trim();

    if (trim.endsWith(',')) {
      trim = trim.substring(0, trim.length - 1);
    }

    List<String> newTags = trim.split(', ');
    return newTags;
  }
}
