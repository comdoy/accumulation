import 'dart:convert';

import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/request/client/request_client.dart';
import 'package:accumulation/request/config.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:dio/dio.dart';

class HomeRequest {
  static Future<List<PressModel>?> getPress({
    int page = 1,
    int pageSize = 20,
    String? search,
  }) async {
    try {
      var params = {
        "pageNum": page,
        "pageSize": pageSize,
      };
      var json = await requestClient.get(APIS.press, queryParameters: params);
      var pageData = PageData.fromJson(json);
      return pageData.records?.map((e) => PressModel.fromJson(e)).toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  static Future<Advantages?> postAdvantages({
    int id = 1,
  }) async {
    try {
      var params = {
        "user_id": id,
      };
      var json = await requestClient.post<Advantages>(
        APIS.advantage,
        data: params,
      );
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<EducationExperience?> postEducation({
    int id = 1,
  }) async {
    try {
      var params = {
        "user_id": id,
      };
      var json = await requestClient.post<EducationExperience>(
        APIS.education,
        data: params,
      );
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserEntity?> postUser({
    int? id,
  }) async {
    try {
      var params = {"id": id};
      params.removeWhere((key, value) => value == null);
      var json = await requestClient.post<UserEntity>(
        APIS.user,
        data: params,
      );
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postLogin({
    LoginParams? params,
  }) async {
    try {
      var json = await requestClient.post(
        APIS.login,
        data: params,
      );
      var sp = await SpUtil.getInstance();
      await sp?.putString(userInfo, jsonEncode(json));
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> putUser({String? images, int? id}) async {
    try {
      var params = {"images": images, "id": id};
      var json = await requestClient.put(
        APIS.user,
        data: params,
      );
      var sp = await SpUtil.getInstance();
      await sp?.putString(userInfo, jsonEncode(json));
      return json;
    } catch (e) {
      rethrow;
    }
  }

  ///上传图片
  static Future<dynamic> postImages({
    required FormData formData,
  }) async {
    try {
      var url = await Dio().post('${RequestConfig.url}/images', data: formData);

      return url.toString();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Recruitment>?> getRecruitment({
    int page = 1,
    int pageSize = 20,
    String? search,
  }) async {
    try {
      var params = {
        "pageNum": page,
        "pageSize": pageSize,
      };
      var json =
          await requestClient.get(APIS.recruitment, queryParameters: params);
      var pageData = PageData.fromJson(json);
      return pageData.records?.map((e) => Recruitment.fromJson(e)).toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  static Future<Weather?> getWeather() async {
    try {
      var url =
          "https://v0.yiketianqi.com/api?unescape=1&version=v62&appid=29647933&appsecret=E5skiMh5";
      var response = await Dio().get(url);
      var jsonData = Weather.fromJson(response.data);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}
