// To parse this JSON data, do
//
//     final productRequest = productRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductRequest productRequestFromJson(String str) =>
    ProductRequest.fromJson(json.decode(str));

String productRequestToJson(ProductRequest data) => json.encode(data.toJson());

class ProductRequest {
  ProductRequest({
    required this.product,
  });

  Product? product;

  factory ProductRequest.fromJson(Map<String, dynamic> json) => ProductRequest(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product == null ? null : product!.toJson(),
      };
}

class Product {
  Product({
    required this.title,
    required this.bodyHtml,
    required this.vendor,
    required this.productType,
    required this.tags,
  });

  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  List<String>? tags;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"] == null ? null : json["title"],
        bodyHtml: json["body_html"] == null ? null : json["body_html"],
        vendor: json["vendor"] == null ? null : json["vendor"],
        productType: json["product_type"] == null ? null : json["product_type"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "body_html": bodyHtml == null ? null : bodyHtml,
        "vendor": vendor == null ? null : vendor,
        "product_type": productType == null ? null : productType,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
      };
}
