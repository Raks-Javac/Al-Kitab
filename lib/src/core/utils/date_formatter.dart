import 'package:hijri/hijri_calendar.dart';

class KDateFormatter {
  KDateFormatter._();
  static KDateFormatter instance = KDateFormatter._();
  var format = HijriCalendar.now();
  String returnIslamicCurrentDate() {
    return format.fullDate();
  }
}
