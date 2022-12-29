import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class KDateFormatter {
  KDateFormatter._();
  static KDateFormatter instance = KDateFormatter._();
  var format = HijriCalendar.now();
  String returnIslamicCurrentDate() {
    return format.fullDate();
  }

  static String returnEnglishDateTimeNowOndashBoard() {
    return DateFormat.yMMMMEEEEd().format(DateTime.now());
  }
}
