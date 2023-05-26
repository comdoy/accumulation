import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'indicator.dart';
import 'i_overlay_entry.dart';
import 'i_overlay.dart';
import 'i_toast_widget.dart';

///
/// @author xbwca
/// @description: 各种弹框(loading,消息,成功,失败)
/// @date :2022/3/2 15:31
///
enum IToastPosition {
  top,
  center,
  bottom,
}

class IToast {
  /// 默认蒙层颜色
  late Color _defaultMaskColor;

  /// 默认展示时长
  late Duration _displayDuration;

  IOverlayEntry? overlayEntry;

  GlobalKey<IToastWidgetState>? _key;

  Timer? _timer;

  Widget? _w;

  bool _isLoading = false;

  Widget? get w => _w;

  GlobalKey<IToastWidgetState>? get key => _key;

  static bool get isLoading => _instance._isLoading;

  static IToast get instance => _instance;

  factory IToast() => _instance;

  static final IToast _instance = IToast._internal();

  IToast._internal() {
    _defaultMaskColor = Colors.black.withOpacity(0.2);
    _displayDuration = const Duration(milliseconds: 1200);
  }

  /// init
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, IOverlay(child: child));
      } else {
        return IOverlay(child: child);
      }
    };
  }

  /// 文本
  /// [position]弹窗位置
  /// [maskColor]蒙层颜色,默认透明
  /// [displayDuration] 展示时长,默认1200(milliseconds)
  /// [indicator]自定义框框,传递则[message]无效~
  static Future<void> show(
    String message, {
    IToastPosition position = IToastPosition.bottom,
    Color maskColor = Colors.transparent,
    Duration? displayDuration,
    Widget? indicator,
  }) async {
    return await _instance._show(
      indicator: indicator ?? TextIndicator(message),
      position: position,
      maskColor: maskColor,
      displayDuration: displayDuration ?? _instance._displayDuration,
    );
  }

  /// loading
  /// [message]文本提示
  /// [maskColor]蒙层颜色
  static Future<void> loading({
    String message = "请稍后...",
    Color? maskColor,

  }) async {
    _instance._isLoading = true;
    _instance._show(
      indicator: LoadingIndicator(message),
      maskColor: maskColor ?? _instance._defaultMaskColor,
      ignorePointer: false,
    );
  }

  /// 突发奇想: 请求很快得到响应的时候,loading框刚被打开就得关闭,页面会闪一下,很丑~
  /// 但是又不能不显示loading框,万一请求要很久呢?
  static Future<T> waitLoading<T>(Future<T> Function() asyncFunction,{
    String message = "请稍后...",
    Color? maskColor,
  }) async {
    dynamic response;
    try {
      Future.delayed(const Duration(milliseconds: 500),() {
        if (response != null) return;
        _instance._isLoading = true;
        _instance._show(
          indicator: LoadingIndicator(message),
          maskColor: maskColor ?? _instance._defaultMaskColor,
          ignorePointer: false,
        );
      });
      response = await asyncFunction.call();
      dismiss();
      return response;
    } catch(e) {
      response = e;
      rethrow;
    }
  }

  /// success
  /// [message]文本提示
  /// [maskColor]蒙层颜色
  /// [displayDuration] 展示时长,默认2000(milliseconds)
  /// [indicator]自定义框框,传递则[message]无效~
  static Future<void> success(
    String message, {
    Color? maskColor,
    Duration? displayDuration,
    Widget? indicator,
  }) async {
    return await _instance._show(
      indicator: indicator ??
          IconIndicator(
            message: message,
            icon: CupertinoIcons.checkmark_alt,
          ),
      maskColor: maskColor,
      displayDuration: displayDuration ?? _instance._displayDuration,
    );
  }

  /// fail
  /// [message]文本提示
  /// [maskColor]蒙层颜色
  /// [displayDuration] 展示时长,默认2000(milliseconds)
  /// [indicator]自定义框框,传递则[message]无效~
  static Future<void> fail(
    String message, {
    Color? maskColor,
    Duration? displayDuration,
    Widget? indicator,
  }) async {
    return await _instance._show(
      indicator: indicator ??
          IconIndicator(
            message: message,
            icon: Icons.clear,
          ),
      maskColor: maskColor,
      displayDuration: displayDuration ?? _instance._displayDuration,
    );
  }

  /// 移除Toast
  static Future<void> dismiss({bool animation = true}) async {
    _instance._cancelTimer();
    return _instance._dismiss(animation);
  }

  Future<void> _show({
    required Widget indicator,
    Color? maskColor,
    IToastPosition? position,
    Duration? displayDuration,
    bool? ignorePointer,
  }) async {
    assert(
      overlayEntry != null,
      'You should call IToast.init() in your MaterialApp',
    );
    Completer<void> completer = Completer<void>();
    bool animation = _w == null;
    if (_key != null) await dismiss(animation: false);
    _key = GlobalKey<IToastWidgetState>();
    _w = IToastWidget(
      key: _key,
      indicator: indicator,
      maskColor: maskColor,
      animation: animation,
      completer: completer,
      toastPosition: position,
      ignorePointer: ignorePointer,
    );
    completer.future.whenComplete(() {
      if (displayDuration != null) {
        _cancelTimer();
        _timer = Timer(displayDuration, () async {
          await dismiss();
        });
      }
    });
    _markNeedsBuild();
    return completer.future;
  }

  Future<void> _dismiss(bool animation) async {
    if (key != null && key?.currentState == null) {
      _reset();
      return;
    }
    return key?.currentState?.dismiss(animation).whenComplete(() {
      _reset();
    });
  }

  /// 重新绘制UI，类似setState
  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }

  void _reset() {
    _w = null;
    _key = null;
    _isLoading = false;
    _markNeedsBuild();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}