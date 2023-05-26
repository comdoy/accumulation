import 'dart:convert';

import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/utils/utils_paths.dart';

class UserUtil {
  const UserUtil._();

  static Future<UserEntity?> get userHome async {
    try {
      var sp = await SpUtil.getInstance();
      String? jsonData = sp?.getString(userInfo);
      if (jsonData?.isNotEmpty == true) {
        var json = jsonDecode(jsonData!);
        return  UserEntity.fromJson(json);
      }
    } catch (e) {
      xprint(e);
    }
    return null;
  }
}
