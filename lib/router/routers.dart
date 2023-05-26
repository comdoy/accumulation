import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';
import 'router_model.dart';

class Routes {
  //配置类

//  这边是配置路由
  static String root = '/'; //根目录

  static String login = "/login";

  static String pressNew = "/pressNew";

  static String userCenter = "/userCenter";

  static String resume = "/resume";
  static String image = "/image";
  static String resumePDF = "/resumePDF";
  static String weather = "/weather";

  static String chesi = "chesi";

  //静态方法
  static void configureRoutes(FluroRouter router) {
    //路由配置
    //找不到路由
    void defines(List<RouteModel> routes) {
      for (var routers in routes) {
        router.define(
          routers.path,
          handler: routers.handler,
          transitionType: routers.transitionType,
        );
      }
    }

    defines([
      RouteModel(root, handler: rootPageHanderl),
      RouteModel(login, handler: loginHanderl),
      RouteModel(pressNew, handler: pressNewHanderl),
      RouteModel(userCenter, handler: userCenterHanderl),
      RouteModel(resume, handler: resumeHanderl),
      RouteModel(image, handler: imageHanderl),
      RouteModel(resumePDF, handler: resumePDFHanderl),
      RouteModel(weather, handler: weatherHanderl),
      RouteModel(chesi, handler: chesiHanderl),
    ]);

    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      // ignore: avoid_print
      print('页面找不到报错了');
      return;
    });
    //整体配置--对应路由的页面  handler的值是跳转另一个页面后要处理的内容
  }
}
