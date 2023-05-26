import 'package:flutter/material.dart';

class Globals {
  const Globals._();

  /// 1.0
  static const double pad1 = 1.0;

  /// 3.0
  static const double pad3 = 3.0;

  /// 4.0
  static const double pad4 = 4.0;

  /// 5.0
  static const double pad5 = 5.0;

  /// 6.0
  static const double pad6 = 6;

  /// 8.0
  static const double pad8 = 8;

  /// 10.0
  static const double pad10 = 10.0;

  /// 12.0
  static const double pad12 = 12;

  /// 14.0
  static const double pad14 = 14.0;

  /// 15.0
  static const double pad15 = 15.0;

  /// 16.0
  static const double pad16 = 16;

  /// 18.0
  static const double pad18 = 18;

  /// 24.0
  static const double pad24 = 24;

  static Color? a = const Color.fromARGB(255, 179, 242, 194);
  static Color? b = const Color.fromARGB(255, 1, 12, 45);
  static Color? c = const Color.fromARGB(255, 236, 80, 80);
 /// cyan:black*0.7
  static Color? hers =  Color.lerp(Color.fromARGB(255, 75, 167, 179), Colors.black, 0.5);
  /// cyan:black*0.7
  static Color? deepGreen = Color.lerp(Colors.cyan, Colors.black, 0.6);

  /// dart blue
  static Color? oceanBlue = Color.lerp(a, b, 0.4);

  ///常用间距

  ///按钮
  static const EdgeInsets symmetricBt =
      EdgeInsets.symmetric(horizontal: pad16, vertical: pad6);

  ///卡片之间
  static const EdgeInsets symmetric12 =
      EdgeInsets.symmetric(horizontal: pad12, vertical: pad6);

  ///卡片内
  static const EdgeInsets symmetric10 = EdgeInsets.all(pad10);

  /// 第一份色码表
  static List<Color> colors1 = const [
    Color(0xFFFF3333),
    Color(0xFFFF44AA),
    Color(0xFFFFAA33),
    Color(0xFFBBBB00),
    Color(0xFF33FFAA),
    Color(0xFFFFCC22),
    Color(0xFF55AA00),
    Color(0xFFB94FFF),
    Color(0xFF00DDAA),
    Color(0xFF99DD00),
    Color(0xFFC10066),
    Color(0xFF008800),
    Color(0xFF994400),
    Color(0xFF0088A8),
    Color(0xFF5500DD),
    Color(0xFF0066FF),
    Color(0xFFE63F00),
    Color(0xFF33FFFF),
    Color(0xFF5555FF),
  ];
}
