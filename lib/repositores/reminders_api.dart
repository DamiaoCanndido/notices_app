import 'package:dio/dio.dart';
import 'package:notices/api/api_url.dart';
import 'package:notices/models/reminder_model.dart';
import 'package:notices/utils/api_response.dart';

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

  static Future<ApiResponse<ReminderModel>> doneReminder(ReminderModel reminderID) async {
    String url = "${ApiUrl.baseURL}/reminder/${reminderID.id}";
    Dio dio = Dio();

    try {
      Response response = await dio.patch(url);
      Map mapResponse = response.data;
      if(response.statusCode == 200){
        final reminder = ReminderModel.fromJson(mapResponse);
        return ApiResponse.ok(reminder);
      }
    } on DioError catch(e){
      if(e.response.statusCode == 400){
        return ApiResponse.error(e.response.data["error"]);
      }
    }
    return null;
  }
}