import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmptyType {
  empty,
  noNetwork,
  error,
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.child,
    this.type = EmptyType.empty,
    this.message,
    this.onTap,
    this.button,
    this.btnTitle,
  });
  final Widget? child;

  final EmptyType type;

  final String? message;

  final VoidCallback? onTap;

  final Widget? button;

  final String? btnTitle;

  String get _hint {
    if (message?.isNotEmpty == true) return message!;
    switch (type) {
      case EmptyType.error:
        return "数据异常";
      case EmptyType.noNetwork:
        return "网络错误";
      default:
        return "暂无数据";
    }
  }

  String get _image {
    switch (type) {
      case EmptyType.error:
        return ImgAsset.error;
      case EmptyType.noNetwork:
        return ImgAsset.network;
      default:
        return ImgAsset.empty;
    }
  }

  Widget get emptyContent {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            _image,
            height: 128,
            width: 128,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text(
              _hint,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFFAEAEAE),
              ),
            ),
          ),
          button ??
              Offstage(
                offstage: onTap == null,
                child: CupertinoButton(
                  onPressed: onTap,
                  child: Text(btnTitle ?? "重试"),
                ),
              ),
          const SizedBox(height: 2 * kToolbarHeight)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: child ?? emptyContent);
  }
}
