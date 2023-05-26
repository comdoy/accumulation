// 不太想用第三方的插件了，瞎写一个通知类型的
///
/// 全局通知
///
class PublishNotifier {
  // Set _listeners = {};
  final Map<Object, Set> _listeners = {};
  void addListener<T>(Object obj, void Function(T) listener) {
    _listeners[obj] ??= {};
    _listeners[obj]?.add(listener);
  }

  void removeListener(Object object) {
    _listeners.remove(object);
  }

  // void fire<T>(T data) {
  //   assert(T is Object, "必须指定类型");
  //   var values = _listeners.values.expand((element) => element).toList();
  //   for (final entry in values) {
  //     if (entry is void Function(T)) {
  //       entry(data);
  //     }
  //   }
  // }
  // 上面的用起来麻烦
  // 这个看起来不好看
  void fire(data) {
    var values = _listeners.values.expand((element) => element).toList();
    for (final entry in values) {
      if (entry.toString().contains("(${data.runtimeType})")) {
        entry(data);
      }
    }
  }
}

PublishNotifier publishEvent = PublishNotifier();
