import 'package:meta/meta.dart';
import 'dart:convert';

CountEntity? countEntityFromJson(String str) =>
    CountEntity.fromJson(json.decode(str));

String countEntityToJson(CountEntity? data) => json.encode(data!.toJson());

class CountEntity {
  CountEntity({
    required this.count,
  });

  final int? count;

  factory CountEntity.fromJson(Map<String, dynamic> json) => CountEntity(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}
