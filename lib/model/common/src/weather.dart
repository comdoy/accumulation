import 'package:accumulation/generated/json/base/json_field.dart';
import 'package:accumulation/generated/json/weather.g.dart';
import 'dart:convert';

@JsonSerializable()
class Weather {
	late String cityid;
	late String date;
	late String week;
	@JSONField(name: "update_time")
	late String updateTime;
	late String city;
	late String cityEn;
	late String country;
	late String countryEn;
	late String wea;
	@JSONField(name: "wea_img")
	late String weaImg;
	late String tem;
	late String tem1;
	late String tem2;
	late String win;
	@JSONField(name: "win_speed")
	late String winSpeed;
	@JSONField(name: "win_meter")
	late String winMeter;
	late String humidity;
	late String visibility;
	late String pressure;
	late String air;
	@JSONField(name: "air_pm25")
	late String airPm25;
	@JSONField(name: "air_level")
	late String airLevel;
	@JSONField(name: "air_tips")
	late String airTips;
	late WeatherAlarm alarm;
	@JSONField(name: "wea_day")
	late String weaDay;
	@JSONField(name: "wea_day_img")
	late String weaDayImg;
	@JSONField(name: "wea_night")
	late String weaNight;
	@JSONField(name: "wea_night_img")
	late String weaNightImg;
	late String sunrise;
	late String sunset;
	late List<WeatherHours> hours;
	late WeatherAqi aqi;
	late WeatherZhishu zhishu;
	late int nums;

	Weather();

	factory Weather.fromJson(Map<String, dynamic> json) => $WeatherFromJson(json);

	Map<String, dynamic> toJson() => $WeatherToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherAlarm {
	@JSONField(name: "alarm_type")
	late String alarmType;
	@JSONField(name: "alarm_level")
	late String alarmLevel;
	@JSONField(name: "alarm_content")
	late String alarmContent;

	WeatherAlarm();

	factory WeatherAlarm.fromJson(Map<String, dynamic> json) => $WeatherAlarmFromJson(json);

	Map<String, dynamic> toJson() => $WeatherAlarmToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherHours {
	late String hours;
	late String wea;
	@JSONField(name: "wea_img")
	late String weaImg;
	late String tem;
	late String win;
	@JSONField(name: "win_speed")
	late String winSpeed;
	late String aqi;
	late String aqinum;

	WeatherHours();

	factory WeatherHours.fromJson(Map<String, dynamic> json) => $WeatherHoursFromJson(json);

	Map<String, dynamic> toJson() => $WeatherHoursToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherAqi {
	@JSONField(name: "update_time")
	late String updateTime;
	late String air;
	@JSONField(name: "air_level")
	late String airLevel;
	@JSONField(name: "air_tips")
	late String airTips;
	late String pm25;
	@JSONField(name: "pm25_desc")
	late String pm25Desc;
	late String pm10;
	@JSONField(name: "pm10_desc")
	late String pm10Desc;
	late String o3;
	@JSONField(name: "o3_desc")
	late String o3Desc;
	late String no2;
	@JSONField(name: "no2_desc")
	late String no2Desc;
	late String so2;
	@JSONField(name: "so2_desc")
	late String so2Desc;
	late String co;
	@JSONField(name: "co_desc")
	late String coDesc;
	late String kouzhao;
	late String yundong;
	late String waichu;
	late String kaichuang;
	late String jinghuaqi;

	WeatherAqi();

	factory WeatherAqi.fromJson(Map<String, dynamic> json) => $WeatherAqiFromJson(json);

	Map<String, dynamic> toJson() => $WeatherAqiToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishu {
	late WeatherZhishuChuanyi chuanyi;
	late WeatherZhishuDaisan daisan;
	late WeatherZhishuGanmao ganmao;
	late WeatherZhishuChenlian chenlian;
	late WeatherZhishuZiwaixian ziwaixian;
	late WeatherZhishuLiangshai liangshai;
	late WeatherZhishuKaiche kaiche;
	late WeatherZhishuXiche xiche;
	late WeatherZhishuLvyou lvyou;
	late WeatherZhishuDiaoyu diaoyu;

	WeatherZhishu();

	factory WeatherZhishu.fromJson(Map<String, dynamic> json) => $WeatherZhishuFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuChuanyi {
	late String level;
	late String tips;

	WeatherZhishuChuanyi();

	factory WeatherZhishuChuanyi.fromJson(Map<String, dynamic> json) => $WeatherZhishuChuanyiFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuChuanyiToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuDaisan {
	late String level;
	late String tips;

	WeatherZhishuDaisan();

	factory WeatherZhishuDaisan.fromJson(Map<String, dynamic> json) => $WeatherZhishuDaisanFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuDaisanToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuGanmao {
	late String level;
	late String tips;

	WeatherZhishuGanmao();

	factory WeatherZhishuGanmao.fromJson(Map<String, dynamic> json) => $WeatherZhishuGanmaoFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuGanmaoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuChenlian {
	late String level;
	late String tips;

	WeatherZhishuChenlian();

	factory WeatherZhishuChenlian.fromJson(Map<String, dynamic> json) => $WeatherZhishuChenlianFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuChenlianToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuZiwaixian {
	late String level;
	late String tips;

	WeatherZhishuZiwaixian();

	factory WeatherZhishuZiwaixian.fromJson(Map<String, dynamic> json) => $WeatherZhishuZiwaixianFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuZiwaixianToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuLiangshai {
	late String level;
	late String tips;

	WeatherZhishuLiangshai();

	factory WeatherZhishuLiangshai.fromJson(Map<String, dynamic> json) => $WeatherZhishuLiangshaiFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuLiangshaiToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuKaiche {
	late String level;
	late String tips;

	WeatherZhishuKaiche();

	factory WeatherZhishuKaiche.fromJson(Map<String, dynamic> json) => $WeatherZhishuKaicheFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuKaicheToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuXiche {
	late String level;
	late String tips;

	WeatherZhishuXiche();

	factory WeatherZhishuXiche.fromJson(Map<String, dynamic> json) => $WeatherZhishuXicheFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuXicheToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuLvyou {
	late String level;
	late String tips;

	WeatherZhishuLvyou();

	factory WeatherZhishuLvyou.fromJson(Map<String, dynamic> json) => $WeatherZhishuLvyouFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuLvyouToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WeatherZhishuDiaoyu {
	late String level;
	late String tips;

	WeatherZhishuDiaoyu();

	factory WeatherZhishuDiaoyu.fromJson(Map<String, dynamic> json) => $WeatherZhishuDiaoyuFromJson(json);

	Map<String, dynamic> toJson() => $WeatherZhishuDiaoyuToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}