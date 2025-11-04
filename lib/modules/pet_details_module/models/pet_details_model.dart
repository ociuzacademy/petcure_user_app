// To parse this JSON data, do
//
//     final petDetailsModel = petDetailsModelFromJson(jsonString);

import 'dart:convert';

PetDetailsModel petDetailsModelFromJson(String str) =>
    PetDetailsModel.fromJson(json.decode(str));

String petDetailsModelToJson(PetDetailsModel data) =>
    json.encode(data.toJson());

class PetDetailsModel {
  final bool success;
  final Pet pet;

  PetDetailsModel({required this.success, required this.pet});

  PetDetailsModel copyWith({bool? success, Pet? pet}) =>
      PetDetailsModel(success: success ?? this.success, pet: pet ?? this.pet);

  factory PetDetailsModel.fromJson(Map<String, dynamic> json) =>
      PetDetailsModel(success: json["success"], pet: Pet.fromJson(json["pet"]));

  Map<String, dynamic> toJson() => {"success": success, "pet": pet.toJson()};
}

class Pet {
  final int id;
  final String categoryName;
  final String subCategoryName;
  final String name;
  final DateTime birthDate;
  final String gender;
  final double weight;
  final String petImage;
  final dynamic healthCondition;
  final DateTime createdAt;
  final int user;
  final int category;
  final int subCategory;

  Pet({
    required this.id,
    required this.categoryName,
    required this.subCategoryName,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.weight,
    required this.petImage,
    required this.healthCondition,
    required this.createdAt,
    required this.user,
    required this.category,
    required this.subCategory,
  });

  Pet copyWith({
    int? id,
    String? categoryName,
    String? subCategoryName,
    String? name,
    DateTime? birthDate,
    String? gender,
    double? weight,
    String? petImage,
    dynamic healthCondition,
    DateTime? createdAt,
    int? user,
    int? category,
    int? subCategory,
  }) => Pet(
    id: id ?? this.id,
    categoryName: categoryName ?? this.categoryName,
    subCategoryName: subCategoryName ?? this.subCategoryName,
    name: name ?? this.name,
    birthDate: birthDate ?? this.birthDate,
    gender: gender ?? this.gender,
    weight: weight ?? this.weight,
    petImage: petImage ?? this.petImage,
    healthCondition: healthCondition ?? this.healthCondition,
    createdAt: createdAt ?? this.createdAt,
    user: user ?? this.user,
    category: category ?? this.category,
    subCategory: subCategory ?? this.subCategory,
  );

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    id: json["id"],
    categoryName: json["category_name"],
    subCategoryName: json["sub_category_name"],
    name: json["name"],
    birthDate: DateTime.parse(json["birth_date"]),
    gender: json["gender"],
    weight: json["weight"]?.toDouble(),
    petImage: json["pet_image"],
    healthCondition: json["health_condition"],
    createdAt: DateTime.parse(json["created_at"]),
    user: json["user"],
    category: json["category"],
    subCategory: json["sub_category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "sub_category_name": subCategoryName,
    "name": name,
    "birth_date":
        "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "weight": weight,
    "pet_image": petImage,
    "health_condition": healthCondition,
    "created_at": createdAt.toIso8601String(),
    "user": user,
    "category": category,
    "sub_category": subCategory,
  };
}
