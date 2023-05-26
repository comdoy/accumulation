import 'package:accumulation/components/components.dart';
import 'package:accumulation/model/common/src/weather.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/request/common/home_request.dart';
import 'package:accumulation/utils/event/avatar_event.dart';
import 'package:accumulation/utils/event/observe_bus.dart';
import 'package:accumulation/view_pages/home/home.dart';
import 'package:accumulation/router/router.dart';
import 'package:accumulation/utils/local_storage/user_storage.dart';
import 'package:accumulation/utils/src/img_asset.dart';
import 'package:flutter/material.dart';

class PersonBloc with WidgetsBindingObserver, BodyMixin<UserEntity?> {
  UpdateScope scope = UpdateScope();
  UserEntity? model;
  Weather? weather;
  ScrollController scrollController = ScrollController();

  Color textColor = Colors.transparent;

  void onWeather(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.weather,
      arguments: {"weather": weather},
    );
  }

  List<CardCell> item = [
    CardCell(path: Routes.resume, title: "简历", image: ImgAsset.avatar128),
    CardCell(path: Routes.login, title: "登录", image: ImgAsset.abc),
    CardCell(path: Routes.pressNew, title: "信息中心", image: ImgAsset.abc),
    CardCell(path: Routes.pressNew, title: "offer中心", image: ImgAsset.hint),
    CardCell(path: Routes.chesi, title: "发布中心", image: ImgAsset.avatar128),
  ];

  @override
  Future<UserEntity?> onInit() async {
    try {
      model = await UserUtil.userHome;
      weather = await HomeRequest.getWeather();
      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    publishEvent.addListener<AvatarEvent>(this, (event) {
      model?.images = event.file;
      controller.withData(UserEntity());
    });
  }
}
