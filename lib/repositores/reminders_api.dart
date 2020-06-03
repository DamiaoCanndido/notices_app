import 'package:dio/dio.dart';
import 'package:notices/api/api_url.dart';
import 'package:notices/models/reminder_model.dart';

class RemindersApi {
  static Future<List<ReminderModel>> getReminders() async {
    String url = "${ApiUrl.baseURL}/reminder";
    Dio dio = Dio();

    Response response = await dio.get(url);
    List reminderData = response.data;

    List<ReminderModel> reminders = reminderData
      .map<ReminderModel>((e) => ReminderModel
      .fromJson(e)).toList();

    return reminders;
  }
}