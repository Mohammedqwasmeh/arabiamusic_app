import 'package:intl/intl.dart';

///Date Util
class DateUtil {
  /// Example: Oct 10, 1996
  static String formatDateToyMMMMd({required DateTime date}) =>
      DateFormat('dd MMMM yyyy').format(date);

  /// Example: 2023-07-12
  static String formatDateTimeToISODate({required DateTime dateTime}) =>
      DateFormat('yyyy-MM-dd').format(dateTime);

  /// Example: 08:18:41
  static String formatDateTimeToISOTime({required DateTime dateTime}) =>
      DateFormat('HH:mm:ss').format(dateTime);

  /// Example: 08:18:41 AM
  static String formatDateTimeToAMPMTime({required DateTime dateTime}) =>
      DateFormat('hh:mm a').format(dateTime);
}
