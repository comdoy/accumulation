import 'package:accumulation/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:accumulation/generated/json/press_modell.g.dart';

@JsonSerializable()
class PressModel {

	late int id;
	@JSONField(name: "user_id")
	late int userId;
	@JSONField(name: "type_id")
	late int typeId;
	@JSONField(name: "user_image")
	late String userImage;
	@JSONField(name: "press_name")
	late String pressName;
	@JSONField(name: "press_image")
	late String pressImage;
	@JSONField(name: "press_title")
	late String pressTitle;
	@JSONField(name: "press_text")
	late String pressText;
	@JSONField(name: "press_time")
	late String pressTime;
  
  PressModel();

  factory PressModel.fromJson(Map<String, dynamic> json) => $PressModelFromJson(json);

  Map<String, dynamic> toJson() => $PressModelToJson(this);

  PressModel copyWith({int? id, int? userId, int? typeId, String? userImage, String? pressName, String? pressImage, String? pressTitle, String? pressText, String? pressTime}) {
      return PressModel()..id= id ?? this.id
			..userId= userId ?? this.userId
			..typeId= typeId ?? this.typeId
			..userImage= userImage ?? this.userImage
			..pressName= pressName ?? this.pressName
			..pressImage= pressImage ?? this.pressImage
			..pressTitle= pressTitle ?? this.pressTitle
			..pressText= pressText ?? this.pressText
			..pressTime= pressTime ?? this.pressTime;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}