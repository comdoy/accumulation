import 'dart:io';

import 'package:accumulation/components/i-toast/src/toast.dart';
import 'package:accumulation/consts/consts.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'router/router.dart';
import 'utils/src/adapt.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
  if (Platform.isAndroid) {
    // 这一步设置状态栏颜色为透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }     
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cupertinoOverrideTheme = CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        tabLabelTextStyle: TextStyle(
          fontSize: 11.55,
          color: Globals.oceanBlue,
        ),
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Theme.of(context).scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: Globals.oceanBlue,
          centerTitle: false,
          foregroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
          actionsIconTheme: const IconThemeData(color: Colors.white),
        ),
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
        cupertinoOverrideTheme: cupertinoOverrideTheme.copyWith(
          primaryColor: Globals.oceanBlue,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white70,
          backgroundColor: Colors.black54,
        ),
        primaryColor: Globals.oceanBlue,
        primaryColorLight: Globals.oceanBlue,
        platform: TargetPlatform.iOS,
        cardColor: Colors.white,
        secondaryHeaderColor: const Color.fromRGBO(230, 230, 230, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cupertinoOverrideTheme: cupertinoOverrideTheme.copyWith(
          primaryColor: Colors.teal,
        ),
        primaryColorLight: Colors.tealAccent[200],
        scaffoldBackgroundColor: const Color(0xFF303030),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          backgroundColor: Color(0xFF303030),
        ),
      ),
      onGenerateRoute: Application.router.generator,
      onGenerateTitle: (context) {
        Adapt.init(context, 750);
        return '你知道';
      },
      builder: IToast.init(),
    );
  }
}
