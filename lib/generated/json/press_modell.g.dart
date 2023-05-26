import 'package:accumulation/generated/json/base/json_convert_content.dart';
import 'package:accumulation/model/common/src/press_modell.dart';

PressModel $PressModelFromJson(Map<String, dynamic> json) {
	final PressModel pressModel = PressModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		pressModel.id = id;
	}
	final int? userId = jsonConvert.convert<int>(json['user_id']);
	if (userId != null) {
		pressModel.userId = userId;
	}
	final int? typeId = jsonConvert.convert<int>(json['type_id']);
	if (typeId != null) {
		pressModel.typeId = typeId;
	}
	final String? userImage = jsonConvert.convert<String>(json['user_image']);
	if (userImage != null) {
		pressModel.userImage = userImage;
	}
	final String? pressName = jsonConvert.convert<String>(json['press_name']);
	if (pressName != null) {
		pressModel.pressName = pressName;
	}
	final String? pressImage = jsonConvert.convert<String>(json['press_image']);
	if (pressImage != null) {
		pressModel.pressImage = pressImage;
	}
	final String? pressTitle = jsonConvert.convert<String>(json['press_title']);
	if (pressTitle != null) {
		pressModel.pressTitle = pressTitle;
	}
	final String? pressText = jsonConvert.convert<String>(json['press_text']);
	if (pressText != null) {
		pressModel.pressText = pressText;
	}
	final String? pressTime = jsonConvert.convert<String>(json['press_time']);
	if (pressTime != null) {
		pressModel.pressTime = pressTime;
	}
	return pressModel;
}

Map<String, dynamic> $PressModelToJson(PressModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['user_id'] = entity.userId;
	data['type_id'] = entity.typeId;
	data['user_image'] = entity.userImage;
	data['press_name'] = entity.pressName;
	data['press_image'] = entity.pressImage;
	data['press_title'] = entity.pressTitle;
	data['press_text'] = entity.pressText;
	data['press_time'] = entity.pressTime;
	return data;
}