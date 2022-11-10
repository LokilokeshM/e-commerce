// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.message,
    required this.payload,
    required this.timestamp,
  });

  Message message;
  Payload payload;
  DateTime timestamp;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        message: Message.fromJson(json["message"]),
        payload: Payload.fromJson(json["payload"]),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "payload": payload.toJson(),
        "timestamp": timestamp.toIso8601String(),
      };
}

class Message {
  Message({
    required this.code,
    required this.description,
    required this.detailDescription,
  });

  int? code;
  String? description;
  String? detailDescription;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        code: json["code"] ?? null,
        description: json["description"] ?? null,
        detailDescription: json["detailDescription"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "code": code ?? null,
        "description": description ?? null,
        "detailDescription": detailDescription ?? null,
      };
}

class Payload {
  Payload({
    required this.products,
  });

  List<Product>? products;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        products: json["products"] == null
            ? []
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
    required this.vendor,
    required this.productType,
    required this.createdAt,
    required this.handle,
    required this.updatedAt,
    required this.publishedAt,
    required this.templateSuffix,
    required this.status,
    required this.publishedScope,
    required this.tags,
    required this.adminGraphqlApiId,
    required this.variants,
    required this.options,
    required this.image,
    required this.bodyHtml,
  });

  int? id;
  String? title;
  Vendor? vendor;
  ProductType? productType;
  DateTime? createdAt;
  String? handle;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? templateSuffix;
  Status? status;
  PublishedScope? publishedScope;
  Tags? tags;
  String? adminGraphqlApiId;
  List<Variant>? variants;
  List<Option>? options;
  dynamic image;
  String? bodyHtml;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? null,
        title: json["title"] ?? null,
        vendor:
            json["vendor"] == null ? null : vendorValues.map[json["vendor"]],
        productType: json["product_type"] == null
            ? null
            : productTypeValues.map[json["product_type"]],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        handle: json["handle"] ?? null,
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        templateSuffix: json["template_suffix"] ?? null,
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
        publishedScope: json["published_scope"] == null
            ? null
            : publishedScopeValues.map[json["published_scope"]],
        tags: json["tags"] == null ? null : tagsValues.map[json["tags"]],
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? null,
        variants: json["variants"] == null
            ? null
            : List<Variant>.from(
                json["variants"].map((x) => Variant.fromJson(x))),
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        image: json["image"],
        bodyHtml: json["body_html"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "vendor": vendor == null ? null : vendorValues.reverse[vendor],
        "product_type":
            productType == null ? null : productTypeValues.reverse[productType],
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "handle": handle == null ? null : handle,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "published_at":
            publishedAt == null ? null : publishedAt!.toIso8601String(),
        "template_suffix": templateSuffix == null ? null : templateSuffix,
        "status": status == null ? null : statusValues.reverse[status],
        "published_scope": publishedScope == null
            ? null
            : publishedScopeValues.reverse[publishedScope],
        "tags": tags == null ? null : tagsValues.reverse[tags],
        "admin_graphql_api_id":
            adminGraphqlApiId == null ? null : adminGraphqlApiId,
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "image": image,
        "body_html": bodyHtml == null ? null : bodyHtml,
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
  Name? name;
  int? position;
  List<Option1>? values;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        position: json["position"] == null ? null : json["position"],
        values: json["values"] == null
            ? null
            : List<Option1>.from(
                json["values"].map((x) => option1Values.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_id": productId == null ? null : productId,
        "name": name == null ? null : nameValues.reverse[name],
        "position": position == null ? null : position,
        "values": values == null
            ? null
            : List<dynamic>.from(values!.map((x) => option1Values.reverse[x])),
      };
}

enum Name { TITLE }

final nameValues = EnumValues({"Title": Name.TITLE});

enum Option1 { DEFAULT_TITLE }

final option1Values = EnumValues({"Default Title": Option1.DEFAULT_TITLE});

enum ProductType { SNOWBOARD, EMPTY }

final productTypeValues =
    EnumValues({"": ProductType.EMPTY, "Snowboard": ProductType.SNOWBOARD});

enum PublishedScope { WEB }

final publishedScopeValues = EnumValues({"web": PublishedScope.WEB});

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

enum Tags { BARNES_NOBLE_BIG_AIR_JOHN_S_FAV, EMPTY }

final tagsValues = EnumValues({
  "Barnes & Noble, Big Air, John's Fav": Tags.BARNES_NOBLE_BIG_AIR_JOHN_S_FAV,
  "": Tags.EMPTY
});

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
    required this.requiresShipping,
    required this.adminGraphqlApiId,
  });

  int? id;
  int? productId;
  Option1? title;
  String? price;
  String? sku;
  int? position;
  InventoryPolicy? inventoryPolicy;
  String? compareAtPrice;
  FulfillmentService? fulfillmentService;
  String? inventoryManagement;
  Option1? option1;
  dynamic? option2;
  dynamic? option3;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? taxable;
  String? barcode;
  int? grams;
  dynamic? imageId;
  int? weight;
  WeightUnit? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        title: json["title"] == null ? null : option1Values.map[json["title"]],
        price: json["price"] == null ? null : json["price"],
        sku: json["sku"] == null ? null : json["sku"],
        position: json["position"] == null ? null : json["position"],
        inventoryPolicy: json["inventory_policy"] == null
            ? null
            : inventoryPolicyValues.map[json["inventory_policy"]],
        compareAtPrice:
            json["compare_at_price"] == null ? null : json["compare_at_price"],
        fulfillmentService: json["fulfillment_service"] == null
            ? null
            : fulfillmentServiceValues.map[json["fulfillment_service"]],
        inventoryManagement: json["inventory_management"] == null
            ? null
            : json["inventory_management"],
        option1:
            json["option1"] == null ? null : option1Values.map[json["option1"]],
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
        imageId: json["image_id"],
        weight: json["weight"] == null ? null : json["weight"],
        weightUnit: json["weight_unit"] == null
            ? null
            : weightUnitValues.map[json["weight_unit"]],
        inventoryItemId: json["inventory_item_id"] == null
            ? null
            : json["inventory_item_id"],
        inventoryQuantity: json["inventory_quantity"] == null
            ? null
            : json["inventory_quantity"],
        oldInventoryQuantity: json["old_inventory_quantity"] == null
            ? null
            : json["old_inventory_quantity"],
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
        "title": title == null ? null : option1Values.reverse[title],
        "price": price == null ? null : price,
        "sku": sku == null ? null : sku,
        "position": position == null ? null : position,
        "inventory_policy": inventoryPolicy == null
            ? null
            : inventoryPolicyValues.reverse[inventoryPolicy],
        "compare_at_price": compareAtPrice == null ? null : compareAtPrice,
        "fulfillment_service": fulfillmentService == null
            ? null
            : fulfillmentServiceValues.reverse[fulfillmentService],
        "inventory_management":
            inventoryManagement == null ? null : inventoryManagement,
        "option1": option1 == null ? null : option1Values.reverse[option1],
        "option2": option2,
        "option3": option3,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "taxable": taxable == null ? null : taxable,
        "barcode": barcode == null ? null : barcode,
        "grams": grams == null ? null : grams,
        "image_id": imageId,
        "weight": weight == null ? null : weight,
        "weight_unit":
            weightUnit == null ? null : weightUnitValues.reverse[weightUnit],
        "inventory_item_id": inventoryItemId == null ? null : inventoryItemId,
        "inventory_quantity":
            inventoryQuantity == null ? null : inventoryQuantity,
        "old_inventory_quantity":
            oldInventoryQuantity == null ? null : oldInventoryQuantity,
        "requires_shipping": requiresShipping == null ? null : requiresShipping,
        "admin_graphql_api_id":
            adminGraphqlApiId == null ? null : adminGraphqlApiId,
      };
}

enum FulfillmentService { MANUAL }

final fulfillmentServiceValues =
    EnumValues({"manual": FulfillmentService.MANUAL});

enum InventoryPolicy { DENY }

final inventoryPolicyValues = EnumValues({"deny": InventoryPolicy.DENY});

enum WeightUnit { KG }

final weightUnitValues = EnumValues({"kg": WeightUnit.KG});

enum Vendor { BURTON, LOKI_LOKESH_STORE }

final vendorValues = EnumValues(
    {"Burton": Vendor.BURTON, "lokiLokeshStore": Vendor.LOKI_LOKESH_STORE});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));

    return reverseMap;
  }
}
