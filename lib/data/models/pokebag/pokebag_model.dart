// To parse this JSON data, do
//
//     final pokeBagModel = pokeBagModelFromJson(jsonString);

import 'dart:convert';

List<PokeBagModel> pokeBagModelFromJson(String str) => List<PokeBagModel>.from(
    json.decode(str).map((x) => PokeBagModel.fromJson(x)));

String pokeBagModelToJson(List<PokeBagModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokeBagModel {
  String? name;
  String? realName;
  String? id;

  PokeBagModel({
    this.name,
    this.realName,
    this.id,
  });

  factory PokeBagModel.fromJson(Map<String, dynamic> json) => PokeBagModel(
        name: json["name"],
        realName: json["real_name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "real_name": realName,
        "id": id,
      };
}
