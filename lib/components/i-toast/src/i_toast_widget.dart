import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import './toast.dart';

///
/// @author xbwca
/// @description: 大框框,铺满整个屏幕那种
/// @date :2022/3/2 16:03
///
class IToastWidget extends StatefulWidget {
  const IToastWidget({
    Key? key,
    bool? ignorePointer,
    this.maskColor,
    this.indicator,
    this.toastPosition,
    this.completer,
    this.animation = true,
  })  : ignorePointer = ignorePointer ?? true,
        super(key: key);

  final Color? maskColor;

  final IToastPosition? toastPosition;

  final Completer<void>? completer;

  final bool animation;

  final bool ignorePointer;

  final Widget? indicator;

  @override
  State<StatefulWidget> createState() => IToastWidgetState();
}

class IToastWidgetState extends State<IToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  AlignmentDirectional get _alignment {
    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      return AlignmentDirectional.center;
    }
    return widget.toastPosition == IToastPosition.top
        ? AlignmentDirectional.topCenter
        : widget.toastPosition == IToastPosition.bottom
            ? AlignmentDirectional.bottomCenter
            : AlignmentDirectional.center;
  }

  bool get isPersistentCallbacks =>
      SchedulerBinding.instance.schedulerPhase ==
      SchedulerPhase.persistentCallbacks;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addStatusListener((status) {
        bool isCompleted = widget.completer?.isCompleted ?? false;
        if (status == AnimationStatus.completed && !isCompleted) {
          widget.completer?.complete();
        }
      });
    show(widget.animation);
  }

  Future<void> show(bool animation) {
    if (isPersistentCallbacks) {
      Completer completer = Completer();
      SchedulerBinding.instance.addPostFrameCallback((_) => completer
          .complete(_animationController.forward(from: animation ? 0 : 1)));
      return completer.future;
    } else {
      return _animationController.forward(from: animation ? 0 : 1);
    }
  }

  Future<void> dismiss(bool animation) {
    if (isPersistentCallbacks) {
      Completer completer = Completer();
      SchedulerBinding.instance.addPostFrameCallback((_) => completer
          .complete(_animationController.reverse(from: animation ? 1 : 0)));
      return completer.future;
    } else {
      return _animationController.reverse(from: animation ? 1 : 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: _alignment,
      children: [
        AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return IgnorePointer(
                ignoring: widget.ignorePointer,
                child: Opacity(
                  opacity: _animationController.value,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: widget.maskColor,
                  ),
                ),
              );
            }),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Opacity(
              opacity: _animationController.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 100,
                  horizontal: 20,
                ),
                child: widget.indicator ?? const SizedBox(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
