import 'package:fluro/fluro.dart';

class RouteModel {
  RouteModel(
    this.path, {
    required this.handler,
    this.transitionType = TransitionType.cupertino,
  });

  /// 路由路径
  String path;

  Handler handler;

  /// 转场动画
  TransitionType transitionType;
}
