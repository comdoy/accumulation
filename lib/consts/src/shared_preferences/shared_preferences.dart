import 'dart:async';

import 'package:accumulation/utils/utils_paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 用来做shared_preferences的存储
class SpUtil {
  static SpUtil? _instance;
  static Future<SpUtil?> get instance async {
    return await getInstance();
  }

  static SharedPreferences? _spf;

  SpUtil._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<SpUtil?> getInstance() async {
    try {
      if (_instance == null) {
        _instance = SpUtil._();
        await _instance?._init();
      }
      return _instance;
    } catch (e) {
      xprint(e);
      return null;
    }
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  // 判断是否存在数据
  bool hasKey(String key) {
    Set? keys = getKeys();
    return keys?.contains(key) == true;
  }

  Set<String>? getKeys() {
    if (_beforeCheck()) return null;
    return _spf?.getKeys();
  }

  get(String key) {
    if (_beforeCheck()) return null;
    return _spf?.get(key);
  }

  String? getString(String key) {
    if (_beforeCheck()) return null;
    return _spf?.getString(key);
  }

  Future<bool> putString(String key, String value) async {
    if (_beforeCheck()) return false;
    return (await _spf?.setString(key, value)) == true;
  }

  bool? getBool(String key) {
    if (_beforeCheck()) return null;
    return _spf?.getBool(key);
  }

  Future<bool?> putBool(String key, bool value) async {
    if (_beforeCheck()) return null;
    return _spf?.setBool(key, value);
  }

  int? getInt(String key) {
    if (_beforeCheck()) return null;
    return _spf?.getInt(key);
  }

  Future<bool?> putInt(String key, int value) async {
    if (_beforeCheck()) return null;
    return _spf?.setInt(key, value);
  }

  double? getDouble(String key) {
    if (_beforeCheck()) return null;
    return _spf?.getDouble(key);
  }

  Future<bool?> putDouble(String key, double value) async {
    if (_beforeCheck()) return null;
    return _spf?.setDouble(key, value);
  }

  List<String>? getStringList(String key) {
    return _spf?.getStringList(key);
  }

  Future<bool?> putStringList(String key, List<String> value) async {
    if (_beforeCheck()) return null;
    return _spf?.setStringList(key, value);
  }

  dynamic getDynamic(String key) {
    if (_beforeCheck()) return null;
    return _spf?.get(key);
  }

  Future<bool?> remove(String key) async {
    if (_beforeCheck()) return null;
    return _spf?.remove(key);
  }

  Future<bool?> clear() async {
    if (_beforeCheck()) return null;
    return _spf?.clear();
  }
}
