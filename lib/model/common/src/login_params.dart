import 'package:accumulation/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:accumulation/model/model_paths.dart';

@JsonSerializable()
class LoginParams {

	late String username;
	late String password;
  
  LoginParams();

  factory LoginParams.fromJson(Map<String, dynamic> json) => $LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => $LoginParamsToJson(this);

  LoginParams copyWith({String? username, String? password}) {
      return LoginParams()..username= username ?? this.username
			..password= password ?? this.password;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}