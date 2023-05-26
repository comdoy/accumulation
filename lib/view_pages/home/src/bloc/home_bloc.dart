import 'package:accumulation/components/components.dart';
import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/request/config.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/material.dart';

import '../page/homes_page.dart';

class HomesBloc with BodyMixin<List<Recruitment>?> {
  UpdateScope scope = UpdateScope();
  UserEntity? model;
  late int pageIndex;
  List<Recruitment>? view;

  List<Tab> get list {
    return [
      tab(
        Icons.directions_car,
        "招聘信息",
      ),
      tab(
        Icons.directions_transit,
        "经验分享",
      ),
      tab(
        Icons.directions_bike,
        "行业动态",
      ),
    ];
  }

  @override
  Future<List<Recruitment>?> onInit() async {
    pageIndex = 0;
    view = [];
    await onLoading();
    return view;
  }

  @override
  Future<List<Recruitment>?> onLoading() async {
    try {
      var res = await HomeRequest.getRecruitment(page: pageIndex, pageSize: 20);
      view?.addAll(res!);
      ++pageIndex;
      controller.withData(res);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  void onLogin(BuildContext context) async {
    var sp = await SpUtil.getInstance();
    sp?.remove(userInfo);
    // if (context.mounted) return pushNamed(context, Routes.login);
  }
}
