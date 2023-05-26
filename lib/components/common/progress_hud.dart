// Function
/// 公司：遵义极客信息科技有限责任公司
/// 作者：Biao~~
/// 时间：2019-09-09
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum _HUDStatus {
  hidden,
  show,
}

class ProgressHUD extends StatefulWidget {
  const ProgressHUD({super.key, required this.controller, required this.child});

  final ProgressHUDController controller;

  final Widget child;

  @override
  State<ProgressHUD> createState() => _ProgressHUDState();
}

class _ProgressHUDState extends State<ProgressHUD> {
  bool _hidden = true;

  ProgressHUDController? _controller;

  @override
  void initState() {
    super.initState();
    _updated();
  }

  void _updated() {
    if (_controller == widget.controller) return;
    _controller?.removeListener(_show);
    _controller?.removeListener(_dismiss);
    _controller = widget.controller;
    _controller?.addListener(_show);
    _controller?.addListener(_dismiss);
  }

  void _show() {
    if (_controller?._status != _HUDStatus.show) return;
    if (mounted) {
      setState(() {
        _hidden = false;
      });
    }
  }

  void _dismiss() {
    if (_controller?._status != _HUDStatus.hidden) return;
    if (mounted) {
      setState(() {
        _hidden = true;
      });
    }
  }

  Widget _buildHUD() {
    if (_hidden) return const SizedBox();
    return ColoredBox(
      color: Colors.black12,
      child: Align(
        alignment: Alignment.center,
        child: _ProgressBox(
          indicator:
              _controller?._indicator ?? const CupertinoActivityIndicator(),
          text: _controller?._text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [widget.child, _buildHUD()]);
  }

  @override
  void dispose() {
    _controller?.removeListener(_show);
    _controller?.removeListener(_dismiss);
    _controller = null;
    super.dispose();
  }
}

class _ProgressBox extends StatelessWidget {
  const _ProgressBox({required this.indicator, this.text});

  final Widget? text;

  final Widget indicator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: text == null
          ? indicator
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [indicator, text!],
            ),
    );
  }
}

class ProgressHUDController with ChangeNotifier {
  /// 标识一下，你通知谁了
  _HUDStatus _status = _HUDStatus.hidden;
  Widget? _text;
  Widget? _indicator;

  void show({
    Widget? text,
    Widget? indicator,
    Duration? duration,
  }) {
    _status = _HUDStatus.show;
    _text = text;
    _indicator = indicator;
    notifyListeners();
    if (duration != null) {
      Future.delayed(duration, hidden);
    }
  }

  void loading([String? text, Duration? duration]) {
    show(
      duration: duration,
      text: text == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(text),
            ),
      indicator: const CupertinoActivityIndicator(),
    );
  }

  void error([String? text, Duration? duration]) {
    show(
      duration: duration ?? const Duration(milliseconds: 1500),
      text: text == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(text),
            ),
      indicator: const Icon(
        CupertinoIcons.clear_circled_solid,
        size: 30,
        color: Colors.red,
      ),
    );
  }

  void success([String? text, Duration? duration]) {
    show(
      duration: duration ?? const Duration(milliseconds: 1500),
      text: text == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(text),
            ),
      indicator: const Icon(
        CupertinoIcons.check_mark_circled_solid,
        size: 30,
        color: Colors.green,
      ),
    );
  }

  void hidden() {
    _status = _HUDStatus.hidden;
    notifyListeners();
  }
}
