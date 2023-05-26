import 'package:accumulation/generated/json/base/json_convert_content.dart';
import 'package:accumulation/model/common/src/weather.dart';

Weather $WeatherFromJson(Map<String, dynamic> json) {
	final Weather weather = Weather();
	final String? cityid = jsonConvert.convert<String>(json['cityid']);
	if (cityid != null) {
		weather.cityid = cityid;
	}
	final String? date = jsonConvert.convert<String>(json['date']);
	if (date != null) {
		weather.date = date;
	}
	final String? week = jsonConvert.convert<String>(json['week']);
	if (week != null) {
		weather.week = week;
	}
	final String? updateTime = jsonConvert.convert<String>(json['update_time']);
	if (updateTime != null) {
		weather.updateTime = updateTime;
	}
	final String? city = jsonConvert.convert<String>(json['city']);
	if (city != null) {
		weather.city = city;
	}
	final String? cityEn = jsonConvert.convert<String>(json['cityEn']);
	if (cityEn != null) {
		weather.cityEn = cityEn;
	}
	final String? country = jsonConvert.convert<String>(json['country']);
	if (country != null) {
		weather.country = country;
	}
	final String? countryEn = jsonConvert.convert<String>(json['countryEn']);
	if (countryEn != null) {
		weather.countryEn = countryEn;
	}
	final String? wea = jsonConvert.convert<String>(json['wea']);
	if (wea != null) {
		weather.wea = wea;
	}
	final String? weaImg = jsonConvert.convert<String>(json['wea_img']);
	if (weaImg != null) {
		weather.weaImg = weaImg;
	}
	final String? tem = jsonConvert.convert<String>(json['tem']);
	if (tem != null) {
		weather.tem = tem;
	}
	final String? tem1 = jsonConvert.convert<String>(json['tem1']);
	if (tem1 != null) {
		weather.tem1 = tem1;
	}
	final String? tem2 = jsonConvert.convert<String>(json['tem2']);
	if (tem2 != null) {
		weather.tem2 = tem2;
	}
	final String? win = jsonConvert.convert<String>(json['win']);
	if (win != null) {
		weather.win = win;
	}
	final String? winSpeed = jsonConvert.convert<String>(json['win_speed']);
	if (winSpeed != null) {
		weather.winSpeed = winSpeed;
	}
	final String? winMeter = jsonConvert.convert<String>(json['win_meter']);
	if (winMeter != null) {
		weather.winMeter = winMeter;
	}
	final String? humidity = jsonConvert.convert<String>(json['humidity']);
	if (humidity != null) {
		weather.humidity = humidity;
	}
	final String? visibility = jsonConvert.convert<String>(json['visibility']);
	if (visibility != null) {
		weather.visibility = visibility;
	}
	final String? pressure = jsonConvert.convert<String>(json['pressure']);
	if (pressure != null) {
		weather.pressure = pressure;
	}
	final String? air = jsonConvert.convert<String>(json['air']);
	if (air != null) {
		weather.air = air;
	}
	final String? airPm25 = jsonConvert.convert<String>(json['air_pm25']);
	if (airPm25 != null) {
		weather.airPm25 = airPm25;
	}
	final String? airLevel = jsonConvert.convert<String>(json['air_level']);
	if (airLevel != null) {
		weather.airLevel = airLevel;
	}
	final String? airTips = jsonConvert.convert<String>(json['air_tips']);
	if (airTips != null) {
		weather.airTips = airTips;
	}
	final WeatherAlarm? alarm = jsonConvert.convert<WeatherAlarm>(json['alarm']);
	if (alarm != null) {
		weather.alarm = alarm;
	}
	final String? weaDay = jsonConvert.convert<String>(json['wea_day']);
	if (weaDay != null) {
		weather.weaDay = weaDay;
	}
	final String? weaDayImg = jsonConvert.convert<String>(json['wea_day_img']);
	if (weaDayImg != null) {
		weather.weaDayImg = weaDayImg;
	}
	final String? weaNight = jsonConvert.convert<String>(json['wea_night']);
	if (weaNight != null) {
		weather.weaNight = weaNight;
	}
	final String? weaNightImg = jsonConvert.convert<String>(json['wea_night_img']);
	if (weaNightImg != null) {
		weather.weaNightImg = weaNightImg;
	}
	final String? sunrise = jsonConvert.convert<String>(json['sunrise']);
	if (sunrise != null) {
		weather.sunrise = sunrise;
	}
	final String? sunset = jsonConvert.convert<String>(json['sunset']);
	if (sunset != null) {
		weather.sunset = sunset;
	}
	final List<WeatherHours>? hours = jsonConvert.convertListNotNull<WeatherHours>(json['hours']);
	if (hours != null) {
		weather.hours = hours;
	}
	final WeatherAqi? aqi = jsonConvert.convert<WeatherAqi>(json['aqi']);
	if (aqi != null) {
		weather.aqi = aqi;
	}
	final WeatherZhishu? zhishu = jsonConvert.convert<WeatherZhishu>(json['zhishu']);
	if (zhishu != null) {
		weather.zhishu = zhishu;
	}
	final int? nums = jsonConvert.convert<int>(json['nums']);
	if (nums != null) {
		weather.nums = nums;
	}
	return weather;
}

Map<String, dynamic> $WeatherToJson(Weather entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['cityid'] = entity.cityid;
	data['date'] = entity.date;
	data['week'] = entity.week;
	data['update_time'] = entity.updateTime;
	data['city'] = entity.city;
	data['cityEn'] = entity.cityEn;
	data['country'] = entity.country;
	data['countryEn'] = entity.countryEn;
	data['wea'] = entity.wea;
	data['wea_img'] = entity.weaImg;
	data['tem'] = entity.tem;
	data['tem1'] = entity.tem1;
	data['tem2'] = entity.tem2;
	data['win'] = entity.win;
	data['win_speed'] = entity.winSpeed;
	data['win_meter'] = entity.winMeter;
	data['humidity'] = entity.humidity;
	data['visibility'] = entity.visibility;
	data['pressure'] = entity.pressure;
	data['air'] = entity.air;
	data['air_pm25'] = entity.airPm25;
	data['air_level'] = entity.airLevel;
	data['air_tips'] = entity.airTips;
	data['alarm'] = entity.alarm.toJson();
	data['wea_day'] = entity.weaDay;
	data['wea_day_img'] = entity.weaDayImg;
	data['wea_night'] = entity.weaNight;
	data['wea_night_img'] = entity.weaNightImg;
	data['sunrise'] = entity.sunrise;
	data['sunset'] = entity.sunset;
	data['hours'] =  entity.hours.map((v) => v.toJson()).toList();
	data['aqi'] = entity.aqi.toJson();
	data['zhishu'] = entity.zhishu.toJson();
	data['nums'] = entity.nums;
	return data;
}

WeatherAlarm $WeatherAlarmFromJson(Map<String, dynamic> json) {
	final WeatherAlarm weatherAlarm = WeatherAlarm();
	final String? alarmType = jsonConvert.convert<String>(json['alarm_type']);
	if (alarmType != null) {
		weatherAlarm.alarmType = alarmType;
	}
	final String? alarmLevel = jsonConvert.convert<String>(json['alarm_level']);
	if (alarmLevel != null) {
		weatherAlarm.alarmLevel = alarmLevel;
	}
	final String? alarmContent = jsonConvert.convert<String>(json['alarm_content']);
	if (alarmContent != null) {
		weatherAlarm.alarmContent = alarmContent;
	}
	return weatherAlarm;
}

Map<String, dynamic> $WeatherAlarmToJson(WeatherAlarm entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['alarm_type'] = entity.alarmType;
	data['alarm_level'] = entity.alarmLevel;
	data['alarm_content'] = entity.alarmContent;
	return data;
}

WeatherHours $WeatherHoursFromJson(Map<String, dynamic> json) {
	final WeatherHours weatherHours = WeatherHours();
	final String? hours = jsonConvert.convert<String>(json['hours']);
	if (hours != null) {
		weatherHours.hours = hours;
	}
	final String? wea = jsonConvert.convert<String>(json['wea']);
	if (wea != null) {
		weatherHours.wea = wea;
	}
	final String? weaImg = jsonConvert.convert<String>(json['wea_img']);
	if (weaImg != null) {
		weatherHours.weaImg = weaImg;
	}
	final String? tem = jsonConvert.convert<String>(json['tem']);
	if (tem != null) {
		weatherHours.tem = tem;
	}
	final String? win = jsonConvert.convert<String>(json['win']);
	if (win != null) {
		weatherHours.win = win;
	}
	final String? winSpeed = jsonConvert.convert<String>(json['win_speed']);
	if (winSpeed != null) {
		weatherHours.winSpeed = winSpeed;
	}
	final String? aqi = jsonConvert.convert<String>(json['aqi']);
	if (aqi != null) {
		weatherHours.aqi = aqi;
	}
	final String? aqinum = jsonConvert.convert<String>(json['aqinum']);
	if (aqinum != null) {
		weatherHours.aqinum = aqinum;
	}
	return weatherHours;
}

Map<String, dynamic> $WeatherHoursToJson(WeatherHours entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['hours'] = entity.hours;
	data['wea'] = entity.wea;
	data['wea_img'] = entity.weaImg;
	data['tem'] = entity.tem;
	data['win'] = entity.win;
	data['win_speed'] = entity.winSpeed;
	data['aqi'] = entity.aqi;
	data['aqinum'] = entity.aqinum;
	return data;
}

WeatherAqi $WeatherAqiFromJson(Map<String, dynamic> json) {
	final WeatherAqi weatherAqi = WeatherAqi();
	final String? updateTime = jsonConvert.convert<String>(json['update_time']);
	if (updateTime != null) {
		weatherAqi.updateTime = updateTime;
	}
	final String? air = jsonConvert.convert<String>(json['air']);
	if (air != null) {
		weatherAqi.air = air;
	}
	final String? airLevel = jsonConvert.convert<String>(json['air_level']);
	if (airLevel != null) {
		weatherAqi.airLevel = airLevel;
	}
	final String? airTips = jsonConvert.convert<String>(json['air_tips']);
	if (airTips != null) {
		weatherAqi.airTips = airTips;
	}
	final String? pm25 = jsonConvert.convert<String>(json['pm25']);
	if (pm25 != null) {
		weatherAqi.pm25 = pm25;
	}
	final String? pm25Desc = jsonConvert.convert<String>(json['pm25_desc']);
	if (pm25Desc != null) {
		weatherAqi.pm25Desc = pm25Desc;
	}
	final String? pm10 = jsonConvert.convert<String>(json['pm10']);
	if (pm10 != null) {
		weatherAqi.pm10 = pm10;
	}
	final String? pm10Desc = jsonConvert.convert<String>(json['pm10_desc']);
	if (pm10Desc != null) {
		weatherAqi.pm10Desc = pm10Desc;
	}
	final String? o3 = jsonConvert.convert<String>(json['o3']);
	if (o3 != null) {
		weatherAqi.o3 = o3;
	}
	final String? o3Desc = jsonConvert.convert<String>(json['o3_desc']);
	if (o3Desc != null) {
		weatherAqi.o3Desc = o3Desc;
	}
	final String? no2 = jsonConvert.convert<String>(json['no2']);
	if (no2 != null) {
		weatherAqi.no2 = no2;
	}
	final String? no2Desc = jsonConvert.convert<String>(json['no2_desc']);
	if (no2Desc != null) {
		weatherAqi.no2Desc = no2Desc;
	}
	final String? so2 = jsonConvert.convert<String>(json['so2']);
	if (so2 != null) {
		weatherAqi.so2 = so2;
	}
	final String? so2Desc = jsonConvert.convert<String>(json['so2_desc']);
	if (so2Desc != null) {
		weatherAqi.so2Desc = so2Desc;
	}
	final String? co = jsonConvert.convert<String>(json['co']);
	if (co != null) {
		weatherAqi.co = co;
	}
	final String? coDesc = jsonConvert.convert<String>(json['co_desc']);
	if (coDesc != null) {
		weatherAqi.coDesc = coDesc;
	}
	final String? kouzhao = jsonConvert.convert<String>(json['kouzhao']);
	if (kouzhao != null) {
		weatherAqi.kouzhao = kouzhao;
	}
	final String? yundong = jsonConvert.convert<String>(json['yundong']);
	if (yundong != null) {
		weatherAqi.yundong = yundong;
	}
	final String? waichu = jsonConvert.convert<String>(json['waichu']);
	if (waichu != null) {
		weatherAqi.waichu = waichu;
	}
	final String? kaichuang = jsonConvert.convert<String>(json['kaichuang']);
	if (kaichuang != null) {
		weatherAqi.kaichuang = kaichuang;
	}
	final String? jinghuaqi = jsonConvert.convert<String>(json['jinghuaqi']);
	if (jinghuaqi != null) {
		weatherAqi.jinghuaqi = jinghuaqi;
	}
	return weatherAqi;
}

Map<String, dynamic> $WeatherAqiToJson(WeatherAqi entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['update_time'] = entity.updateTime;
	data['air'] = entity.air;
	data['air_level'] = entity.airLevel;
	data['air_tips'] = entity.airTips;
	data['pm25'] = entity.pm25;
	data['pm25_desc'] = entity.pm25Desc;
	data['pm10'] = entity.pm10;
	data['pm10_desc'] = entity.pm10Desc;
	data['o3'] = entity.o3;
	data['o3_desc'] = entity.o3Desc;
	data['no2'] = entity.no2;
	data['no2_desc'] = entity.no2Desc;
	data['so2'] = entity.so2;
	data['so2_desc'] = entity.so2Desc;
	data['co'] = entity.co;
	data['co_desc'] = entity.coDesc;
	data['kouzhao'] = entity.kouzhao;
	data['yundong'] = entity.yundong;
	data['waichu'] = entity.waichu;
	data['kaichuang'] = entity.kaichuang;
	data['jinghuaqi'] = entity.jinghuaqi;
	return data;
}

WeatherZhishu $WeatherZhishuFromJson(Map<String, dynamic> json) {
	final WeatherZhishu weatherZhishu = WeatherZhishu();
	final WeatherZhishuChuanyi? chuanyi = jsonConvert.convert<WeatherZhishuChuanyi>(json['chuanyi']);
	if (chuanyi != null) {
		weatherZhishu.chuanyi = chuanyi;
	}
	final WeatherZhishuDaisan? daisan = jsonConvert.convert<WeatherZhishuDaisan>(json['daisan']);
	if (daisan != null) {
		weatherZhishu.daisan = daisan;
	}
	final WeatherZhishuGanmao? ganmao = jsonConvert.convert<WeatherZhishuGanmao>(json['ganmao']);
	if (ganmao != null) {
		weatherZhishu.ganmao = ganmao;
	}
	final WeatherZhishuChenlian? chenlian = jsonConvert.convert<WeatherZhishuChenlian>(json['chenlian']);
	if (chenlian != null) {
		weatherZhishu.chenlian = chenlian;
	}
	final WeatherZhishuZiwaixian? ziwaixian = jsonConvert.convert<WeatherZhishuZiwaixian>(json['ziwaixian']);
	if (ziwaixian != null) {
		weatherZhishu.ziwaixian = ziwaixian;
	}
	final WeatherZhishuLiangshai? liangshai = jsonConvert.convert<WeatherZhishuLiangshai>(json['liangshai']);
	if (liangshai != null) {
		weatherZhishu.liangshai = liangshai;
	}
	final WeatherZhishuKaiche? kaiche = jsonConvert.convert<WeatherZhishuKaiche>(json['kaiche']);
	if (kaiche != null) {
		weatherZhishu.kaiche = kaiche;
	}
	final WeatherZhishuXiche? xiche = jsonConvert.convert<WeatherZhishuXiche>(json['xiche']);
	if (xiche != null) {
		weatherZhishu.xiche = xiche;
	}
	final WeatherZhishuLvyou? lvyou = jsonConvert.convert<WeatherZhishuLvyou>(json['lvyou']);
	if (lvyou != null) {
		weatherZhishu.lvyou = lvyou;
	}
	final WeatherZhishuDiaoyu? diaoyu = jsonConvert.convert<WeatherZhishuDiaoyu>(json['diaoyu']);
	if (diaoyu != null) {
		weatherZhishu.diaoyu = diaoyu;
	}
	return weatherZhishu;
}

Map<String, dynamic> $WeatherZhishuToJson(WeatherZhishu entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['chuanyi'] = entity.chuanyi.toJson();
	data['daisan'] = entity.daisan.toJson();
	data['ganmao'] = entity.ganmao.toJson();
	data['chenlian'] = entity.chenlian.toJson();
	data['ziwaixian'] = entity.ziwaixian.toJson();
	data['liangshai'] = entity.liangshai.toJson();
	data['kaiche'] = entity.kaiche.toJson();
	data['xiche'] = entity.xiche.toJson();
	data['lvyou'] = entity.lvyou.toJson();
	data['diaoyu'] = entity.diaoyu.toJson();
	return data;
}

WeatherZhishuChuanyi $WeatherZhishuChuanyiFromJson(Map<String, dynamic> json) {
	final WeatherZhishuChuanyi weatherZhishuChuanyi = WeatherZhishuChuanyi();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuChuanyi.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuChuanyi.tips = tips;
	}
	return weatherZhishuChuanyi;
}

Map<String, dynamic> $WeatherZhishuChuanyiToJson(WeatherZhishuChuanyi entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuDaisan $WeatherZhishuDaisanFromJson(Map<String, dynamic> json) {
	final WeatherZhishuDaisan weatherZhishuDaisan = WeatherZhishuDaisan();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuDaisan.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuDaisan.tips = tips;
	}
	return weatherZhishuDaisan;
}

Map<String, dynamic> $WeatherZhishuDaisanToJson(WeatherZhishuDaisan entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuGanmao $WeatherZhishuGanmaoFromJson(Map<String, dynamic> json) {
	final WeatherZhishuGanmao weatherZhishuGanmao = WeatherZhishuGanmao();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuGanmao.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuGanmao.tips = tips;
	}
	return weatherZhishuGanmao;
}

Map<String, dynamic> $WeatherZhishuGanmaoToJson(WeatherZhishuGanmao entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuChenlian $WeatherZhishuChenlianFromJson(Map<String, dynamic> json) {
	final WeatherZhishuChenlian weatherZhishuChenlian = WeatherZhishuChenlian();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuChenlian.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuChenlian.tips = tips;
	}
	return weatherZhishuChenlian;
}

Map<String, dynamic> $WeatherZhishuChenlianToJson(WeatherZhishuChenlian entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuZiwaixian $WeatherZhishuZiwaixianFromJson(Map<String, dynamic> json) {
	final WeatherZhishuZiwaixian weatherZhishuZiwaixian = WeatherZhishuZiwaixian();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuZiwaixian.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuZiwaixian.tips = tips;
	}
	return weatherZhishuZiwaixian;
}

Map<String, dynamic> $WeatherZhishuZiwaixianToJson(WeatherZhishuZiwaixian entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuLiangshai $WeatherZhishuLiangshaiFromJson(Map<String, dynamic> json) {
	final WeatherZhishuLiangshai weatherZhishuLiangshai = WeatherZhishuLiangshai();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuLiangshai.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuLiangshai.tips = tips;
	}
	return weatherZhishuLiangshai;
}

Map<String, dynamic> $WeatherZhishuLiangshaiToJson(WeatherZhishuLiangshai entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuKaiche $WeatherZhishuKaicheFromJson(Map<String, dynamic> json) {
	final WeatherZhishuKaiche weatherZhishuKaiche = WeatherZhishuKaiche();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuKaiche.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuKaiche.tips = tips;
	}
	return weatherZhishuKaiche;
}

Map<String, dynamic> $WeatherZhishuKaicheToJson(WeatherZhishuKaiche entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuXiche $WeatherZhishuXicheFromJson(Map<String, dynamic> json) {
	final WeatherZhishuXiche weatherZhishuXiche = WeatherZhishuXiche();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuXiche.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuXiche.tips = tips;
	}
	return weatherZhishuXiche;
}

Map<String, dynamic> $WeatherZhishuXicheToJson(WeatherZhishuXiche entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuLvyou $WeatherZhishuLvyouFromJson(Map<String, dynamic> json) {
	final WeatherZhishuLvyou weatherZhishuLvyou = WeatherZhishuLvyou();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuLvyou.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuLvyou.tips = tips;
	}
	return weatherZhishuLvyou;
}

Map<String, dynamic> $WeatherZhishuLvyouToJson(WeatherZhishuLvyou entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}

WeatherZhishuDiaoyu $WeatherZhishuDiaoyuFromJson(Map<String, dynamic> json) {
	final WeatherZhishuDiaoyu weatherZhishuDiaoyu = WeatherZhishuDiaoyu();
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherZhishuDiaoyu.level = level;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		weatherZhishuDiaoyu.tips = tips;
	}
	return weatherZhishuDiaoyu;
}

Map<String, dynamic> $WeatherZhishuDiaoyuToJson(WeatherZhishuDiaoyu entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['level'] = entity.level;
	data['tips'] = entity.tips;
	return data;
}