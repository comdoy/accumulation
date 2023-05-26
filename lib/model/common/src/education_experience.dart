import 'package:accumulation/generated/json/base/json_field.dart';
import 'package:accumulation/generated/json/education_experience.g.dart';
import 'dart:convert';

@JsonSerializable()
class EducationExperience {

	late int id;
	@JSONField(name: "graduated_school")
	late String graduatedSchool;
	late String profession;
	late String period;
	late String whether;
	late String education;
	late String experience;
	@JSONField(name: "user_id")
	late int userId;
  
  EducationExperience();

  factory EducationExperience.fromJson(Map<String, dynamic> json) => $EducationExperienceFromJson(json);

  Map<String, dynamic> toJson() => $EducationExperienceToJson(this);

  EducationExperience copyWith({int? id, String? graduatedSchool, String? profession, String? period, String? whether, String? education, String? experience, int? userId}) {
      return EducationExperience()..id= id ?? this.id
			..graduatedSchool= graduatedSchool ?? this.graduatedSchool
			..profession= profession ?? this.profession
			..period= period ?? this.period
			..whether= whether ?? this.whether
			..education= education ?? this.education
			..experience= experience ?? this.experience
			..userId= userId ?? this.userId;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}