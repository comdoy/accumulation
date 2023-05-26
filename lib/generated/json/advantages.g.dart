import 'package:accumulation/generated/json/base/json_convert_content.dart';
import 'package:accumulation/model/common/src/advantages.dart';

Advantages $AdvantagesFromJson(Map<String, dynamic> json) {
	final Advantages advantages = Advantages();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		advantages.id = id;
	}
	final String? advantageContents = jsonConvert.convert<String>(json['advantage_contents']);
	if (advantageContents != null) {
		advantages.advantageContents = advantageContents;
	}
	final int? userId = jsonConvert.convert<int>(json['user_id']);
	if (userId != null) {
		advantages.userId = userId;
	}
	return advantages;
}

Map<String, dynamic> $AdvantagesToJson(Advantages entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['advantage_contents'] = entity.advantageContents;
	data['user_id'] = entity.userId;
	return data;
}