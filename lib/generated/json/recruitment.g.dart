import 'package:accumulation/generated/json/base/json_convert_content.dart';
import 'package:accumulation/model/common/src/recruitment.dart';

Recruitment $RecruitmentFromJson(Map<String, dynamic> json) {
	final Recruitment recruitment = Recruitment();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		recruitment.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		recruitment.title = title;
	}
	final String? time = jsonConvert.convert<String>(json['time']);
	if (time != null) {
		recruitment.time = time;
	}
	final String? deadline = jsonConvert.convert<String>(json['deadline']);
	if (deadline != null) {
		recruitment.deadline = deadline;
	}
	final String? route = jsonConvert.convert<String>(json['route']);
	if (route != null) {
		recruitment.route = route;
	}
	final String? city = jsonConvert.convert<String>(json['city']);
	if (city != null) {
		recruitment.city = city;
	}
	final String? people = jsonConvert.convert<String>(json['people']);
	if (people != null) {
		recruitment.people = people;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		recruitment.image = image;
	}
	final String? company = jsonConvert.convert<String>(json['company']);
	if (company != null) {
		recruitment.company = company;
	}
	final String? salary = jsonConvert.convert<String>(json['salary']);
	if (salary != null) {
		recruitment.salary = salary;
	}
	final String? boon = jsonConvert.convert<String>(json['boon']);
	if (boon != null) {
		recruitment.boon = boon;
	}
	final int? recruiterId = jsonConvert.convert<int>(json['recruiter_id']);
	if (recruiterId != null) {
		recruitment.recruiterId = recruiterId;
	}
	final String? position = jsonConvert.convert<String>(json['position']);
	if (position != null) {
		recruitment.position = position;
	}
	return recruitment;
}

Map<String, dynamic> $RecruitmentToJson(Recruitment entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['time'] = entity.time;
	data['deadline'] = entity.deadline;
	data['route'] = entity.route;
	data['city'] = entity.city;
	data['people'] = entity.people;
	data['image'] = entity.image;
	data['company'] = entity.company;
	data['salary'] = entity.salary;
	data['boon'] = entity.boon;
	data['recruiter_id'] = entity.recruiterId;
	data['position'] = entity.position;
	return data;
}