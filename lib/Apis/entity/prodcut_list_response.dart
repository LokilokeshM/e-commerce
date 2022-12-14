// To parse this JSON data, do
//
//     final productListResponse = productListResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductListResponse productListResponseFromJson(String str) =>
    ProductListResponse.fromJson(json.decode(str));

String productListResponseToJson(ProductListResponse data) =>
    json.encode(data.toJson());

class ProductListResponse {
  ProductListResponse({
    required this.products,
  });

  List<Product>? products;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      ProductListResponse(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.bodyHtml,
    required this.vendor,
    required this.productType,
    required this.createdAt,
    required this.handle,
    required this.updatedAt,
    required this.publishedAt,
    required this.templateSuffix,
    required this.publishedScope,
    required this.tags,
    required this.adminGraphqlApiId,
    required this.variants,
    required this.options,
    required this.images,
    required this.image,
  });

  int? id;
  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  DateTime? createdAt;
  String? handle;
  DateTime? updatedAt;
  DateTime? publishedAt;
  dynamic? templateSuffix;
  String? publishedScope;
  String? tags;
  String? adminGraphqlApiId;
  List<Variant>? variants;
  List<Option>? options;
  List<Image>? images;
  Image? image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        bodyHtml: json["body_html"] == null ? null : json["body_html"],
        vendor: json["vendor"] == null ? null : json["vendor"],
        productType: json["product_type"] == null ? null : json["product_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        handle: json["handle"] == null ? null : json["handle"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        templateSuffix: json["template_suffix"],
        publishedScope:
            json["published_scope"] == null ? null : json["published_scope"],
        tags: json["tags"] == null ? null : json["tags"],
        adminGraphqlApiId: json["admin_graphql_api_id"] == null
            ? null
            : json["admin_graphql_api_id"],
        variants: json["variants"] == null
            ? null
            : List<Variant>.from(
                json["variants"].map((x) => Variant.fromJson(x))),
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body_html": bodyHtml == null ? null : bodyHtml,
        "vendor": vendor == null ? null : vendor,
        "product_type": productType == null ? null : productType,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "handle": handle == null ? null : handle,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "published_at":
            publishedAt == null ? null : publishedAt!.toIso8601String(),
        "template_suffix": templateSuffix,
        "published_scope": publishedScope == null ? null : publishedScope,
        "tags": tags == null ? null : tags,
        "admin_graphql_api_id":
            adminGraphqlApiId == null ? null : adminGraphqlApiId,
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "image": image == null ? null : image!.toJson(),
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
  dynamic? alt;
  int? width;
  int? height;
  String? src;
  List<int>? variantIds;
  String? adminGraphqlApiId;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        position: json["position"] == null ? null : json["position"],
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
            : List<int>.from(json["variant_ids"].map((x) => x)),
        adminGraphqlApiId: json["admin_graphql_api_id"] == null
            ? null
            : json["admin_graphql_api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_id": productId == null ? null : productId,
        "position": position == null ? null : position,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "alt": alt,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "src": src == null ? null : src,
        "variant_ids": variantIds == null
            ? null
            : List<dynamic>.from(variantIds!.map((x) => x)),
        "admin_graphql_api_id":
            adminGraphqlApiId == null ? null : adminGraphqlApiId,
      };
}

class Option {
  Option({
    required this.id,
    required this.productId,
    required this.name,
    required this.position,
    required this.values,
  });

  int? id;
  int? productId;
  String? name;
  int? position;
  List<String>? values;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        name: json["name"] == null ? null : json["name"],
        position: json["position"] == null ? null : json["position"],
        values: json["values"] == null
            ? null
            : List<String>.from(json["values"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_id": productId == null ? null : productId,
        "name": name == null ? null : name,
        "position": position == null ? null : position,
        "values":
            values == null ? null : List<dynamic>.from(values!.map((x) => x)),
      };
}

class Variant {
  Variant({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.sku,
    required this.position,
    required this.inventoryPolicy,
    required this.compareAtPrice,
    required this.fulfillmentService,
    required this.inventoryManagement,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.createdAt,
    required this.updatedAt,
    required this.taxable,
    required this.barcode,
    required this.grams,
    required this.imageId,
    required this.weight,
    required this.weightUnit,
    required this.inventoryItemId,
    required this.inventoryQuantity,
    required this.oldInventoryQuantity,
    required this.presentmentPrices,
    required this.requiresShipping,
    required this.adminGraphqlApiId,
  });

  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? inventoryPolicy;
  dynamic? compareAtPrice;
  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  dynamic option2;
  dynamic option3;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? taxable;
  String? barcode;
  int? grams;
  int? imageId;
  double? weight;
  String? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  List<PresentmentPrice>? presentmentPrices;
  bool? requiresShipping;
  String? adminGraphqlApiId;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"],
        sku: json["sku"] == null ? null : json["sku"],
        position: json["position"] == null ? null : json["position"],
        inventoryPolicy:
            json["inventory_policy"] == null ? null : json["inventory_policy"],
        compareAtPrice: json["compare_at_price"],
        fulfillmentService: json["fulfillment_service"] == null
            ? null
            : json["fulfillment_service"],
        inventoryManagement: json["inventory_management"] == null
            ? null
            : json["inventory_management"],
        option1: json["option1"] == null ? null : json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        taxable: json["taxable"] == null ? null : json["taxable"],
        barcode: json["barcode"] == null ? null : json["barcode"],
        grams: json["grams"] == null ? null : json["grams"],
        imageId: json["image_id"] == null ? null : json["image_id"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        weightUnit: json["weight_unit"] == null ? null : json["weight_unit"],
        inventoryItemId: json["inventory_item_id"] == null
            ? null
            : json["inventory_item_id"],
        inventoryQuantity: json["inventory_quantity"] == null
            ? null
            : json["inventory_quantity"],
        oldInventoryQuantity: json["old_inventory_quantity"] == null
            ? null
            : json["old_inventory_quantity"],
        presentmentPrices: json["presentment_prices"] == null
            ? null
            : List<PresentmentPrice>.from(json["presentment_prices"]
                .map((x) => PresentmentPrice.fromJson(x))),
        requiresShipping: json["requires_shipping"] == null
            ? null
            : json["requires_shipping"],
        adminGraphqlApiId: json["admin_graphql_api_id"] == null
            ? null
            : json["admin_graphql_api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_id": productId == null ? null : productId,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "sku": sku == null ? null : sku,
        "position": position == null ? null : position,
        "inventory_policy": inventoryPolicy == null ? null : inventoryPolicy,
        "compare_at_price": compareAtPrice,
        "fulfillment_service":
            fulfillmentService == null ? null : fulfillmentService,
        "inventory_management":
            inventoryManagement == null ? null : inventoryManagement,
        "option1": option1 == null ? null : option1,
        "option2": option2,
        "option3": option3,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "taxable": taxable == null ? null : taxable,
        "barcode": barcode == null ? null : barcode,
        "grams": grams == null ? null : grams,
        "image_id": imageId == null ? null : imageId,
        "weight": weight == null ? null : weight,
        "weight_unit": weightUnit == null ? null : weightUnit,
        "inventory_item_id": inventoryItemId == null ? null : inventoryItemId,
        "inventory_quantity":
            inventoryQuantity == null ? null : inventoryQuantity,
        "old_inventory_quantity":
            oldInventoryQuantity == null ? null : oldInventoryQuantity,
        "presentment_prices": presentmentPrices == null
            ? null
            : List<dynamic>.from(presentmentPrices!.map((x) => x.toJson())),
        "requires_shipping": requiresShipping == null ? null : requiresShipping,
        "admin_graphql_api_id":
            adminGraphqlApiId == null ? null : adminGraphqlApiId,
      };
}

class PresentmentPrice {
  PresentmentPrice({
    required this.price,
    required this.compareAtPrice,
  });

  Price? price;
  dynamic compareAtPrice;

  factory PresentmentPrice.fromJson(Map<String, dynamic> json) =>
      PresentmentPrice(
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        compareAtPrice: json["compare_at_price"],
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? null : price!.toJson(),
        "compare_at_price": compareAtPrice,
      };
}

class Price {
  Price({
    required this.amount,
    required this.currencyCode,
  });

  String amount;
  String currencyCode;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"] == null ? null : json["amount"],
        currencyCode:
            json["currency_code"] == null ? null : json["currency_code"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "currency_code": currencyCode == null ? null : currencyCode,
      };
}
