import 'package:accumulation/request/config/request_config.dart';
import 'package:accumulation/utils/src/reg_exp_formart.dart';

class Utils {
  const Utils._();

  /// 判断字符串是否为手机号(包括座机)
  /// 这个规则范围广一些
  static bool isPhone(String? data) {
    if (data == null) return false;
    return RegExp(RegExpFormart.allPhone).hasMatch(data);
  }

  static String? imgUrl({String? image}) {
    if (image == null) return null;
    if (image.contains('.') != true) return null;
    return '${RequestConfig.url}/$image';
  }
}
