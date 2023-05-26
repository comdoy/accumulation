import 'package:accumulation/view_pages/logins/bloc/login_bloc.dart';
import 'package:accumulation/view_pages/logins/page/login_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var loginHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Provider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: const LoginPage(),
    );
  },
);