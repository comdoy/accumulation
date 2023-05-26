import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///
/// @author xbwca
/// @description: 浮层
/// @date :2022/3/2 15:25
///
class IOverlayEntry extends OverlayEntry {

  final WidgetBuilder builders;

  IOverlayEntry({
    required this.builders,
  }) : super(builder: builders);

  @override
  void markNeedsBuild() {
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        super.markNeedsBuild();
      });
    } else {
      super.markNeedsBuild();
    }
  }
}
