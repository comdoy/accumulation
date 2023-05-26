// Function
/// 公司：遵义极客信息科技有限责任公司
/// 作者：Biao~~
/// 时间：2019-09-09
///
import 'package:flutter/material.dart';

class Adapt {
  static late double _width;
  static late double _height;
  static late double _statusH;
  static late double _botbarH;
  static late double _pixelRatio;
  static dynamic _ratio;

  static init(BuildContext context, num number) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _width = mediaQuery.size.width;
    _height = mediaQuery.size.height;
    _statusH = mediaQuery.padding.top;
    _botbarH = mediaQuery.padding.bottom;
    _pixelRatio = mediaQuery.devicePixelRatio;
    int uiwidth = number is int ? number : 750;
    _ratio = _width / uiwidth;
  }

  static double px(number) {
    return _ratio * number;
  }

  static double onepx() {
    return 1 / _pixelRatio;
  }

  static double screenW() {
    return _width;
  }

  static double screenH() {
    return _height;
  }

  static double padTopH() {
    return _statusH;
  }

  static double padBotH() {
    return _botbarH;
  }

  static double get bodyHeight {
    return (screenH() - kToolbarHeight - padBotH() - padTopH());
  }
}
