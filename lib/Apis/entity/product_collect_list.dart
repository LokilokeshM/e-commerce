// To parse this JSON data, do
//
//     final productCollectsList = productCollectsListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductCollectsList productCollectsListFromJson(String str) =>
    ProductCollectsList.fromJson(json.decode(str));

String productCollectsListToJson(ProductCollectsList data) =>
    json.encode(data.toJson());

class ProductCollectsList {
  ProductCollectsList({
    required this.message,
    required this.payload,
    required this.timestamp,
  });

  Message? message;
  Payload? payload;
  DateTime? timestamp;

  factory ProductCollectsList.fromJson(Map<String, dynamic> json) =>
      ProductCollectsList(
        message: Message.fromJson(json["message"]),
        payload: Payload.fromJson(json["payload"]),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message!.toJson(),
        "payload": payload == null ? null : payload!.toJson(),
        "timestamp": timestamp == null ? null : timestamp!.toIso8601String(),
      };
}

class Message {
  Message({
    required this.code,
    required this.description,
    required this.detailDescription,
  });

  int code;
  String description;
  String detailDescription;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        code: json["code"] == null ? null : json["code"],
        description: json["description"] == null ? null : json["description"],
        detailDescription: json["detailDescription"] == null
            ? null
            : json["detailDescription"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "description": description == null ? null : description,
        "detailDescription":
            detailDescription == null ? null : detailDescription,
      };
}

class Payload {
  Payload({
    required this.collects,
  });

  List<Collect>? collects;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        collects: json["collects"] == null
            ? null
            : List<Collect>.from(
                json["collects"].map((x) => Collect.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "collects": collects == null
            ? null
            : List<dynamic>.from(collects!.map((x) => x.toJson())),
      };
}

class Collect {
  Collect({
    required this.id,
    required this.collectionId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.position,
    required this.sortValue,
  });

  int? id;
  int? collectionId;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? position;
  String? sortValue;

  factory Collect.fromJson(Map<String, dynamic> json) => Collect(
        id: json["id"] == null ? null : json["id"],
        collectionId:
            json["collection_id"] == null ? null : json["collection_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        position: json["position"] == null ? null : json["position"],
        sortValue: json["sort_value"] == null ? null : json["sort_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "collection_id": collectionId == null ? null : collectionId,
        "product_id": productId == null ? null : productId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "position": position == null ? null : position,
        "sort_value": sortValue == null ? null : sortValue,
      };
}
