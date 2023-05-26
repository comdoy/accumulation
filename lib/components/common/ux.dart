// Function
/// 公司：遵义极客信息科技有限责任公司
/// 作者：Biao~~
/// 时间：2019-09-09
///
import 'package:flutter/widgets.dart';
import 'toast.dart';
import 'progress_hud.dart';

class UX {
  final List<ProgressHUDController> huds = [];

  final List<BuildContext> contexts = [];

  static final Toast _toast = Toast();

  static BuildContext get context {
    return share().contexts.last;
  }

  static void toast(String? message) {
    if (message?.isNotEmpty != true) return;
    UX ux = UX.share();
    assert(ux.contexts.isNotEmpty == true);
    _toast.show(ux.contexts.last, text: message!);
  }

  static void error([String? text]) {
    UX ux = UX.share();
    ux.huds.last.error(text);
  }

  static void success([String? text]) {
    UX ux = UX.share();
    ux.huds.last.success(text);
  }

  static removeToast() {
    _toast.dismiss();
  }

  static void show([String? text]) {
    UX ux = UX.share();
    ux.huds.last.loading(text);
  }

  static void hidden() {
    UX ux = UX.share();
    ux.huds.last.hidden();
  }

  factory UX() => share();
  UX._();
  static UX? _instance;
  static UX share() {
    _instance ??= UX._();
    return _instance!;
  }
}
