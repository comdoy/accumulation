import 'package:accumulation/components/components.dart';
import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/request/common/home_request.dart';
import 'package:accumulation/router/router.dart';
import 'package:accumulation/utils/event/avatar_event.dart';
import 'package:accumulation/utils/event/observe_bus.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/material.dart';

class UserCenterBloc with BodyMixin<UserEntity?> {
  UserEntity? _model;
  @override
  Future<UserEntity?> onInit() async {
    _model = await UserUtil.userHome;
    return _model;
  }

  void onAvatar(BuildContext context) async {
    var file = await Navigator.pushNamed(
      context,
      Routes.image,
      arguments: {"image": _model?.images},
    );
    if (file is Map) {
      try {
        UX.show();
        await HomeRequest.putUser(images: file['images'], id: _model!.id);
        UX.hidden();
        _model!.images = file['images'];
        publishEvent.fire(AvatarEvent(file['images'].toString()));
        controller.withData(_model);
      } catch (e) {
        UX.hidden();
        UX.toast(e.toString());
      }
    }
  }

  Future<bool?> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("退出登录提示"),
          content: const Text("您确定要退出当前登录吗?"),
          actions: <Widget>[
            TextButton(
              child: const Text("确定"),
              onPressed: () async {
                var sp = await SpUtil.getInstance();
                sp?.remove(userInfo);
                // ... 执行删除操作
                if (context.mounted) {
                  return Application.router.navigateTo(
                    context,
                    Routes.login,
                    clearStack: true,
                  );
                }
                //关闭对话框
              },
            ),
            TextButton(
              child: const Text(
                "取消",
                style: TextStyle(color: Color.fromARGB(255, 255, 177, 177)),
              ),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
          ],
        );
      },
    );
  }
}
