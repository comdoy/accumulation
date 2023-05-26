
import 'package:accumulation/model/api_response/paging_data.g.dart';
import 'dart:convert';

class PagingData<T> {

	late List<T> records;
	late int total;
	late int size;
	late int current;
	late int pages;
  
  PagingData();

  factory PagingData.fromJson(Map<String, dynamic> json) => $PagingDataFromJson<T>(json);

  Map<String, dynamic> toJson() => $PagingDataToJson(this);
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}