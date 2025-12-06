// To parse this JSON data, do
//
//     final nutritionPlannerResponseModel = nutritionPlannerResponseModelFromJson(jsonString);

import 'dart:convert';

NutritionPlannerResponseModel nutritionPlannerResponseModelFromJson(
  String str,
) => NutritionPlannerResponseModel.fromJson(json.decode(str));

String nutritionPlannerResponseModelToJson(
  NutritionPlannerResponseModel data,
) => json.encode(data.toJson());

class NutritionPlannerResponseModel {
  final String recommendation;

  const NutritionPlannerResponseModel({required this.recommendation});

  NutritionPlannerResponseModel copyWith({String? recommendation}) =>
      NutritionPlannerResponseModel(
        recommendation: recommendation ?? this.recommendation,
      );

  factory NutritionPlannerResponseModel.fromJson(Map<String, dynamic> json) =>
      NutritionPlannerResponseModel(recommendation: json['recommendation']);

  Map<String, dynamic> toJson() => {'recommendation': recommendation};
}
