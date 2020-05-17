import 'package:dio/dio.dart';
import 'package:notices/consts/constrains.dart';
import 'package:notices/models/notice_model.dart';
import 'package:notices/utils/api_response.dart';

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

  static Future<ApiResponse<NoticeModel>> createNotice(String subjects) async {
    String url = "${Constrains.baseURL}/create";
    Dio dio = Dio();

    Map params = {
      "subjects": subjects
    };

    try {
      Response response = await dio.post(url, data: params);
      Map mapResponse = response.data;
      if(response.statusCode == 201){
        final notice = NoticeModel.fromJson(mapResponse);
        return ApiResponse.ok(notice);
      }
    } on DioError catch(e){
      if(e.response.statusCode == 400){
        return ApiResponse.error(e.response.data["error"]);
      }
    }
    return null;
  }

  static Future<ApiResponse<NoticeModel>> editNotice(NoticeModel notice, String subjects) async {
    String url = "${Constrains.baseURL}/update/${notice.id}";
    Dio dio = Dio();

    Map params = {
      "subjects": subjects
    };

    try {
      Response response = await dio.put(url, data: params);
      Map mapResponse = response.data;
      if(response.statusCode == 200){
        final notice = NoticeModel.fromJson(mapResponse);
        return ApiResponse.ok(notice);
      }
    } on DioError catch(e){
      if(e.response.statusCode == 400){
        return ApiResponse.error(e.response.data["error"]);
      }
    }
    return null;
  }

  static Future<ApiResponse<bool>> deleteNotice(NoticeModel notice) async {
    String url = "${Constrains.baseURL}/delete/${notice.id}";
    Dio dio = Dio();

    try {
      await dio.delete(url);
      return ApiResponse.ok(true);
    } on DioError catch(e){
      if(e.response.statusCode == 404){
        return e.response.data["error"];
      }
    }
    return ApiResponse.error("");
  }
}