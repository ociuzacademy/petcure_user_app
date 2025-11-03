// To parse this JSON data, do
//
//     final addPetResponseModel = addPetResponseModelFromJson(jsonString);

import 'dart:convert';

AddPetResponseModel addPetResponseModelFromJson(String str) =>
    AddPetResponseModel.fromJson(json.decode(str));

String addPetResponseModelToJson(AddPetResponseModel data) =>
    json.encode(data.toJson());

class AddPetResponseModel {
  final bool success;
  final String message;
  final Data data;

  AddPetResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  AddPetResponseModel copyWith({bool? success, String? message, Data? data}) =>
      AddPetResponseModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AddPetResponseModel.fromJson(Map<String, dynamic> json) =>
      AddPetResponseModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final int id;
  final String name;
  final DateTime birthDate;
  final String gender;
  final double weight;
  final String petImage;
  final String? healthCondition;
  final DateTime createdAt;
  final int user;
  final int category;
  final int subCategory;

  Data({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.weight,
    required this.petImage,
    this.healthCondition,
    required this.createdAt,
    required this.user,
    required this.category,
    required this.subCategory,
  });

  Data copyWith({
    int? id,
    String? name,
    DateTime? birthDate,
    String? gender,
    double? weight,
    String? petImage,
    String? healthCondition,
    DateTime? createdAt,
    int? user,
    int? category,
    int? subCategory,
  }) => Data(
    id: id ?? this.id,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
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
