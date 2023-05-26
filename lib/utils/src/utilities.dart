import 'package:accumulation/components/adapter/cupertino_swipe_back_observer.dart';
import 'package:accumulation/components/i-toast/src/toast.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

typedef ValueCallback<T, S> = T Function(S);

/// 路由函数回调
typedef RouteCallback<T> = void Function(T data, String key);

/// push进入一个新界面
Future pushPage(context, Widget page) async {
  await CupertinoSwipeBackObserver.promise?.future;
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (ctx) => page, maintainState: true),
  );
}

Future pushNamed(context, String name, [args]) async {
  await CupertinoSwipeBackObserver.promise?.future;
  return await Navigator.pushNamed(context, name, arguments: args);
}

Future pushNamedAndRemoveUntil(
    BuildContext context, String newRouteName, String predicateName,
    [Object? args]) async {
  return await Navigator.pushNamedAndRemoveUntil(
    context,
    newRouteName,
    ModalRoute.withName(predicateName),
    arguments: args,
  );
}

Future<T?> pushReplacementNamed<T>(BuildContext context, String newRouteName,
    [Object? args]) async {
  return await Navigator.pushReplacementNamed<T, dynamic>(context, newRouteName,
      arguments: args);
}

bool isNull(Object? data) {
  if (data == null) return true;

  if (data is Map) return data.isEmpty;

  if (data is String) return data.isEmpty;

  if (data is List) return data.compact().isEmpty;

  if (data is Set) return data.isEmpty;

  return false;
}

class IDateUtils {
  IDateUtils._();

  /// 计算过期时间(年、月、日)
  ///
  /// 返回值为null,已过期
  static String? beforeDate(
    String? endDate, {
    String? beginDate,
    String? willOverLabel,
  }) {
    try {
      int? days = differenceDays(endDate, beginDate: beginDate);
      if (days == null || days < 0) return null;
      if (days == 0) return willOverLabel ?? "今天";
      var start = DateTime.tryParse(beginDate ?? '') ?? DateTime.now();
      var end = DateTime.tryParse(endDate ?? '');
      if (end == null) return null;
      int day = 0;
      if (end.day > start.day) {
        // 大于，直接计算
        day = end.subtract(Duration(days: start.day)).day;
      }
      if (end.day < start.day) {
        // 小于，直接拉差距
        int maxDays = DateUtils.getDaysInMonth(start.year, start.month);
        int detalDays = maxDays - start.day + 1;
        start = start.add(Duration(days: detalDays));
        day = detalDays + end.day - 1;
      }
      int month = DateUtils.monthDelta(start, end);
      int year = month ~/ 12;
      if (year > 0) month = month % 12;
      String result = '';
      if (year > 0) result += '$year\t年\t';
      if (month > 0) result += '$month个月\t';
      if (day > 0) result += "$day\t天";
      return result;
    } catch (e) {
      xprint(e);
      return null;
    }
  }

  /// 结束日期距离开始日期天数(beginDate为null时，默认使用当前日期)
  static int? differenceDays(String? endDate, {String? beginDate}) {
    try {
      DateTime? end = DateTime.tryParse(endDate ?? '');
      if (end == null) return null;
      DateTime? start = DateTime.tryParse(beginDate ?? '');
      start ??= DateTime.now();
      start = DateUtils.dateOnly(start);
      end = DateUtils.dateOnly(end);
      return end.difference(start).inDays;
    } catch (e) {
      xprint(e);
      return null;
    }
  }

  /// 时间格式化，返回字符串，默认格式：2019-01-01
  static String? format(DateTime? date, [String format = 'yyyy-MM-dd']) {
    try {
      if (date == null) return null;
      return DateFormat(format).format(date);
    } catch (e) {
      return null;
    }
  }

  /// 提示距离当前多少时间
  static String? remindTime(String? date) {
    try {
      DateTime now = DateTime.now();
      DateTime? end = DateTime.tryParse(date ?? '');
      if (end == null) return '-';
      end = end.add(Duration(seconds: UXBase.deltaSeconds));
      if (end.isAfter(now)) return "刚刚";
      if (now.year > end.year) return format(end);
      var diff = now.difference(end);
      if (diff.inDays > 7) return '${format(end, "MM-dd")}';
      if (diff.inDays > 0) return '${diff.inDays}天前';
      if (diff.inHours > 0) return '${diff.inHours}小时前';
      if (diff.inMinutes > 0) return '${diff.inMinutes}分钟前';
      return "刚刚";
    } catch (e) {
      return null;
    }
  }

  /// 计算年龄
  static int? age(String? birthday) {
    try {
      if (birthday == null) return null;
      DateTime? start = DateTime.tryParse(birthday);
      if (start == null) return null;
      var end = DateTime.now();
      if (end.isBefore(start)) return 0;
      int startMonthMaxDays = DateUtils.getDaysInMonth(start.year, start.month);
      int endMonthMaxDays = DateUtils.getDaysInMonth(end.year, end.month);
      bool equalMonth =
          startMonthMaxDays == start.day && endMonthMaxDays == end.day;
      if (end.day < start.day && !equalMonth) {
        // 小于，直接拉差距
        int detalStartDays = startMonthMaxDays - start.day + 1;
        start = start.add(Duration(days: detalStartDays));
        end = end.subtract(Duration(days: end.day - 1));
      }
      int month = DateUtils.monthDelta(start, end);
      return month ~/ 12;
    } catch (e) {
      xprint('error:$e');
      return null;
    }
  }

  /// 添加月份month:需要添加月份，
  /// destDate：给定日期，如果不给定则默认当前时间,
  /// isEmbarkTime:针对船员上船时间，计算下船时间，与pc一致
  static DateTime? addMonth(int month, {String? destDate, bool? isEmbarkTime}) {
    try {
      var date = DateTime.tryParse(destDate ?? '') ?? DateTime.now();
      int day = date.day;
      int endMonth = date.month + month; //所添加的月份

      ///针对下船提醒
      if (isEmbarkTime == true) {
        var endDate = DateTime(date.year, endMonth, date.day); //添加后的日期
        int diffMonth = DateUtils.monthDelta(date, endDate); //计算相差月份
        if (diffMonth != month) {
          //获取每月天数
          day = DateUtils.getDaysInMonth(date.year, endMonth);
        }
      }

      return DateTime(date.year, endMonth, day);
    } catch (e) {
      return null;
    }
  }

  /// 时间差，返回YYYY-MM-dd格式
  static String? monthAndDaysDelta(String start, String end) {
    try {
      if (isNull(start) || isNull(end)) return null;
      DateTime? startDate = DateTime.tryParse(start);
      DateTime? endDate = DateTime.tryParse(end);
      if (endDate == null || startDate == null) return null;
      int day = 0;
      if (endDate.day > startDate.day) {
        // 大于，直接计算
        day = endDate.subtract(Duration(days: startDate.day)).day;
      }
      if (endDate.day < startDate.day) {
        // 小于就补全
        int maxStartDays =
            DateUtils.getDaysInMonth(startDate.year, startDate.month);
        // 天数计算
        int detalStartDays = maxStartDays - startDate.day + 1;
        day = detalStartDays + endDate.day - 1;
        // 日期调整
        startDate = startDate.add(Duration(days: detalStartDays));
        endDate = endDate.subtract(Duration(days: endDate.day - 1));
      }
      int month = DateUtils.monthDelta(startDate, endDate);
      if (month < 1) return "$day\t天";
      if (day < 1) return "$month个月";
      return "$month个月\t$day\t天";
    } catch (e) {
      return null;
    }
  }
}

void xprint(Object object) {
  if (!kReleaseMode) {
    // ignore: avoid_print
    print(object);
  }
}

class ExitApp {
  const ExitApp._();

  static DateTime? _lastTime;

  /// [forceQuit]是否强制退出APP;当栈中还存在路由时,执行的操作是返回上一页
  static Future<bool> canExit([bool forceQuit = false]) async {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime!) > const Duration(seconds: 2)) {
      _lastTime = DateTime.now();
      IToast.show("再次返回退出");
      return false;
    }
    if (forceQuit) {
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return false;
    }
    return true;
  }
}
