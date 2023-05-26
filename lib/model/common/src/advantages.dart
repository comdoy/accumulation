import 'package:accumulation/generated/json/base/json_field.dart';
import 'package:accumulation/generated/json/advantages.g.dart';
import 'dart:convert';

@JsonSerializable()
class Advantages {
  late int id;
  @JSONField(name: "advantage_contents")
  late String advantageContents;
  @JSONField(name: "user_id")
  late int userId;

  Advantages();

  factory Advantages.fromJson(Map<String, dynamic> json) =>
      $AdvantagesFromJson(json);

  Map<String, dynamic> toJson() => $AdvantagesToJson(this);

  Advantages copyWith(
      {int? id,
      String? advantageNames,
      String? advantageContents,
      int? userId,
      String? responseModule}) {
    return Advantages()
      ..id = id ?? this.id
      ..advantageContents = advantageContents ?? this.advantageContents
      ..userId = userId ?? this.userId;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
