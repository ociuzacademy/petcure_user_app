// pet_category_model.dart

// To parse this JSON data, do
//
//     final petCategoryModel = petCategoryModelFromJson(jsonString);

import 'dart:convert';

List<PetCategoryModel> petCategoryModelFromJson(String str) =>
    List<PetCategoryModel>.from(
      json.decode(str).map((x) => PetCategoryModel.fromJson(x)),
    );

String petCategoryModelToJson(List<PetCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetCategoryModel {
  final int id;
  final String petcategory;

  const PetCategoryModel({required this.id, required this.petcategory});

  PetCategoryModel copyWith({int? id, String? petcategory}) => PetCategoryModel(
    id: id ?? this.id,
    petcategory: petcategory ?? this.petcategory,
  );

  factory PetCategoryModel.fromJson(Map<String, dynamic> json) =>
      PetCategoryModel(id: json['id'], petcategory: json['petcategory']);

  Map<String, dynamic> toJson() => {'id': id, 'petcategory': petcategory};
}
