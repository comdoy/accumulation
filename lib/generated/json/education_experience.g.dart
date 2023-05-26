import 'package:accumulation/generated/json/base/json_convert_content.dart';
import 'package:accumulation/model/common/src/education_experience.dart';

EducationExperience $EducationExperienceFromJson(Map<String, dynamic> json) {
	final EducationExperience educationExperience = EducationExperience();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		educationExperience.id = id;
	}
	final String? graduatedSchool = jsonConvert.convert<String>(json['graduated_school']);
	if (graduatedSchool != null) {
		educationExperience.graduatedSchool = graduatedSchool;
	}
	final String? profession = jsonConvert.convert<String>(json['profession']);
	if (profession != null) {
		educationExperience.profession = profession;
	}
	final String? period = jsonConvert.convert<String>(json['period']);
	if (period != null) {
		educationExperience.period = period;
	}
	final String? whether = jsonConvert.convert<String>(json['whether']);
	if (whether != null) {
		educationExperience.whether = whether;
	}
	final String? education = jsonConvert.convert<String>(json['education']);
	if (education != null) {
		educationExperience.education = education;
	}
	final String? experience = jsonConvert.convert<String>(json['experience']);
	if (experience != null) {
		educationExperience.experience = experience;
	}
	final int? userId = jsonConvert.convert<int>(json['user_id']);
	if (userId != null) {
		educationExperience.userId = userId;
	}
	return educationExperience;
}

Map<String, dynamic> $EducationExperienceToJson(EducationExperience entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['graduated_school'] = entity.graduatedSchool;
	data['profession'] = entity.profession;
	data['period'] = entity.period;
	data['whether'] = entity.whether;
	data['education'] = entity.education;
	data['experience'] = entity.experience;
	data['user_id'] = entity.userId;
	return data;
}