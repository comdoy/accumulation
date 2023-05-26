import 'dart:async';

import 'package:accumulation/components/common/empty.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IException implements Exception {
  IException([this.message]);

  final String? message;

  @override
  String toString() {
    return message ?? super.toString();
  }
}

class RefreshExpiration extends IException {
  RefreshExpiration([String? message]) : super(message);
}

class JKPullRefresh extends StatelessWidget {
  const JKPullRefresh({super.key, 
    required this.child,
    required this.controller,
    this.onRefresh,
    this.onLoading,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.empty = false,
    this.hint,
    this.physics,
    this.header,
  });

  final Widget child;

  final FutureOr Function()? onRefresh;

  final FutureOr Function()? onLoading;

  final RefreshController controller;

  final bool enablePullDown;

  final bool enablePullUp;

  final bool empty;

  final String? hint;

  final ScrollPhysics? physics;

  final Widget? header;

  @override
  Widget build(BuildContext context) {
    var mgStyle = TextStyle(color: Theme.of(context).hintColor, fontSize: 13);
    return SmartRefresher(
      physics: physics,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      header: header ??
          CustomHeader(
            builder: (ctx, mode) {
              Widget body;
              if (mode == RefreshStatus.idle) {
                body = Text("继续下拉刷新", style: mgStyle);
              } else if (mode == RefreshStatus.refreshing) {
                body = const cupertino.CupertinoActivityIndicator();
              } else if (mode == RefreshStatus.failed) {
                body = Text("请求错误，请检查网络情况", style: mgStyle);
              } else if (mode == RefreshStatus.canRefresh) {
                body = Text("上拉加载更多", style: mgStyle);
              } else {
                body = Text("刷新成功", style: mgStyle);
              }
              return SizedBox(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
      footer: CustomFooter(
        builder: (ctx, mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("上拉加载更多", style: mgStyle);
          } else if (mode == LoadStatus.loading) {
            body = const cupertino.CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败！点击重试！", style: mgStyle);
          } else if (mode == LoadStatus.canLoading) {
            body = Text("加载中......", style: mgStyle);
          } else {
            body = Text("已全部加载", style: mgStyle);
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: controller,
      onRefresh: () async {
        try {
          var res = await onRefresh!();
          if (res is RefreshExpiration) {
            controller.refreshFailed();
          } else {
            controller.refreshCompleted(resetFooterState: true);
          }
        } catch (e) {
          controller.refreshFailed();
        }
      },
      onLoading: () async {
        try {
          var data = await onLoading!();
          data != [] ? controller.loadNoData() : controller.loadComplete();
        } catch (e) {
          controller.loadFailed();
        }
      },
      child: empty ? EmptyWidget(message: hint) : child,
    );
  }
}
