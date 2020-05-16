import 'package:dio/dio.dart';
import 'package:notices/consts/constrains.dart';
import 'package:notices/models/notice_model.dart';

class NoticesApi {
  static Future<List<NoticeModel>> getNotices() async {
    String url = Constrains.baseURL;
    Dio dio = Dio();

    Response response = await dio.get(url);
    List noticesData = response.data;

    List<NoticeModel> notices = noticesData
      .map<NoticeModel>((e) => NoticeModel
      .fromJson(e)).toList();

    print(notices);
    return notices;
  }
}