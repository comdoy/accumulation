import 'package:accumulation/components/body/body_mixin.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/request/client/request.dart';
import 'package:accumulation/request/common/home_request.dart';
import 'package:accumulation/router/router.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/material.dart';

class LoginBloc with BodyMixin<dynamic> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController wordController = TextEditingController();
  final FocusNode namefocusNode = FocusNode();
  final FocusNode wordfocusNode = FocusNode();

  void login(BuildContext contexts) => request(() async {
        LoginParams params = LoginParams();
        params.username = '18311724370';
        params.password = '123456';
        await HomeRequest.postLogin(params: params);
        wordfocusNode.dispose;
        if (contexts.mounted) {
          pushNamedAndRemoveUntil(contexts, Routes.root, Routes.root);
        }
      });

  // request ()async {
  //   try {
  //     LoginParams params = LoginParams();
  //     params.username = '18311724370';
  //     params.password = '123456';
  //     IToast.success("请稍后...");
  //     await HomeRequest.postLogin(params: params);
  //     wordfocusNode.dispose;
  //     if (contexts.mounted) {
  //       pushNamedAndRemoveUntil(contexts, Routes.root, Routes.root);
  //     }
  //   } catch (e) {
  //     IToast.loading();
  //     print(e);
  //     handleException(e);
  //   }
  // }
}
