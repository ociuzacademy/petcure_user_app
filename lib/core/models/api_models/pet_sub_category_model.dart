// To parse this JSON data, do
//
//     final petSubCategoryModel = petSubCategoryModelFromJson(jsonString);

import 'dart:convert';

PetSubCategoryModel petSubCategoryModelFromJson(String str) =>
    PetSubCategoryModel.fromJson(json.decode(str));

String petSubCategoryModelToJson(PetSubCategoryModel data) =>
    json.encode(data.toJson());

class PetSubCategoryModel {
  final bool success;
  final List<Subcategory> subcategories;

  const PetSubCategoryModel({
    required this.success,
    required this.subcategories,
  });

  PetSubCategoryModel copyWith({
    bool? success,
    List<Subcategory>? subcategories,
  }) => PetSubCategoryModel(
    success: success ?? this.success,
    subcategories: subcategories ?? this.subcategories,
  );

  factory PetSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      PetSubCategoryModel(
        success: json["success"],
        subcategories: List<Subcategory>.from(
          json["subcategories"].map((x) => Subcategory.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "subcategories": List<dynamic>.from(subcategories.map((x) => x.toJson())),
  };
}

class Subcategory {
  final int petsubcategoryId;
  final int categoryId;
  final String petsubcategory;

  const Subcategory({
    required this.petsubcategoryId,
    required this.categoryId,
    required this.petsubcategory,
  });

  Subcategory copyWith({
    int? petsubcategoryId,
    int? categoryId,
    String? petsubcategory,
  }) => Subcategory(
    petsubcategoryId: petsubcategoryId ?? this.petsubcategoryId,
    categoryId: categoryId ?? this.categoryId,
    petsubcategory: petsubcategory ?? this.petsubcategory,
  );

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    petsubcategoryId: json["petsubcategory_id"],
    categoryId: json["category_id"],
    petsubcategory: json["petsubcategory"],
  );

  Map<String, dynamic> toJson() => {
    "petsubcategory_id": petsubcategoryId,
    "category_id": categoryId,
    "petsubcategory": petsubcategory,
  };
}
