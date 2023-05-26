import 'package:accumulation/generated/json/base/json_convert_content.dart';
import 'package:accumulation/model/common/src/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userEntity.username = username;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		userEntity.password = password;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		userEntity.nickname = nickname;
	}
	final int? age = jsonConvert.convert<int>(json['age']);
	if (age != null) {
		userEntity.age = age;
	}
	final String? sex = jsonConvert.convert<String>(json['sex']);
	if (sex != null) {
		userEntity.sex = sex;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		userEntity.address = address;
	}
	final String? identity = jsonConvert.convert<String>(json['identity']);
	if (identity != null) {
		userEntity.identity = identity;
	}
	final String? educational = jsonConvert.convert<String>(json['educational']);
	if (educational != null) {
		userEntity.educational = educational;
	}
	final String? images = jsonConvert.convert<String>(json['images']);
	if (images != null) {
		userEntity.images = images;
	}
	final dynamic advantageName = jsonConvert.convert<dynamic>(json['advantage_name']);
	if (advantageName != null) {
		userEntity.advantageName = advantageName;
	}
	final dynamic advantageContent = jsonConvert.convert<dynamic>(json['advantage_content']);
	if (advantageContent != null) {
		userEntity.advantageContent = advantageContent;
	}
	final dynamic recruiterId = jsonConvert.convert<dynamic>(json['recruiter_id']);
	if (recruiterId != null) {
		userEntity.recruiterId = recruiterId;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['password'] = entity.password;
	data['nickname'] = entity.nickname;
	data['age'] = entity.age;
	data['sex'] = entity.sex;
	data['address'] = entity.address;
	data['identity'] = entity.identity;
	data['educational'] = entity.educational;
	data['images'] = entity.images;
	data['advantage_name'] = entity.advantageName;
	data['advantage_content'] = entity.advantageContent;
	data['recruiter_id'] = entity.recruiterId;
	return data;
}