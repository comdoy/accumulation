
import 'dart:convert';

import 'api_response.g.dart';

class ApiResponse<T> {

	late int code;
	late String msg;
	late T data;
  
  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) => $ApiResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
