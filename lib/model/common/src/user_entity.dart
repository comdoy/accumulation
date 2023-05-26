import 'package:accumulation/generated/json/base/json_field.dart';
import 'package:accumulation/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {
	late int id;
	late String username;
	late String password;
	late String nickname;
	late int age;
	late String sex;
	late String address;
	late String identity;
	late String educational;
	late String images;
	@JSONField(name: "advantage_name")
	dynamic advantageName;
	@JSONField(name: "advantage_content")
	dynamic advantageContent;
	@JSONField(name: "recruiter_id")
	dynamic recruiterId;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}