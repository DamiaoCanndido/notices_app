import 'package:intl/intl.dart';

class DateFormatter {
  static String format(String date) {
    DateTime nDate = DateTime.parse(date).toUtc();

    int timex = nDate.toUtc().millisecondsSinceEpoch;
    DateTime newDate = DateTime.fromMillisecondsSinceEpoch(timex);

    String cHour = DateFormat.jm('pt_BR').format(newDate);
    String cDate = DateFormat.yMd('pt_BR').format(newDate);

    return "$cDate $cHour";
  }

  static String timeLeft(String date) {
    DateTime nDate = DateTime.parse(date).toUtc();
    DateTime now = DateTime.now();

    int timeL = nDate.toUtc().millisecondsSinceEpoch;

    int nowN = now.toUtc().millisecondsSinceEpoch;

    int timeLeftOver = timeL - nowN;

    double timeX;

    if (timeLeftOver < 0) {
      if (timeLeftOver.abs() >= 2592000000) {
        timeX = timeLeftOver / 2592000000;

        return "Atraso de ${timeX.round().abs()} meses";
      }
      if (timeLeftOver.abs() >= 604800000) {
        timeX = timeLeftOver / 604800000;

        return "Atraso de ${timeX.round().abs()} semanas";
      }
      if (timeLeftOver.abs() >= 86400000) {
        timeX = timeLeftOver / 86400000;

        return "Atraso de ${timeX.round().abs()} dias";
      }
      if (timeLeftOver.abs() >= 3600000) {
        timeX = timeLeftOver / 3600000;

        return "Atraso de ${timeX.round().abs()} horas";
      }
      if (timeLeftOver.abs() >= 60000) {
        timeX = timeLeftOver / 60000;

        return "Atraso de ${timeX.round().abs()} minutos";
      } else {
        return "Acabou nesse instante";
      }
    }

    if (timeLeftOver > 0) {
      if (timeLeftOver >= 2592000000) {
        timeX = timeLeftOver / 2592000000;

        return "Faltam ${timeX.round()} meses";
      }
      if (timeLeftOver >= 604800000) {
        timeX = timeLeftOver / 604800000;

        return "Faltam ${timeX.round()} semanas";
      }
      if (timeLeftOver >= 86400000) {
        timeX = timeLeftOver / 86400000;

        return "Faltam ${timeX.round()} dias";
      }
      if (timeLeftOver >= 3600000) {
        timeX = timeLeftOver / 3600000;

        return "Faltam ${timeX.round()} horas";
      }
      if (timeLeftOver >= 60000) {
        timeX = timeLeftOver / 60000;

        return "Faltam ${timeX.round()} minutos";
      } else {
        return "Acaba a qualquer momento";
      }
    }
  }
}
