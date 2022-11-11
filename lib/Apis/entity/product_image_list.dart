// To parse this JSON data, do
//
//     final productImageList = productImageListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductImageList productImageListFromJson(String str) =>
    ProductImageList.fromJson(json.decode(str));

String productImageListToJson(ProductImageList data) =>
    json.encode(data.toJson());

class ProductImageList {
  ProductImageList({
    required this.message,
    required this.payload,
    required this.timestamp,
  });

  Message message;
  Payload payload;
  DateTime timestamp;

  factory ProductImageList.fromJson(Map<String, dynamic> json) =>
      ProductImageList(
        message: Message.fromJson(json["message"]),
        payload: Payload.fromJson(json["payload"]),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message.toJson(),
        "payload": payload == null ? null : payload.toJson(),
        "timestamp": timestamp == null ? null : timestamp.toIso8601String(),
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
        code: json["code"] ?? null,
        description: json["description"] ?? null,
        detailDescription: json["detailDescription"] ?? null,
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
    required this.images,
  });

  List<Image>? images;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    required this.id,
    required this.productId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.alt,
    required this.width,
    required this.height,
    required this.src,
    required this.variantIds,
    required this.adminGraphqlApiId,
  });

  int? id;
  int? productId;
  int? position;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic alt;
  int? width;
  int? height;
  String? src;
  List<dynamic>? variantIds;
  String? adminGraphqlApiId;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] ?? null,
        productId: json["product_id"] ?? null,
        position: json["position"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        alt: json["alt"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        src: json["src"] == null ? null : json["src"],
        variantIds: json["variant_ids"] == null
            ? null
            : List<dynamic>.from(json["variant_ids"].map((x) => x)),
        adminGraphqlApiId: json["admin_graphql_api_id"] == null
            ? null
            : json["admin_graphql_api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_id": productId ?? null,
        "position": position ?? null,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "alt": alt,
        "width": width == null ? null : width,
        "height": height ?? null,
        "src": src ?? null,
        "variant_ids": variantIds == null
            ? null
            : List<dynamic>.from(variantIds!.map((x) => x)),
        "admin_graphql_api_id": adminGraphqlApiId ?? null,
      };
}
