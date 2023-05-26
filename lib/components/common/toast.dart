// Function
/// 公司：遵义极客信息科技有限责任公司
/// 作者：Biao~~
/// 时间：2019-09-09
///
import 'package:flutter/material.dart';
import 'dart:async';

/// 提示窗
///
/// 使用时一定要注意在使用界面的dispose()中退出
class Toast {
  /// 浮层对象
  OverlayEntry? _overlayEntry;

  _init(context, {String? text}) {
// 浮层实体
    _overlayEntry = OverlayEntry(builder: (ctx) {
      Size size = MediaQuery.of(context).size;

      return SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Opacity(
            opacity: 0.75,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 100),
                child: Text(
                  text ?? '未知提示',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  show(context, {String? text}) {
    // 在新的弹出之前，隐藏旧的
    dismiss();
    _init(context, text: text);
    if (_overlayEntry != null) {
      // 显示浮层
      Overlay.of(context).insert(_overlayEntry!);
      Future.delayed(const Duration(seconds: 2), () {
        dismiss();
      });
    }
  }

  dismiss() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
