// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:accumulation/model/common/src/advantages.dart';
import 'package:accumulation/model/common/src/education_experience.dart';
import 'package:accumulation/model/common/src/login_params.dart';
import 'package:accumulation/model/common/src/press_modell.dart';
import 'package:accumulation/model/common/src/recruitment.dart';
import 'package:accumulation/model/common/src/user_entity.dart';
import 'package:accumulation/model/common/src/weather.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);

class JsonConvert {
	static final Map<String, JsonConvertFunction> convertFuncMap = {
		(Advantages).toString(): Advantages.fromJson,
		(EducationExperience).toString(): EducationExperience.fromJson,
		(LoginParams).toString(): LoginParams.fromJson,
		(PressModel).toString(): PressModel.fromJson,
		(Recruitment).toString(): Recruitment.fromJson,
		(UserEntity).toString(): UserEntity.fromJson,
		(Weather).toString(): Weather.fromJson,
		(WeatherAlarm).toString(): WeatherAlarm.fromJson,
		(WeatherHours).toString(): WeatherHours.fromJson,
		(WeatherAqi).toString(): WeatherAqi.fromJson,
		(WeatherZhishu).toString(): WeatherZhishu.fromJson,
		(WeatherZhishuChuanyi).toString(): WeatherZhishuChuanyi.fromJson,
		(WeatherZhishuDaisan).toString(): WeatherZhishuDaisan.fromJson,
		(WeatherZhishuGanmao).toString(): WeatherZhishuGanmao.fromJson,
		(WeatherZhishuChenlian).toString(): WeatherZhishuChenlian.fromJson,
		(WeatherZhishuZiwaixian).toString(): WeatherZhishuZiwaixian.fromJson,
		(WeatherZhishuLiangshai).toString(): WeatherZhishuLiangshai.fromJson,
		(WeatherZhishuKaiche).toString(): WeatherZhishuKaiche.fromJson,
		(WeatherZhishuXiche).toString(): WeatherZhishuXiche.fromJson,
		(WeatherZhishuLvyou).toString(): WeatherZhishuLvyou.fromJson,
		(WeatherZhishuDiaoyu).toString(): WeatherZhishuDiaoyu.fromJson,
	};

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e,enumConvert: enumConvert)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

List<T>? convertListNotNull<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => _asT<T>(e,enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented');
      }
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<Advantages>[] is M){
			return data.map<Advantages>((Map<String, dynamic> e) => Advantages.fromJson(e)).toList() as M;
		}
		if(<EducationExperience>[] is M){
			return data.map<EducationExperience>((Map<String, dynamic> e) => EducationExperience.fromJson(e)).toList() as M;
		}
		if(<LoginParams>[] is M){
			return data.map<LoginParams>((Map<String, dynamic> e) => LoginParams.fromJson(e)).toList() as M;
		}
		if(<PressModel>[] is M){
			return data.map<PressModel>((Map<String, dynamic> e) => PressModel.fromJson(e)).toList() as M;
		}
		if(<Recruitment>[] is M){
			return data.map<Recruitment>((Map<String, dynamic> e) => Recruitment.fromJson(e)).toList() as M;
		}
		if(<UserEntity>[] is M){
			return data.map<UserEntity>((Map<String, dynamic> e) => UserEntity.fromJson(e)).toList() as M;
		}
		if(<Weather>[] is M){
			return data.map<Weather>((Map<String, dynamic> e) => Weather.fromJson(e)).toList() as M;
		}
		if(<WeatherAlarm>[] is M){
			return data.map<WeatherAlarm>((Map<String, dynamic> e) => WeatherAlarm.fromJson(e)).toList() as M;
		}
		if(<WeatherHours>[] is M){
			return data.map<WeatherHours>((Map<String, dynamic> e) => WeatherHours.fromJson(e)).toList() as M;
		}
		if(<WeatherAqi>[] is M){
			return data.map<WeatherAqi>((Map<String, dynamic> e) => WeatherAqi.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishu>[] is M){
			return data.map<WeatherZhishu>((Map<String, dynamic> e) => WeatherZhishu.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuChuanyi>[] is M){
			return data.map<WeatherZhishuChuanyi>((Map<String, dynamic> e) => WeatherZhishuChuanyi.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuDaisan>[] is M){
			return data.map<WeatherZhishuDaisan>((Map<String, dynamic> e) => WeatherZhishuDaisan.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuGanmao>[] is M){
			return data.map<WeatherZhishuGanmao>((Map<String, dynamic> e) => WeatherZhishuGanmao.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuChenlian>[] is M){
			return data.map<WeatherZhishuChenlian>((Map<String, dynamic> e) => WeatherZhishuChenlian.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuZiwaixian>[] is M){
			return data.map<WeatherZhishuZiwaixian>((Map<String, dynamic> e) => WeatherZhishuZiwaixian.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuLiangshai>[] is M){
			return data.map<WeatherZhishuLiangshai>((Map<String, dynamic> e) => WeatherZhishuLiangshai.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuKaiche>[] is M){
			return data.map<WeatherZhishuKaiche>((Map<String, dynamic> e) => WeatherZhishuKaiche.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuXiche>[] is M){
			return data.map<WeatherZhishuXiche>((Map<String, dynamic> e) => WeatherZhishuXiche.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuLvyou>[] is M){
			return data.map<WeatherZhishuLvyou>((Map<String, dynamic> e) => WeatherZhishuLvyou.fromJson(e)).toList() as M;
		}
		if(<WeatherZhishuDiaoyu>[] is M){
			return data.map<WeatherZhishuDiaoyu>((Map<String, dynamic> e) => WeatherZhishuDiaoyu.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.convert<M>(json);
		}
	}
}