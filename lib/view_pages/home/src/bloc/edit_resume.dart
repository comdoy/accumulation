import 'package:accumulation/components/components.dart';
import 'package:flutter/material.dart';

import '../page/resume_page.dart';

class EditResumeBloc with BodyMixin {
  EditResumeBloc(Map<String, dynamic>? args) : _args = args ?? {};
  final Map<String, dynamic> _args;
  String? get title => _args["title"];
  String? get value => _args["value"];
  ResumeCellKeys get key => _args["key"];

  ///基本信息
  bool get basicInfo => key == ResumeCellKeys.basicInfo;

  ///优势
  bool get advantages => key == ResumeCellKeys.advantages;

  ///教育
  bool get education => key == ResumeCellKeys.education;

  List? get item {
    if (key == ResumeCellKeys.advantages) {}
    return [];
  }

  void onSubmit(Map<String, dynamic> params, BuildContext context) async {
    try {
      Navigator.pop(context);
    } catch (e) {
      UX.toast(e.toString());
      UX.hidden();
    }
  }
}
