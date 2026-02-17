// To parse this JSON data, do
//
//     final prescriptionListModel = prescriptionListModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_user_app/core/enums/food_timing.dart';
import 'package:petcure_user_app/core/enums/medicine_time.dart';

PrescriptionListModel prescriptionListModelFromJson(String str) =>
    PrescriptionListModel.fromJson(json.decode(str));

String prescriptionListModelToJson(PrescriptionListModel data) =>
    json.encode(data.toJson());

class PrescriptionListModel {
  final String status;
  final String userId;
  final int count;
  final List<Prescription> prescriptions;

  PrescriptionListModel({
    required this.status,
    required this.userId,
    required this.count,
    required this.prescriptions,
  });

  PrescriptionListModel copyWith({
    String? status,
    String? userId,
    int? count,
    List<Prescription>? prescriptions,
  }) => PrescriptionListModel(
    status: status ?? this.status,
    userId: userId ?? this.userId,
    count: count ?? this.count,
    prescriptions: prescriptions ?? this.prescriptions,
  );

  factory PrescriptionListModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionListModel(
        status: json['status'],
        userId: json['user_id'],
        count: json['count'],
        prescriptions: List<Prescription>.from(
          json['prescriptions'].map((x) => Prescription.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'user_id': userId,
    'count': count,
    'prescriptions': List<dynamic>.from(prescriptions.map((x) => x.toJson())),
  };
}

class Prescription {
  final int id;
  final int appointmentId;
  final DateTime appointmentDate;
  final int doctorId;
  final String doctorName;
  final int petId;
  final String petName;
  final String diagnosis;
  final List<Medication> medications;
  final int daysDuration;
  final DateTime issuedDate;
  final bool isActive;
  final String notes;

  Prescription({
    required this.id,
    required this.appointmentId,
    required this.appointmentDate,
    required this.doctorId,
    required this.doctorName,
    required this.petId,
    required this.petName,
    required this.diagnosis,
    required this.medications,
    required this.daysDuration,
    required this.issuedDate,
    required this.isActive,
    required this.notes,
  });

  Prescription copyWith({
    int? id,
    int? appointmentId,
    DateTime? appointmentDate,
    int? doctorId,
    String? doctorName,
    int? petId,
    String? petName,
    String? diagnosis,
    List<Medication>? medications,
    int? daysDuration,
    DateTime? issuedDate,
    bool? isActive,
    String? notes,
  }) => Prescription(
    id: id ?? this.id,
    appointmentId: appointmentId ?? this.appointmentId,
    appointmentDate: appointmentDate ?? this.appointmentDate,
    doctorId: doctorId ?? this.doctorId,
    doctorName: doctorName ?? this.doctorName,
    petId: petId ?? this.petId,
    petName: petName ?? this.petName,
    diagnosis: diagnosis ?? this.diagnosis,
    medications: medications ?? this.medications,
    daysDuration: daysDuration ?? this.daysDuration,
    issuedDate: issuedDate ?? this.issuedDate,
    isActive: isActive ?? this.isActive,
    notes: notes ?? this.notes,
  );

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
    id: json['id'],
    appointmentId: json['appointment_id'],
    appointmentDate: DateTime.parse(json['appointment_date']),
    doctorId: json['doctor_id'],
    doctorName: json['doctor_name'],
    petId: json['pet_id'],
    petName: json['pet_name'],
    diagnosis: json['diagnosis'],
    medications: List<Medication>.from(
      json['medications'].map((x) => Medication.fromJson(x)),
    ),
    daysDuration: json['days_duration'],
    issuedDate: DateTime.parse(json['issued_date']),
    isActive: json['is_active'],
    notes: json['notes'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appointment_id': appointmentId,
    'appointment_date':
        "${appointmentDate.year.toString().padLeft(4, '0')}-${appointmentDate.month.toString().padLeft(2, '0')}-${appointmentDate.day.toString().padLeft(2, '0')}",
    'doctor_id': doctorId,
    'doctor_name': doctorName,
    'pet_id': petId,
    'pet_name': petName,
    'diagnosis': diagnosis,
    'medications': List<dynamic>.from(medications.map((x) => x.toJson())),
    'days_duration': daysDuration,
    'issued_date': issuedDate.toIso8601String(),
    'is_active': isActive,
    'notes': notes,
  };
}

class Medication {
  final String name;
  final String dosage;
  final FoodTiming foodTiming;
  final List<MedicineTime> timeOfDay;

  Medication({
    required this.name,
    required this.dosage,
    required this.foodTiming,
    required this.timeOfDay,
  });

  Medication copyWith({
    String? name,
    String? dosage,
    FoodTiming? foodTiming,
    List<MedicineTime>? timeOfDay,
  }) => Medication(
    name: name ?? this.name,
    dosage: dosage ?? this.dosage,
    foodTiming: foodTiming ?? this.foodTiming,
    timeOfDay: timeOfDay ?? this.timeOfDay,
  );

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
    name: json['name'],
    dosage: json['dosage'],
    foodTiming: FoodTiming.fromString(json['food_timing']),
    timeOfDay: List<MedicineTime>.from(
      json['time_of_day'].map((x) => MedicineTime.fromString(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'dosage': dosage,
    'food_timing': foodTiming,
    'time_of_day': List<dynamic>.from(timeOfDay.map((x) => x.toJson())),
  };
}
