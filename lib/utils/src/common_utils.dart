import 'dart:async';

import 'package:accumulation/components/i-toast/i_toast.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonUtils {
  const CommonUtils._();

  /// 注意，`返回值从0开始`
  

    /// 打电话啦 tel:
  static Future<void> makePhoneCall(String? number) async {
    try {
      final url = Uri.parse("tel:$number");
      if (!Utils.isPhone(number) || !(await launchUrl(url))) {
        throw "无效的电话号码";
      }
    } catch (e) {
      IToast.show(e.toString());
    }
  }
  
}
