// To parse this JSON data, do
//
//     final nextVaccineModel = nextVaccineModelFromJson(jsonString);

import 'dart:convert';

NextVaccineModel nextVaccineModelFromJson(String str) =>
    NextVaccineModel.fromJson(json.decode(str));

String nextVaccineModelToJson(NextVaccineModel data) =>
    json.encode(data.toJson());

class NextVaccineModel {
  final int petId;
  final String petName;
  final String petAge;
  final String? petSubcategory;
  final String? message;
  final NextVaccine? nextVaccine;

  NextVaccineModel({
    required this.petId,
    required this.petName,
    required this.petAge,
    this.petSubcategory,
    this.message,
    this.nextVaccine,
  });

  NextVaccineModel copyWith({
    int? petId,
    String? petName,
    String? petAge,
    String? petSubcategory,
    String? message,
    NextVaccine? nextVaccine,
  }) => NextVaccineModel(
    petId: petId ?? this.petId,
    petName: petName ?? this.petName,
    petAge: petAge ?? this.petAge,
    petSubcategory: petSubcategory ?? this.petSubcategory,
    message: message ?? this.message,
    nextVaccine: nextVaccine ?? this.nextVaccine,
  );

  factory NextVaccineModel.fromJson(Map<String, dynamic> json) =>
      NextVaccineModel(
        petId: json['pet_id'],
        petName: json['pet_name'],
        petAge: json['pet_age'],
        petSubcategory: json['pet_subcategory'],
        message: json['message'],
        nextVaccine: json['next_vaccine'] != null
            ? NextVaccine.fromJson(json['next_vaccine'])
            : null,
      );

  Map<String, dynamic> toJson() => {
    'pet_id': petId,
    'pet_name': petName,
    'pet_age': petAge,
    'pet_subcategory': petSubcategory,
    'message': message,
    'next_vaccine': nextVaccine?.toJson(),
  };
}

class NextVaccine {
  final int vaccineId;
  final String vaccineName;
  final String recommendedAge;
  final String diseaseProtected;
  final bool annualRevaccination;
  final bool isAnnualRevaccination;
  final String note;

  NextVaccine({
    required this.vaccineId,
    required this.vaccineName,
    required this.recommendedAge,
    required this.diseaseProtected,
    required this.annualRevaccination,
    required this.isAnnualRevaccination,
    required this.note,
  });

  NextVaccine copyWith({
    int? vaccineId,
    String? vaccineName,
    String? recommendedAge,
    String? diseaseProtected,
    bool? annualRevaccination,
    bool? isAnnualRevaccination,
    String? note,
  }) => NextVaccine(
    vaccineId: vaccineId ?? this.vaccineId,
    vaccineName: vaccineName ?? this.vaccineName,
    recommendedAge: recommendedAge ?? this.recommendedAge,
    diseaseProtected: diseaseProtected ?? this.diseaseProtected,
    annualRevaccination: annualRevaccination ?? this.annualRevaccination,
    isAnnualRevaccination: isAnnualRevaccination ?? this.isAnnualRevaccination,
    note: note ?? this.note,
  );

  factory NextVaccine.fromJson(Map<String, dynamic> json) => NextVaccine(
    vaccineId: json['vaccine_id'],
    vaccineName: json['vaccine_name'],
    recommendedAge: json['recommended_age'],
    diseaseProtected: json['disease_protected'],
    annualRevaccination: json['annual_revaccination'],
    isAnnualRevaccination: json['is_annual_revaccination'],
    note: json['note'],
  );

  Map<String, dynamic> toJson() => {
    'vaccine_id': vaccineId,
    'vaccine_name': vaccineName,
    'recommended_age': recommendedAge,
    'disease_protected': diseaseProtected,
    'annual_revaccination': annualRevaccination,
    'is_annual_revaccination': isAnnualRevaccination,
    'note': note,
  };
}
