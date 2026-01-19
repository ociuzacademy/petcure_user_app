// To parse this JSON data, do
//
//     final petDeleteResponseModel = petDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

PetDeleteResponseModel petDeleteResponseModelFromJson(String str) =>
    PetDeleteResponseModel.fromJson(json.decode(str));

String petDeleteResponseModelToJson(PetDeleteResponseModel data) =>
    json.encode(data.toJson());

class PetDeleteResponseModel {
  final String message;
  final int remainingPets;

  const PetDeleteResponseModel({
    required this.message,
    required this.remainingPets,
  });

  PetDeleteResponseModel copyWith({String? message, int? remainingPets}) =>
      PetDeleteResponseModel(
        message: message ?? this.message,
        remainingPets: remainingPets ?? this.remainingPets,
      );

  factory PetDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      PetDeleteResponseModel(
        message: json['message'],
        remainingPets: json['remaining_pets'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'remaining_pets': remainingPets,
  };
}
