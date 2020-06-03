import 'package:intl/intl.dart';

class DateFormatter {
  static String format(String date){
    DateTime nDate = DateTime.parse(date).toUtc();

    print(nDate);

    int timex = nDate.toUtc().millisecondsSinceEpoch;
    DateTime newDate = DateTime.fromMillisecondsSinceEpoch(timex);

    String cHour = DateFormat.jm('pt_BR').format(newDate);
    String cDate = DateFormat.yMd('pt_BR').format(newDate);

    return "$cDate $cHour";
  }
}