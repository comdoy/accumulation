import 'package:accumulation/generated/json/base/json_convert_content.dart';
import 'package:accumulation/model/api_response/paging_data.dart';

PagingData<T> $PagingDataFromJson<T>(Map<String, dynamic> json) {
	final PagingData<T> pagingData = PagingData<T>();
	final List<T>? records = jsonConvert.convertListNotNull<T>(json['records']);
	if (records != null) {
		pagingData.records = records;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		pagingData.total = total;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		pagingData.size = size;
	}
	final int? current = jsonConvert.convert<int>(json['current']);
	if (current != null) {
		pagingData.current = current;
	}
	final int? pages = jsonConvert.convert<int>(json['pages']);
	if (pages != null) {
		pagingData.pages = pages;
	}
	return pagingData;
}

Map<String, dynamic> $PagingDataToJson(PagingData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['records'] =  entity.records;
	data['total'] = entity.total;
	data['size'] = entity.size;
	data['current'] = entity.current;
	data['pages'] = entity.pages;
	return data;
}