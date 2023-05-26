// Function

import 'dart:async';

import 'package:accumulation/request/client/exception.dart';

/// 公司：遵义极客信息科技有限责任公司
/// 作者：Biao~~
/// 时间：2019-09-09
///
import 'package:flutter/cupertino.dart';
import '../components.dart';

typedef AsyncBodyBuilder<T> = Widget Function(BuildContext context, T data);

class Body<T> extends StatefulWidget {
  const Body({
    super.key,
    this.vsync,
    this.builder,
    this.child,
    this.onInit,
    this.message,
    this.useHUD = true,
    this.initData,
    this.autoKeep = false,
    this.error,
    this.loading,
    this.notData,
    this.notNetword,
    this.controller,
    this.onTap,
    this.bottom = true,
    this.top = false,
    this.fadeIn = true,
    this.macro = false,
    this.autoEmpty = true,
    this.funcName,
  });

  final BodyMixin<T>? vsync;

  /// 需要初始化，调用这个函数
  final Future<T> Function()? onInit;

  final String? message;

  /// 子组件/配件
  final AsyncBodyBuilder<T?>? builder;

  final T? initData;

  /// rebuild
  final BodyController<T>? controller;

  /// Whether to avoid system intrusions on the bottom side of the screen.
  final bool bottom;

  /// Whether to avoid system intrusions on the top side of the screen.
  final bool top;

  /// 是否动画显示
  final bool fadeIn;

  /// 宏观管理
  final bool macro;

  /// 是否使用提示动画,，
  ///
  /// 不使用提示动画,就不会将当前Body的context压入栈中，
  ///
  /// 避免使用顺序问题而报错
  final bool useHUD;

  final bool autoKeep;

  final Widget? child;

  final Widget? loading;

  final Widget? notData;

  final Widget? error;

  final Widget? notNetword;

  /// 点击Body界面，主要用于隐藏键盘
  final VoidCallback? onTap;

  /// 自动显示empty界面
  final bool autoEmpty;

  ///只用于显示没有初始化时的船功能的功能提示
  final String? funcName;

  @override
  BodyState<T> createState() => BodyState<T>();
}

class BodyState<T> extends State<Body<T>> with AutomaticKeepAliveClientMixin {
  /// 提示动画
  ProgressHUDController? _hudController;
  BodyController<T>? _controller;

  @override
  void initState() {
    if (widget.useHUD == true) {
      _hudController = ProgressHUDController();
      UX.share().huds.add(_hudController!);
    }
    _controller =
        widget.controller ?? (widget.vsync?.controller ?? BodyController<T>());
    super.initState();
    widget.vsync?.context = context;
    widget.vsync?.initState();
  }

  Future<T?> Function()? get _onInit {
    if (widget.onInit != null) return widget.onInit;

    if (widget.vsync?.onInit != null) return () async => widget.vsync?.onInit();
    return null;
  }

  Widget _bodyBuilder() {
    return _BodyBuilder<T?>(
      initialData: widget.initData,
      onInit: _onInit,
      controller: _controller,
      builder: (ctx, snapshot) {
        if (snapshot.data == kBodyFunctionNullIndicator) {
          if (widget.builder != null) {
            return widget.builder!(context, widget.initData);
          }
        }
        Widget emptyView = EmptyWidget(
          type: EmptyType.empty,
          message: widget.message,
        );
        Widget? child = emptyView;
        if (snapshot.hasError) {
          if (snapshot.error is ApiException) {
            var error = snapshot.error as ApiException;
            return widget.notNetword ??
                EmptyWidget(
                  type: EmptyType.noNetwork,
                  message: error.msg,
                  btnTitle: "重新加载",
                  onTap: () => _controller?.reload(),
                );
          }
          return EmptyWidget(
            type: EmptyType.error,
            message: snapshot.error?.toString(),
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            child = widget.child ?? widget.builder?.call(ctx, widget.initData);
            break;
          case ConnectionState.waiting:
          case ConnectionState.active:
            return widget.loading ?? _LoadingView();
          case ConnectionState.done:
            if (!widget.autoEmpty) {
              child = widget.child ?? widget.builder?.call(ctx, snapshot.data);
            }
            if (widget.autoEmpty) {
              var state = snapshot.data;
              if (state == null) {
                child = widget.notData ?? emptyView;
                break;
              }
              if (snapshot.data != null) {
                child =
                    widget.child ?? widget.builder?.call(ctx, snapshot.data);
              }
              if (snapshot.data == null) {
                return widget.notData ?? emptyView;
              }
            }
            break;
        }
        return FadeTransitionView(
          speed: 300,
          child: SafeArea(
            bottom: widget.bottom,
            top: widget.top,
            child: child ?? emptyView,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    widget.vsync?.context = context;
    // UX.context = context;
    if (widget.useHUD == true && !UX.share().contexts.contains(context)) {
      UX.share().contexts.add(context);
    }

    return GestureDetector(
      onTap:
          widget.onTap ?? () => FocusManager.instance.primaryFocus?.unfocus(),
      child: widget.useHUD
          ? ProgressHUD(
              controller: _hudController!,
              child: _bodyBuilder(),
            )
          : _bodyBuilder(),
    );
  }

  @override
  void dispose() {
    if (widget.useHUD == true) {
      UX.removeToast();
      UX.share().contexts.remove(context);
      UX.share().huds.remove(_hudController);
    }
    widget.vsync?.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => widget.autoKeep;
}

class _BodyBuilder<T> extends StatefulWidget {
  const _BodyBuilder({
    Key? key,
    this.initialData,
    this.onInit,
    required this.builder,
    this.controller,
  }) : super(key: key);

  final Future<T> Function()? onInit;

  final AsyncWidgetBuilder<T> builder;

  final T? initialData;

  final BodyController<T>? controller;

  @override
  _BodyBuilderState<T> createState() => _BodyBuilderState<T>();
}

class _BodyBuilderState<T> extends State<_BodyBuilder<T>> {
  AsyncSnapshot<T>? _snapshot;

  Object? _activeCallbackIdentity;

  BodyController? _controller;

  @override
  Widget build(BuildContext context) => widget.builder(context, _snapshot!);

  void _subscribe() async {
    if (widget.onInit != null) {
      final Object callbackIndentity = Object();
      _activeCallbackIdentity = callbackIndentity;
      try {
        _snapshot = AsyncSnapshot<T>.waiting();
        var data = await widget.onInit!();
        _controller?._loadFinished();
        if (_activeCallbackIdentity == callbackIndentity) {
          setState(() {
            _snapshot = AsyncSnapshot<T>.withData(ConnectionState.done, data);
          });
        }
      } catch (error, stackTrace) {
        _controller?._loadFinished();
        if (_activeCallbackIdentity == callbackIndentity) {
          setState(() {
            _snapshot = AsyncSnapshot<T>.withError(
              ConnectionState.done,
              error,
              stackTrace,
            );
          });
        }
      }
    }
  }

  void _unsubscribe() {
    _activeCallbackIdentity = null;
  }

  void _resubscribe() {
    if (_controller?._reload == true) {
      setState(() {
        _snapshot = AsyncSnapshot<T>.waiting();
      });
      _unsubscribe();
      _subscribe();
      _controller?._loading = true;
    }
  }

  void _withData() {
    if (_controller?._withData == true) {
      setState(() {
        _snapshot =
            AsyncSnapshot<T>.withData(ConnectionState.done, _controller?._data);
      });
      _controller?._withData = false;
    }
  }

  void _updateController() {
    if (_controller == widget.controller) return;
    _controller?.removeListener(_resubscribe);
    _controller?.removeListener(_withData);
    _controller = widget.controller;
    _controller?.addListener(_resubscribe);
    _controller?.addListener(_withData);
  }

  @override
  void initState() {
    super.initState();
    _snapshot = widget.initialData == null
        ? AsyncSnapshot<T>.nothing()
        : AsyncSnapshot<T>.withData(
            ConnectionState.none, widget.initialData as T);
    _subscribe();
    _updateController();
  }

  @override
  void didUpdateWidget(covariant _BodyBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.onInit != widget.onInit) {
      if (_activeCallbackIdentity != null) {
        _unsubscribe();
        _snapshot = _snapshot?.inState(ConnectionState.none);
      }
      _subscribe();
    }
    _updateController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateController();
  }

  @override
  void dispose() {
    _unsubscribe();
    _controller?.removeListener(_resubscribe);
    _controller = null;
    super.dispose();
  }
}

class _LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}

class BodyController<T> with ChangeNotifier {
  bool _reload = false;
  bool _loading = false;
  bool _withData = false;
  dynamic _data;

  void reload() {
    _reload = true;
    if (!_loading) notifyListeners();
  }

  /// 数据重新关联,也就是更新一下数据界面,initData:是否是初始化，初始化不更新
  ///
  /// 因为在界面中有onInit函数刷新了，有时候在加载界面也会用到，避免重复刷新
  void withData(T? data, [bool initData = false]) {
    if (_withData || initData) return;
    _data = data;
    _withData = true;
    notifyListeners();
  }

  void _loadFinished() {
    _reload = false;
    _loading = false;
  }
}
