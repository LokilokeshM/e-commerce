// To parse this JSON data, do
//
//     final itemList = itemListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ItemList itemListFromJson(String str) => ItemList.fromJson(json.decode(str));

String itemListToJson(ItemList data) => json.encode(data.toJson());

class ItemList {
  ItemList({
    required this.items,
  });

  List<Item>? items;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.slug,
    required this.procedures,
    required this.servingNumber,
    required this.servingCost,
    required this.budgetRange,
    required this.preparationTime,
    required this.cookingTime,
    required this.thumbnailImage,
    required this.thumbnailImageTag,
    required this.featuredImage,
    required this.featuredImageTag,
    required this.excerpt,
    required this.chefTip,
    required this.lusogNote,
    required this.created,
    required this.bestProductId,
    required this.bestProductName,
    required this.bestProductSlug,
    required this.bestProductImage,
    required this.bestProductThumbnailImage,
    required this.bestProductParentCategoryId,
    required this.bestProductParentCategoryName,
    required this.bestProductParentCategorySlug,
    required this.isRecipeOfTheDay,
    required this.cookingSkills,
    required this.cookingTools,
    required this.ingredients,
    required this.mealType,
    required this.metaData,
    required this.averageRating,
    required this.totalRatingCount,
  });

  int id;
  String name;
  String slug;
  String procedures;
  String servingNumber;
  String servingCost;
  String budgetRange;
  String preparationTime;
  String cookingTime;
  String thumbnailImage;
  String thumbnailImageTag;
  String featuredImage;
  String featuredImageTag;
  String excerpt;
  String chefTip;
  String lusogNote;
  DateTime? created;
  int bestProductId;
  BestProductName? bestProductName;
  BestProductSlug? bestProductSlug;
  BestProductImage? bestProductImage;
  BestProductThumbnailImage? bestProductThumbnailImage;
  dynamic bestProductParentCategoryId;
  BestProductParentCategoryName? bestProductParentCategoryName;
  BestProductParentCategorySlug? bestProductParentCategorySlug;
  int isRecipeOfTheDay;
  List<CookingSkill>? cookingSkills;
  List<CookingTool>? cookingTools;
  Map<String, List<Ingredient>>? ingredients;
  List<MealType>? mealType;
  MetaData? metaData;
  String averageRating;
  int totalRatingCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        procedures: json["procedures"] == null ? null : json["procedures"],
        servingNumber:
            json["serving_number"] == null ? null : json["serving_number"],
        servingCost: json["serving_cost"] == null ? null : json["serving_cost"],
        budgetRange: json["budget_range"] == null ? null : json["budget_range"],
        preparationTime:
            json["preparation_time"] == null ? null : json["preparation_time"],
        cookingTime: json["cooking_time"] == null ? null : json["cooking_time"],
        thumbnailImage:
            json["thumbnail_image"] == null ? null : json["thumbnail_image"],
        thumbnailImageTag: json["thumbnail_image_tag"] == null
            ? null
            : json["thumbnail_image_tag"],
        featuredImage:
            json["featured_image"] == null ? null : json["featured_image"],
        featuredImageTag: json["featured_image_tag"] == null
            ? null
            : json["featured_image_tag"],
        excerpt: json["excerpt"] == null ? null : json["excerpt"],
        chefTip: json["chef_tip"] == null ? null : json["chef_tip"],
        lusogNote: json["lusog_note"] == null ? null : json["lusog_note"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        bestProductId:
            json["best_product_id"] == null ? null : json["best_product_id"],
        bestProductName: json["best_product_name"] == null
            ? null
            : bestProductNameValues.map[json["best_product_name"]],
        bestProductSlug: json["best_product_slug"] == null
            ? null
            : bestProductSlugValues.map[json["best_product_slug"]],
        bestProductImage: json["best_product_image"] == null
            ? null
            : bestProductImageValues.map[json["best_product_image"]],
        bestProductThumbnailImage: json["best_product_thumbnail_image"] == null
            ? null
            : bestProductThumbnailImageValues
                .map[json["best_product_thumbnail_image"]],
        bestProductParentCategoryId: json["best_product_parent_category_id"],
        bestProductParentCategoryName:
            json["best_product_parent_category_name"] == null
                ? null
                : bestProductParentCategoryNameValues
                    .map[json["best_product_parent_category_name"]],
        bestProductParentCategorySlug:
            json["best_product_parent_category_slug"] == null
                ? null
                : bestProductParentCategorySlugValues
                    .map[json["best_product_parent_category_slug"]],
        isRecipeOfTheDay: json["is_recipe_of_the_day"] == null
            ? null
            : json["is_recipe_of_the_day"],
        cookingSkills: json["cooking_skills"] == null
            ? null
            : List<CookingSkill>.from(
                json["cooking_skills"].map((x) => CookingSkill.fromJson(x))),
        cookingTools: json["cooking_tools"] == null
            ? null
            : List<CookingTool>.from(
                json["cooking_tools"].map((x) => CookingTool.fromJson(x))),
        ingredients: json["ingredients"] == null
            ? null
            : Map.from(json["ingredients"]).map((k, v) => MapEntry<String,
                    List<Ingredient>>(k,
                List<Ingredient>.from(v.map((x) => Ingredient.fromJson(x))))),
        mealType: json["meal_type"] == null
            ? null
            : List<MealType>.from(
                json["meal_type"].map((x) => MealType.fromJson(x))),
        metaData: json["meta_data"] == null
            ? null
            : MetaData.fromJson(json["meta_data"]),
        averageRating:
            json["average_rating"] == null ? null : json["average_rating"],
        totalRatingCount: json["total_rating_count"] == null
            ? null
            : json["total_rating_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "procedures": procedures == null ? null : procedures,
        "serving_number": servingNumber == null ? null : servingNumber,
        "serving_cost": servingCost == null ? null : servingCost,
        "budget_range": budgetRange == null ? null : budgetRange,
        "preparation_time": preparationTime == null ? null : preparationTime,
        "cooking_time": cookingTime == null ? null : cookingTime,
        "thumbnail_image": thumbnailImage == null ? null : thumbnailImage,
        "thumbnail_image_tag":
            thumbnailImageTag == null ? null : thumbnailImageTag,
        "featured_image": featuredImage == null ? null : featuredImage,
        "featured_image_tag":
            featuredImageTag == null ? null : featuredImageTag,
        "excerpt": excerpt == null ? null : excerpt,
        "chef_tip": chefTip == null ? null : chefTip,
        "lusog_note": lusogNote == null ? null : lusogNote,
        "created": created == null ? null : created!.toIso8601String(),
        "best_product_id": bestProductId == null ? null : bestProductId,
        "best_product_name": bestProductName == null
            ? null
            : bestProductNameValues.reverse[bestProductName],
        "best_product_slug": bestProductSlug == null
            ? null
            : bestProductSlugValues.reverse[bestProductSlug],
        "best_product_image": bestProductImage == null
            ? null
            : bestProductImageValues.reverse[bestProductImage],
        "best_product_thumbnail_image": bestProductThumbnailImage == null
            ? null
            : bestProductThumbnailImageValues
                .reverse[bestProductThumbnailImage],
        "best_product_parent_category_id": bestProductParentCategoryId,
        "best_product_parent_category_name":
            bestProductParentCategoryName == null
                ? null
                : bestProductParentCategoryNameValues
                    .reverse[bestProductParentCategoryName],
        "best_product_parent_category_slug":
            bestProductParentCategorySlug == null
                ? null
                : bestProductParentCategorySlugValues
                    .reverse[bestProductParentCategorySlug],
        "is_recipe_of_the_day":
            isRecipeOfTheDay == null ? null : isRecipeOfTheDay,
        "cooking_skills": cookingSkills == null
            ? null
            : List<dynamic>.from(cookingSkills!.map((x) => x.toJson())),
        "cooking_tools": cookingTools == null
            ? null
            : List<dynamic>.from(cookingTools!.map((x) => x.toJson())),
        "ingredients": ingredients == null
            ? null
            : Map.from(ingredients!).map((k, v) => MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "meal_type": mealType == null
            ? null
            : List<dynamic>.from(mealType!.map((x) => x.toJson())),
        "meta_data": metaData == null ? null : metaData!.toJson(),
        "average_rating": averageRating == null ? null : averageRating,
        "total_rating_count":
            totalRatingCount == null ? null : totalRatingCount,
      };
}

enum BestProductImage {
  DM_BONE_SMART_RESIZED_PINEAPPLE_1_PNG,
  DEL_MONTE_100_PINEAPPLE_JUICE_HEART_SMART_CAN_504_X308_PNG,
  DEL_MONTE_ORANGE_JUICE_DRINK_HEART_SMART_CAN_504_X308_PNG,
  DEL_MONTE_FOUR_SEASONS_JUICE_DRINK_MAIN_PNG,
  DEL_MONTE_100_PINEAPPLE_JUICE_WITH_VITAMINS_ACE_CAN_504_X308_PNG,
  DEL_MONTE_PINEAPPLE_CRUSH_JUICE_DRINK_504_X308_PNG,
  DEL_MONTE_ORANGE_JUICE_DRINK_SWEETENED_504_X3081_PNG,
  DEL_MONTE_MANGO_JUICE_DRINK_MAIN_PNG,
  FNR_PINEAPPLEORANGE_JC_1_L_JPG,
  DEL_MONTE_100_PINEAPPLE_JUICE_FIBER_ENRICHED_CAN_504_X308_PNG,
  FNR_PINEAPPLE_330_ML_FEATURED_PNG,
  DEL_MONTE_SWEETENED_PINEAPPLE_JUICE_DRINK_MAIN_PNG,
  FNR_FOURSEASON_JC_1_L_JPG,
  FNR_APPLE_330_ML_504_X308_PNG,
  DEL_MONTE_PINEAPPLE_ORANGE_JUICE_DRINK_MAIN_PNG,
  DM_BONE_SMART_RESIZED_1_PNG
}

final bestProductImageValues = EnumValues({
  "del-monte-100-pineapple-juice-fiber-enriched-can-504x308.png":
      BestProductImage
          .DEL_MONTE_100_PINEAPPLE_JUICE_FIBER_ENRICHED_CAN_504_X308_PNG,
  "del-monte-100-pineapple-juice-heart-smart-can-504x308.png": BestProductImage
      .DEL_MONTE_100_PINEAPPLE_JUICE_HEART_SMART_CAN_504_X308_PNG,
  "del-monte-100-pineapple-juice-with-vitamins-ace-can-504x308.png":
      BestProductImage
          .DEL_MONTE_100_PINEAPPLE_JUICE_WITH_VITAMINS_ACE_CAN_504_X308_PNG,
  "del-monte-four-seasons-juice-drink-main.png":
      BestProductImage.DEL_MONTE_FOUR_SEASONS_JUICE_DRINK_MAIN_PNG,
  "del-monte-mango-juice-drink-main.png":
      BestProductImage.DEL_MONTE_MANGO_JUICE_DRINK_MAIN_PNG,
  "del-monte-orange-juice-drink-heart-smart-can-504x308.png": BestProductImage
      .DEL_MONTE_ORANGE_JUICE_DRINK_HEART_SMART_CAN_504_X308_PNG,
  "del-monte-orange-juice-drink-sweetened-504x3081.png":
      BestProductImage.DEL_MONTE_ORANGE_JUICE_DRINK_SWEETENED_504_X3081_PNG,
  "del-monte-pineapple-crush-juice-drink-504x308.png":
      BestProductImage.DEL_MONTE_PINEAPPLE_CRUSH_JUICE_DRINK_504_X308_PNG,
  "del-monte-pineapple-orange-juice-drink-main.png":
      BestProductImage.DEL_MONTE_PINEAPPLE_ORANGE_JUICE_DRINK_MAIN_PNG,
  "del-monte-sweetened-pineapple-juice-drink-main.png":
      BestProductImage.DEL_MONTE_SWEETENED_PINEAPPLE_JUICE_DRINK_MAIN_PNG,
  "DM-Bone-Smart_resized(1).png": BestProductImage.DM_BONE_SMART_RESIZED_1_PNG,
  "DM-Bone-Smart_resized_pineapple(1).png":
      BestProductImage.DM_BONE_SMART_RESIZED_PINEAPPLE_1_PNG,
  "fnr-apple-330ml-504x308.png": BestProductImage.FNR_APPLE_330_ML_504_X308_PNG,
  "fnr-fourseason-jc-1l.jpg": BestProductImage.FNR_FOURSEASON_JC_1_L_JPG,
  "fnr-pineappleorange-jc-1l.jpg":
      BestProductImage.FNR_PINEAPPLEORANGE_JC_1_L_JPG,
  "fnr-pineapple-330ml-featured.png":
      BestProductImage.FNR_PINEAPPLE_330_ML_FEATURED_PNG
});

enum BestProductName {
  DEL_MONTE_BONE_SMART_100_PINEAPPLE_JUICE,
  DEL_MONTE_100_PINEAPPLE_JUICE_HEART_SMART,
  DEL_MONTE_ORANGE_JUICE_DRINK_HEART_SMART,
  DEL_MONTE_FOUR_SEASONS_JUICE_DRINK,
  DEL_MONTE_100_PINEAPPLE_JUICE_WITH_VITAMINS_A_C_E,
  DEL_MONTE_PINEAPPLE_CRUSH_JUICE_DRINK,
  DEL_MONTE_SWEETENED_ORANGE_JUICE_DRINK,
  DEL_MONTE_MANGO_JUICE_DRINK,
  DEL_MONTE_FIT_N_RIGHT_PINEAPPLE_ORANGE_JUICE_DRINK,
  DEL_MONTE_100_PINEAPPLE_JUICE_FIBER_ENRICHED,
  DEL_MONTE_FIT_N_RIGHT_PINEAPPLE_JUICE_DRINK,
  DEL_MONTE_SWEETENED_PINEAPPLE_JUICE_DRINK,
  DEL_MONTE_FIT_N_RIGHT_FOUR_SEASONS_JUICE_DRINK,
  DEL_MONTE_FIT_N_RIGHT_APPLE_JUICE_DRINK,
  DEL_MONTE_PINEAPPLE_ORANGE_JUICE_DRINK,
  DEL_MONTE_BONE_SMART_ORANGE_JUICE
}

final bestProductNameValues = EnumValues({
  "Del Monte 100% Pineapple Juice Fiber-Enriched":
      BestProductName.DEL_MONTE_100_PINEAPPLE_JUICE_FIBER_ENRICHED,
  "Del Monte 100% Pineapple Juice Heart Smart":
      BestProductName.DEL_MONTE_100_PINEAPPLE_JUICE_HEART_SMART,
  "Del Monte 100% Pineapple Juice with Vitamins A, C & E":
      BestProductName.DEL_MONTE_100_PINEAPPLE_JUICE_WITH_VITAMINS_A_C_E,
  "Del Monte Bone Smart 100% Pineapple Juice":
      BestProductName.DEL_MONTE_BONE_SMART_100_PINEAPPLE_JUICE,
  "Del Monte Bone Smart Orange Juice":
      BestProductName.DEL_MONTE_BONE_SMART_ORANGE_JUICE,
  "Del Monte Fit 'n Right Apple Juice Drink":
      BestProductName.DEL_MONTE_FIT_N_RIGHT_APPLE_JUICE_DRINK,
  "Del Monte Fit 'n Right Four Seasons Juice Drink":
      BestProductName.DEL_MONTE_FIT_N_RIGHT_FOUR_SEASONS_JUICE_DRINK,
  "Del Monte Fit 'n Right Pineapple Juice Drink":
      BestProductName.DEL_MONTE_FIT_N_RIGHT_PINEAPPLE_JUICE_DRINK,
  "Del Monte Fit 'n Right Pineapple Orange Juice Drink":
      BestProductName.DEL_MONTE_FIT_N_RIGHT_PINEAPPLE_ORANGE_JUICE_DRINK,
  "Del Monte Four Seasons Juice Drink":
      BestProductName.DEL_MONTE_FOUR_SEASONS_JUICE_DRINK,
  "Del Monte Mango Juice Drink": BestProductName.DEL_MONTE_MANGO_JUICE_DRINK,
  "Del Monte Orange Juice Drink Heart Smart":
      BestProductName.DEL_MONTE_ORANGE_JUICE_DRINK_HEART_SMART,
  "Del Monte Pineapple Crush Juice Drink":
      BestProductName.DEL_MONTE_PINEAPPLE_CRUSH_JUICE_DRINK,
  "Del Monte Pineapple Orange Juice Drink":
      BestProductName.DEL_MONTE_PINEAPPLE_ORANGE_JUICE_DRINK,
  "Del Monte Sweetened Orange Juice Drink":
      BestProductName.DEL_MONTE_SWEETENED_ORANGE_JUICE_DRINK,
  "Del Monte Sweetened Pineapple Juice Drink":
      BestProductName.DEL_MONTE_SWEETENED_PINEAPPLE_JUICE_DRINK
});

enum BestProductParentCategoryName { BEVERAGES, EMPTY }

final bestProductParentCategoryNameValues = EnumValues({
  "Beverages": BestProductParentCategoryName.BEVERAGES,
  "": BestProductParentCategoryName.EMPTY
});

enum BestProductParentCategorySlug { BEVERAGES, EMPTY }

final bestProductParentCategorySlugValues = EnumValues({
  "beverages": BestProductParentCategorySlug.BEVERAGES,
  "": BestProductParentCategorySlug.EMPTY
});

enum BestProductSlug {
  DEL_MONTE_BONE_SMART_100_PINEAPPLE_JUICE,
  DEL_MONTE_100_PINEAPPLE_JUICE_HEART_SMART,
  DEL_MONTE_ORANGE_JUICE_DRINK_HEART_SMART,
  DEL_MONTE_FOUR_SEASONS_JUICE_DRINK,
  DEL_MONTE_100_PINEAPPLE_JUICE_WITH_VITAMINS_ACE,
  DEL_MONTE_PINEAPPLE_CRUSH_JUICE_DRINK,
  DEL_MONTE_SWEETENED_ORANGE_JUICE_DRINK,
  DEL_MONTE_MANGO_JUICE_DRINK,
  DEL_MONTE_FIT_N_RIGHT_PINEAPPLE_ORANGE_JUICE_DRINK,
  DEL_MONTE_100_PINEAPPLE_JUICE_FIBER_ENRICHED,
  DEL_MONTE_FIT_N_RIGHT_PINEAPPLE_JUICE_DRINK,
  DEL_MONTE_SWEETENED_PINEAPPLE_JUICE_DRINK,
  DEL_MONTE_FIT_N_RIGHT_FOUR_SEASONS_JUICE_DRINK,
  DEL_MONTE_FIT_N_RIGHT_APPLE_JUICE_DRINK,
  DEL_MONTE_PINEAPPLE_ORANGE_JUICE_DRINK,
  DEL_MONTE_BONE_SMART_ORANGE_JUICE
}

final bestProductSlugValues = EnumValues({
  "del-monte-100-pineapple-juice-fiber-enriched":
      BestProductSlug.DEL_MONTE_100_PINEAPPLE_JUICE_FIBER_ENRICHED,
  "del-monte-100-pineapple-juice-heart-smart":
      BestProductSlug.DEL_MONTE_100_PINEAPPLE_JUICE_HEART_SMART,
  "del-monte-100-pineapple-juice-with-vitamins-ace":
      BestProductSlug.DEL_MONTE_100_PINEAPPLE_JUICE_WITH_VITAMINS_ACE,
  "del-monte-bone-smart-100-pineapple-juice":
      BestProductSlug.DEL_MONTE_BONE_SMART_100_PINEAPPLE_JUICE,
  "del-monte-bone-smart-orange-juice":
      BestProductSlug.DEL_MONTE_BONE_SMART_ORANGE_JUICE,
  "del-monte-fit-n-right-apple-juice-drink":
      BestProductSlug.DEL_MONTE_FIT_N_RIGHT_APPLE_JUICE_DRINK,
  "del-monte-fit-n-right-four-seasons-juice-drink":
      BestProductSlug.DEL_MONTE_FIT_N_RIGHT_FOUR_SEASONS_JUICE_DRINK,
  "del-monte-fit-n-right-pineapple-juice-drink":
      BestProductSlug.DEL_MONTE_FIT_N_RIGHT_PINEAPPLE_JUICE_DRINK,
  "del-monte-fit-n-right-pineapple-orange-juice-drink":
      BestProductSlug.DEL_MONTE_FIT_N_RIGHT_PINEAPPLE_ORANGE_JUICE_DRINK,
  "del-monte-four-seasons-juice-drink":
      BestProductSlug.DEL_MONTE_FOUR_SEASONS_JUICE_DRINK,
  "del-monte-mango-juice-drink": BestProductSlug.DEL_MONTE_MANGO_JUICE_DRINK,
  "del-monte-orange-juice-drink-heart-smart":
      BestProductSlug.DEL_MONTE_ORANGE_JUICE_DRINK_HEART_SMART,
  "del-monte-pineapple-crush-juice-drink":
      BestProductSlug.DEL_MONTE_PINEAPPLE_CRUSH_JUICE_DRINK,
  "del-monte-pineapple-orange-juice-drink":
      BestProductSlug.DEL_MONTE_PINEAPPLE_ORANGE_JUICE_DRINK,
  "del-monte-sweetened-orange-juice-drink":
      BestProductSlug.DEL_MONTE_SWEETENED_ORANGE_JUICE_DRINK,
  "del-monte-sweetened-pineapple-juice-drink":
      BestProductSlug.DEL_MONTE_SWEETENED_PINEAPPLE_JUICE_DRINK
});

enum BestProductThumbnailImage {
  DEL_MONTE_100_PINEAPPLE_BONE_SMART_JUICE_CAN_133_X166_PNG,
  DEL_MONTE_100_PINEAPPLE_JUICE_HEART_SMART_CAN_133_X166_PNG,
  DEL_MONTE_ORANGE_JUICE_DRINK_HEART_SMART_CAN_133_X166_PNG,
  DEL_MONTE_FOUR_SEASONS_JUICE_DRINK_THUMB_PNG,
  DEL_MONTE_100_PINEAPPLE_JUICE_WITH_VITAMINS_ACE_CAN_133_X166_PNG,
  DEL_MONTE_PINEAPPLE_CRUSH_JUICE_DRINK_133_X1661_PNG,
  DEL_MONTE_SWEETENED_ORANGE_JUICE_DRINK_133_X1661_PNG,
  DEL_MONTE_MANGO_JUICE_DRINK_THUMB_PNG,
  FNR_PINEAPPLEORANGE_JC_1_L_THUMBNAIL_JPG,
  DEL_MONTE_100_PINEAPPLE_JUICE_FIBER_ENRICHED_CAN_133_X166_PNG,
  FNR_PINEAPPLE_330_ML_THUMBNAIL_PNG,
  DEL_MONTE_SWEETENED_PINEAPPLE_JUICE_DRINK_THUMB_PNG,
  FNR_JPG,
  FNR_APPLE_330_ML_133_X166_PNG,
  DEL_MONTE_PINEAPPLE_ORANGE_JUICE_DRINK_THUMB_PNG,
  DEL_MONTE_BONE_SMART_ORANGE_JUICE_CAN_133_X166_PNG
}

final bestProductThumbnailImageValues = EnumValues({
  "del-monte-100-pineapple-bone-smart-juice-can-133x166.png":
      BestProductThumbnailImage
          .DEL_MONTE_100_PINEAPPLE_BONE_SMART_JUICE_CAN_133_X166_PNG,
  "del-monte-100-pineapple-juice-fiber-enriched-can-133x166.png":
      BestProductThumbnailImage
          .DEL_MONTE_100_PINEAPPLE_JUICE_FIBER_ENRICHED_CAN_133_X166_PNG,
  "del-monte-100-pineapple-juice-heart-smart-can-133x166.png":
      BestProductThumbnailImage
          .DEL_MONTE_100_PINEAPPLE_JUICE_HEART_SMART_CAN_133_X166_PNG,
  "del-monte-100-pineapple-juice-with-vitamins-ace-can-133x166.png":
      BestProductThumbnailImage
          .DEL_MONTE_100_PINEAPPLE_JUICE_WITH_VITAMINS_ACE_CAN_133_X166_PNG,
  "del-monte-bone-smart-orange-juice-can-133x166.png": BestProductThumbnailImage
      .DEL_MONTE_BONE_SMART_ORANGE_JUICE_CAN_133_X166_PNG,
  "del-monte-four-seasons-juice-drink-thumb.png":
      BestProductThumbnailImage.DEL_MONTE_FOUR_SEASONS_JUICE_DRINK_THUMB_PNG,
  "del-monte-mango-juice-drink-thumb.png":
      BestProductThumbnailImage.DEL_MONTE_MANGO_JUICE_DRINK_THUMB_PNG,
  "del-monte-orange-juice-drink-heart-smart-can-133x166.png":
      BestProductThumbnailImage
          .DEL_MONTE_ORANGE_JUICE_DRINK_HEART_SMART_CAN_133_X166_PNG,
  "del-monte-pineapple-crush-juice-drink-133x1661.png":
      BestProductThumbnailImage
          .DEL_MONTE_PINEAPPLE_CRUSH_JUICE_DRINK_133_X1661_PNG,
  "del-monte-pineapple-orange-juice-drink-thumb.png": BestProductThumbnailImage
      .DEL_MONTE_PINEAPPLE_ORANGE_JUICE_DRINK_THUMB_PNG,
  "del-monte-sweetened-orange-juice-drink-133x1661.png":
      BestProductThumbnailImage
          .DEL_MONTE_SWEETENED_ORANGE_JUICE_DRINK_133_X1661_PNG,
  "del-monte-sweetened-pineapple-juice-drink-thumb.png":
      BestProductThumbnailImage
          .DEL_MONTE_SWEETENED_PINEAPPLE_JUICE_DRINK_THUMB_PNG,
  "fnr-apple-330ml-133x166.png":
      BestProductThumbnailImage.FNR_APPLE_330_ML_133_X166_PNG,
  "fnr.jpg": BestProductThumbnailImage.FNR_JPG,
  "fnr-pineappleorange-jc-1l-thumbnail.jpg":
      BestProductThumbnailImage.FNR_PINEAPPLEORANGE_JC_1_L_THUMBNAIL_JPG,
  "fnr-pineapple-330ml-thumbnail.png":
      BestProductThumbnailImage.FNR_PINEAPPLE_330_ML_THUMBNAIL_PNG
});

class CookingSkill {
  CookingSkill({
    required this.skill,
  });

  String skill;

  factory CookingSkill.fromJson(Map<String, dynamic> json) => CookingSkill(
        skill: json["skill"] == null ? null : json["skill"],
      );

  Map<String, dynamic> toJson() => {
        "skill": skill == null ? null : skill,
      };
}

class CookingTool {
  CookingTool({
    required this.tool,
  });

  String tool;

  factory CookingTool.fromJson(Map<String, dynamic> json) => CookingTool(
        tool: json["tool"] == null ? null : json["tool"],
      );

  Map<String, dynamic> toJson() => {
        "tool": tool == null ? null : tool,
      };
}

class Ingredient {
  Ingredient({
    required this.quantity,
    required this.unit,
    required this.name,
    required this.recipePrefix,
    required this.servingId,
    required this.productId,
  });

  String quantity;
  Unit? unit;
  String name;
  String recipePrefix;
  int servingId;
  int productId;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        quantity: json["quantity"] == null ? null : json["quantity"],
        unit: json["unit"] == null ? null : unitValues.map[json["unit"]],
        name: json["name"] == null ? null : json["name"],
        recipePrefix:
            json["recipe_prefix"] == null ? null : json["recipe_prefix"],
        servingId: json["serving_id"] == null ? null : json["serving_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity == null ? null : quantity,
        "unit": unit == null ? null : unitValues.reverse[unit],
        "name": name == null ? null : name,
        "recipe_prefix": recipePrefix == null ? null : recipePrefix,
        "serving_id": servingId == null ? null : servingId,
        "product_id": productId == null ? null : productId,
      };
}

enum Unit {
  PACK,
  CUP,
  TBSP,
  PC,
  POUCH,
  CAN,
  EMPTY,
  PACKS,
  TSP,
  G,
  PCS,
  SACHET,
  CLOVE,
  CUPS,
  POUCHES,
  KGS,
  KG,
  STALK,
  CANS,
  SLICES,
  LEAVES,
  CLOVES,
  BUNDLE,
  SCOOP,
  STALKS,
  BUNCH,
  CUBE,
  SLICE,
  BUNCHES,
  PINT,
  LITER,
  ML,
  SQUARE,
  WHOLE,
  LITERS,
  STEM,
  HEAD,
  HEADS
}

final unitValues = EnumValues({
  "bunch": Unit.BUNCH,
  "bunches": Unit.BUNCHES,
  "bundle": Unit.BUNDLE,
  "can": Unit.CAN,
  "cans": Unit.CANS,
  "clove": Unit.CLOVE,
  "cloves": Unit.CLOVES,
  "cube": Unit.CUBE,
  "cup": Unit.CUP,
  "cups": Unit.CUPS,
  "-": Unit.EMPTY,
  "g": Unit.G,
  "head": Unit.HEAD,
  "heads": Unit.HEADS,
  "kg": Unit.KG,
  "kgs": Unit.KGS,
  "leaves": Unit.LEAVES,
  "liter": Unit.LITER,
  "liters": Unit.LITERS,
  "ml": Unit.ML,
  "pack": Unit.PACK,
  "packs": Unit.PACKS,
  "pc": Unit.PC,
  "pcs": Unit.PCS,
  "pint": Unit.PINT,
  "pouch": Unit.POUCH,
  "pouches": Unit.POUCHES,
  "sachet": Unit.SACHET,
  "scoop": Unit.SCOOP,
  "slice": Unit.SLICE,
  "slices": Unit.SLICES,
  "square": Unit.SQUARE,
  "stalk": Unit.STALK,
  "stalks": Unit.STALKS,
  "stem": Unit.STEM,
  "Tbsp": Unit.TBSP,
  "tsp": Unit.TSP,
  "whole": Unit.WHOLE
});

class MealType {
  MealType({
    required this.id,
    required this.name,
    required this.slug,
    required this.featuredImage,
  });

  int id;
  Name? name;
  Slug? slug;
  FeaturedImage? featuredImage;

  factory MealType.fromJson(Map<String, dynamic> json) => MealType(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        slug: json["slug"] == null ? null : slugValues.map[json["slug"]],
        featuredImage: json["featured_image"] == null
            ? null
            : featuredImageValues.map[json["featured_image"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse[name],
        "slug": slug == null ? null : slugValues.reverse[slug],
        "featured_image": featuredImage == null
            ? null
            : featuredImageValues.reverse[featuredImage],
      };
}

enum FeaturedImage {
  PINEAPPLE_FRIED_RICE_JPG,
  PORK_HUMBA_WITH_PINE1_JPG,
  DEL_MONTE_MARINARA_JPG,
  CLASSIC_CALDERETA_JPG,
  CHEESY_CHICKEN_AFRITADA_JPG,
  RESTAURANT_STYLE_GRILLED_TUNA_STEAK_JPG,
  TUYO_A_LA_PUTTANESCA_JPG,
  MOMMYS_MERIENDA_SPAGHETTI_JPG,
  CHICKEN_JPG,
  PATA_KARE_KARE_JPG,
  PINEAPPLE_PORK_STEAK_JPG,
  DEL_MONTE_RED_BULALO_JPG,
  FIESTA_TIRAMISU_JPG,
  FIESTA_PANNA_COTTA_JPG,
  FIESTA_FRUIT_SALAD_JPG,
  PINOY_DISHES_JPG,
  LAING_KITCHENOMICA_JPG,
  ONE_POT_SPICY_BACON_JPG,
  SHRIMP_SALAD_WITH_PINEAPPLES2_JPG,
  CREAM_OF_CLAM_SOUP1_JPG,
  BEV_JPG,
  FRESH_GARDEN_COOLER_JPG,
  CONDIMENTSTHUMB_JPG,
  TOMATO_DIP_JPG
}

final featuredImageValues = EnumValues({
  "bev.jpg": FeaturedImage.BEV_JPG,
  "cheesy_chicken_afritada.jpg": FeaturedImage.CHEESY_CHICKEN_AFRITADA_JPG,
  "chicken.jpg": FeaturedImage.CHICKEN_JPG,
  "classic_caldereta.jpg": FeaturedImage.CLASSIC_CALDERETA_JPG,
  "condimentsthumb.jpg": FeaturedImage.CONDIMENTSTHUMB_JPG,
  "cream_of_clam_soup1.jpg": FeaturedImage.CREAM_OF_CLAM_SOUP1_JPG,
  "del_monte_marinara.jpg": FeaturedImage.DEL_MONTE_MARINARA_JPG,
  "del_monte_red_bulalo.jpg": FeaturedImage.DEL_MONTE_RED_BULALO_JPG,
  "fiesta_fruit_salad.jpg": FeaturedImage.FIESTA_FRUIT_SALAD_JPG,
  "fiesta_panna_cotta.jpg": FeaturedImage.FIESTA_PANNA_COTTA_JPG,
  "fiesta_tiramisu.jpg": FeaturedImage.FIESTA_TIRAMISU_JPG,
  "fresh_garden_cooler.jpg": FeaturedImage.FRESH_GARDEN_COOLER_JPG,
  "laing_kitchenomica.jpg": FeaturedImage.LAING_KITCHENOMICA_JPG,
  "mommys_merienda_spaghetti.jpg": FeaturedImage.MOMMYS_MERIENDA_SPAGHETTI_JPG,
  "one_pot_spicy_bacon.jpg": FeaturedImage.ONE_POT_SPICY_BACON_JPG,
  "pata_kare_kare.jpg": FeaturedImage.PATA_KARE_KARE_JPG,
  "pineapple_fried_rice.jpg": FeaturedImage.PINEAPPLE_FRIED_RICE_JPG,
  "pineapple_pork_steak.jpg": FeaturedImage.PINEAPPLE_PORK_STEAK_JPG,
  "Pinoy-Dishes.jpg": FeaturedImage.PINOY_DISHES_JPG,
  "pork_humba_with_pine1.jpg": FeaturedImage.PORK_HUMBA_WITH_PINE1_JPG,
  "restaurant_style_grilled_tuna_steak.jpg":
      FeaturedImage.RESTAURANT_STYLE_GRILLED_TUNA_STEAK_JPG,
  "shrimp_salad_with_pineapples2.jpg":
      FeaturedImage.SHRIMP_SALAD_WITH_PINEAPPLES2_JPG,
  "tomato_dip.jpg": FeaturedImage.TOMATO_DIP_JPG,
  "tuyo_a_la_puttanesca.jpg": FeaturedImage.TUYO_A_LA_PUTTANESCA_JPG
});

enum Name {
  RICE,
  PORK,
  DEL_MONTE_SPAGHETTI_SAUCE,
  MAIN_DISH,
  DEL_MONTE_TOMATO_SAUCE,
  SEAFOOD,
  PASTA_NOODLES,
  PASTA,
  CHICKEN,
  DEL_MONTE_QUICK_N_EASY,
  DEL_MONTE_PINEAPPLE,
  BEEF,
  DESSERT,
  FRUIT,
  DEL_MONTE_FRUIT_COCKTAIL,
  PINOY_DISHES,
  VEGETABLE,
  DEL_MONTE_PASTA,
  APPETIZER,
  SOUP,
  BEVERAGE,
  DEL_MONTE_JUICE,
  DEL_MONTE_CONDIMENTS,
  SAUCE
}

final nameValues = EnumValues({
  "Appetizer": Name.APPETIZER,
  "Beef": Name.BEEF,
  "Beverage": Name.BEVERAGE,
  "Chicken": Name.CHICKEN,
  "Del Monte Condiments": Name.DEL_MONTE_CONDIMENTS,
  "Del Monte Fruit Cocktail": Name.DEL_MONTE_FRUIT_COCKTAIL,
  "Del Monte Juice": Name.DEL_MONTE_JUICE,
  "Del Monte Pasta": Name.DEL_MONTE_PASTA,
  "Del Monte Pineapple": Name.DEL_MONTE_PINEAPPLE,
  "Del Monte Quick 'n Easy": Name.DEL_MONTE_QUICK_N_EASY,
  "Del Monte Spaghetti Sauce": Name.DEL_MONTE_SPAGHETTI_SAUCE,
  "Del Monte Tomato Sauce": Name.DEL_MONTE_TOMATO_SAUCE,
  "Dessert": Name.DESSERT,
  "Fruit": Name.FRUIT,
  "Main Dish": Name.MAIN_DISH,
  "Pasta": Name.PASTA,
  "Pasta/Noodles": Name.PASTA_NOODLES,
  "Pinoy Dishes": Name.PINOY_DISHES,
  "Pork": Name.PORK,
  "Rice": Name.RICE,
  "Sauce": Name.SAUCE,
  "Seafood": Name.SEAFOOD,
  "Soup": Name.SOUP,
  "Vegetable": Name.VEGETABLE
});

enum Slug {
  RICE,
  PORK,
  DEL_MONTE_SPAGHETTI_SAUCE,
  MAIN_DISH,
  DEL_MONTE_TOMATO_SAUCE,
  SEAFOOD,
  PASTA_NOODLES,
  PASTA,
  CHICKEN,
  DEL_MONTE_QUICK_N_EASY,
  DEL_MONTE_PINEAPPLE,
  BEEF,
  DESSERT,
  FRUIT,
  DEL_MONTE_FRUIT_COCKTAIL,
  PINOY_DISHES,
  VEGETABLE,
  DEL_MONTE_PASTA,
  APPETIZER,
  SOUP,
  BEVERAGE,
  DEL_MONTE_JUICE,
  DEL_MONTE_CONDIMENTS,
  SAUCE
}

final slugValues = EnumValues({
  "appetizer": Slug.APPETIZER,
  "beef": Slug.BEEF,
  "beverage": Slug.BEVERAGE,
  "chicken": Slug.CHICKEN,
  "del-monte-condiments": Slug.DEL_MONTE_CONDIMENTS,
  "del-monte-fruit-cocktail": Slug.DEL_MONTE_FRUIT_COCKTAIL,
  "del-monte-juice": Slug.DEL_MONTE_JUICE,
  "del-monte-pasta": Slug.DEL_MONTE_PASTA,
  "del-monte-pineapple": Slug.DEL_MONTE_PINEAPPLE,
  "del-monte-quick-n-easy": Slug.DEL_MONTE_QUICK_N_EASY,
  "del-monte-spaghetti-sauce": Slug.DEL_MONTE_SPAGHETTI_SAUCE,
  "del-monte-tomato-sauce": Slug.DEL_MONTE_TOMATO_SAUCE,
  "dessert": Slug.DESSERT,
  "fruit": Slug.FRUIT,
  "main-dish": Slug.MAIN_DISH,
  "pasta": Slug.PASTA,
  "pasta-noodles": Slug.PASTA_NOODLES,
  "pinoy-dishes": Slug.PINOY_DISHES,
  "pork": Slug.PORK,
  "rice": Slug.RICE,
  "sauce": Slug.SAUCE,
  "seafood": Slug.SEAFOOD,
  "soup": Slug.SOUP,
  "vegetable": Slug.VEGETABLE
});

class MetaData {
  MetaData({
    required this.metaRef,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
  });

  String metaRef;
  String metaTitle;
  String metaDescription;
  String metaKeywords;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        metaRef: json["meta_ref"] == null ? null : json["meta_ref"],
        metaTitle: json["meta_title"] == null ? null : json["meta_title"],
        metaDescription:
            json["meta_description"] == null ? null : json["meta_description"],
        metaKeywords:
            json["meta_keywords"] == null ? null : json["meta_keywords"],
      );

  Map<String, dynamic> toJson() => {
        "meta_ref": metaRef == null ? null : metaRef,
        "meta_title": metaTitle == null ? null : metaTitle,
        "meta_description": metaDescription == null ? null : metaDescription,
        "meta_keywords": metaKeywords == null ? null : metaKeywords,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
