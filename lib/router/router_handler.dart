import 'package:accumulation/view_pages/creation/bloc/creation.dart';
import 'package:accumulation/view_pages/creation/page/creation.dart';
import 'package:accumulation/view_pages/home/home.dart';
import 'package:accumulation/view_pages/home/src/bloc/resume_bloc.dart';
import 'package:accumulation/view_pages/home/src/page/resume_page.dart';
import 'package:accumulation/view_pages/home/src/page/resume_pdf.dart';
import 'package:accumulation/view_pages/home/src/page/weather_page.dart';
import 'package:accumulation/view_pages/image_selection/bloc/image_selection_bloc.dart';
import 'package:accumulation/view_pages/image_selection/page/image_selection.dart';
import 'package:accumulation/view_pages/logins/bloc/login_bloc.dart';
import 'package:accumulation/view_pages/logins/page/chesi.dart';
import 'package:accumulation/view_pages/logins/page/login_page.dart';
// import 'package:accumulation/view_pages/map/map.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var rootPageHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Provider<NavigationBloc>(
      create: (_) => NavigationBloc(),
      child: const NavigationPage(),
    );
  },
);
var loginHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Provider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: const LoginPage(),
    );
  },
);
var pressNewHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Provider<CreationBloc>(
      create: (_) => CreationBloc(),
      child: const CreationPage(),
    );
  },
);

var userCenterHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Provider<UserCenterBloc>(
      create: (_) => UserCenterBloc(),
      child: const UserCenterPage(),
    );
  },
);
var resumeHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Provider<ResumeBloc>(
      create: (_) => ResumeBloc(),
      child: const ResumePage(),
    );
  },
);

var imageHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    var args = ModalRoute.of(context!)?.settings.arguments;
    return Provider<ImageSelectionBloc>(
      create: (_) => ImageSelectionBloc(args as Map<String, dynamic>?),
      child: const ImageSelectionPage(),
    );
  },
);

var resumePDFHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    var args = ModalRoute.of(context!)?.settings.arguments;
    return PdfPreviewPage(args as Map<String, dynamic>?);
    
  },
);

var weatherHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    var args = ModalRoute.of(context!)?.settings.arguments;
    return  WeatherPage(args as Map<String, dynamic>?);
    
  },
);
var chesiHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const Chesis();
    
  },
);



var demoFunctionHandler = Handler(
    type: HandlerType.function,
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String? message = params["message"]?.first;
      showDialog(
        context: context!,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Hey Hey!",
              style: TextStyle(
                color: Color(0xFF00D6F7),
                fontFamily: "Lazer84",
                fontSize: 22.0,
              ),
            ),
            content: Text("$message"),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("OK"),
                ),
              ),
            ],
          );
        },
      );
      return;
    });
