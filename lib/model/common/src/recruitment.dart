import 'package:accumulation/generated/json/base/json_field.dart';
import 'package:accumulation/generated/json/recruitment.g.dart';
import 'dart:convert';

@JsonSerializable()
class Recruitment {
	late int id;
	late String title;
	late String time;
	late String deadline;
	late String route;
	late String city;
	late String people;
	late String image;
	late String company;
	late String salary;
	late String boon;
	@JSONField(name: "recruiter_id")
	late int recruiterId;
	late String position;

	Recruitment();

	factory Recruitment.fromJson(Map<String, dynamic> json) => $RecruitmentFromJson(json);

	Map<String, dynamic> toJson() => $RecruitmentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}