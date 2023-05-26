import 'package:accumulation/generated/json/base/json_convert_content.dart';
import 'package:accumulation/model/common/src/login_params.dart';
import 'package:accumulation/model/model_paths.dart';


LoginParams $LoginParamsFromJson(Map<String, dynamic> json) {
	final LoginParams loginParams = LoginParams();
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		loginParams.username = username;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		loginParams.password = password;
	}
	return loginParams;
}

Map<String, dynamic> $LoginParamsToJson(LoginParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['username'] = entity.username;
	data['password'] = entity.password;
	return data;
}