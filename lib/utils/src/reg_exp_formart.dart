/// A regular expression formart

class RegExpFormart {
  static const String phone =
      '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$';
  // static const String email =
  //     '^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$';

  ///和后台一样的正则，但是还是有几种检查不出来
  ///341@163com
  /// 334@163.com.cn
  /// dhgjf@q.d.s.ccc
  /// 163@163com
  static const String email =
      r"^[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*\.[a-z]{2,}$";

  ///验证带有<>或者名字的邮箱
  static const String emailReg =
      r'("?.+"? <[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)*>$)|(^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)*$)';

  ///手机号和座机号
  static const String allPhone =
      '^1\\d{10}\$|^(0\\d{2,3}-?|\\(0\\d{2,3}\\))?[1-9]\\d{4,7}(-\\d{1,8})?\$';

  ///过滤中文
  static const String filterChinese = r'^[a-zA-Z0-9]+$';

  ///18位身份证正则
  static const String idCard18 =
      '^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9Xx])\$';

  ///15位身份证正则
  static const String idCard15 =
      '^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}\$';

  ///网址
  // static const String network = '[a-zA-Z]+://[^\\s]*';
  static const String url = '(^http|https)+://[^s]*';
}
