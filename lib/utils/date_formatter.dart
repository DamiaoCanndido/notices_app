import 'package:intl/intl.dart';

class DateFormatter {
  static String format(String date){
    DateTime nDate = DateTime.parse(date);
    int timex = nDate.toUtc().millisecondsSinceEpoch;
    DateTime newDate = DateTime.fromMillisecondsSinceEpoch(timex);

    return DateFormat.jm('pt_BR').format(newDate);
  }
}