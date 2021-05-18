import 'package:intl/intl.dart';

class GetTime {
  String time;
  DateTime now;
  String day;

  String getCurrentTime() {
    now = DateTime.now();
    time = DateFormat.jm().format(now).toString();
    day = DateFormat.yMMMMEEEEd().format(now).toString();
    return '$time-$day';
  }
}
