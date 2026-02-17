// To parse this JSON data, do
//
//     final prescriptionDetailsModel = prescriptionDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/enums/booking_reason.dart';
import 'package:petcure_user_app/core/enums/food_timing.dart';
import 'package:petcure_user_app/core/enums/medicine_time.dart';

PrescriptionDetailsModel prescriptionDetailsModelFromJson(String str) =>
    PrescriptionDetailsModel.fromJson(json.decode(str));

String prescriptionDetailsModelToJson(PrescriptionDetailsModel data) =>
    json.encode(data.toJson());

class PrescriptionDetailsModel {
  final String status;
  final String message;
  final Prescription prescription;

  const PrescriptionDetailsModel({
    required this.status,
    required this.message,
    required this.prescription,
  });

  PrescriptionDetailsModel copyWith({
    String? status,
    String? message,
    Prescription? prescription,
  }) => PrescriptionDetailsModel(
    status: status ?? this.status,
    message: message ?? this.message,
    prescription: prescription ?? this.prescription,
  );

  factory PrescriptionDetailsModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionDetailsModel(
        status: json['status'],
        message: json['message'],
        prescription: Prescription.fromJson(json['prescription']),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'prescription': prescription.toJson(),
  };
}

class Prescription {
  final int id;
  final int appointmentId;
  final DateTime issuedDate;
  final bool isActive;
  final String diagnosis;
  final List<Medication> medications;
  final int daysDuration;
  final String notes;
  final AppointmentDetails appointmentDetails;
  final DoctorDetails doctorDetails;
  final PetDetails petDetails;

  const Prescription({
    required this.id,
    required this.appointmentId,
    required this.issuedDate,
    required this.isActive,
    required this.diagnosis,
    required this.medications,
    required this.daysDuration,
    required this.notes,
    required this.appointmentDetails,
    required this.doctorDetails,
    required this.petDetails,
  });

  Prescription copyWith({
    int? id,
    int? appointmentId,
    DateTime? issuedDate,
    bool? isActive,
    String? diagnosis,
    List<Medication>? medications,
    int? daysDuration,
    String? notes,
    AppointmentDetails? appointmentDetails,
    DoctorDetails? doctorDetails,
    PetDetails? petDetails,
  }) => Prescription(
    id: id ?? this.id,
    appointmentId: appointmentId ?? this.appointmentId,
    issuedDate: issuedDate ?? this.issuedDate,
    isActive: isActive ?? this.isActive,
    diagnosis: diagnosis ?? this.diagnosis,
    medications: medications ?? this.medications,
    daysDuration: daysDuration ?? this.daysDuration,
    notes: notes ?? this.notes,
    appointmentDetails: appointmentDetails ?? this.appointmentDetails,
    doctorDetails: doctorDetails ?? this.doctorDetails,
    petDetails: petDetails ?? this.petDetails,
  );

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
    id: json['id'],
    appointmentId: json['appointment_id'],
    issuedDate: DateTime.parse(json['issued_date']),
    isActive: json['is_active'],
    diagnosis: json['diagnosis'],
    medications: List<Medication>.from(
      json['medications'].map((x) => Medication.fromJson(x)),
    ),
    daysDuration: json['days_duration'],
    notes: json['notes'],
    appointmentDetails: AppointmentDetails.fromJson(
      json['appointment_details'],
    ),
    doctorDetails: DoctorDetails.fromJson(json['doctor_details']),
    petDetails: PetDetails.fromJson(json['pet_details']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appointment_id': appointmentId,
    'issued_date': issuedDate.toIso8601String(),
    'is_active': isActive,
    'diagnosis': diagnosis,
    'medications': List<dynamic>.from(medications.map((x) => x.toJson())),
    'days_duration': daysDuration,
    'notes': notes,
    'appointment_details': appointmentDetails.toJson(),
    'doctor_details': doctorDetails.toJson(),
    'pet_details': petDetails.toJson(),
  };
}

class AppointmentDetails {
  final DateTime date;
  final String slot;
  final BookingOption type;
  final BookingReason reason;
  final String symptoms;
  final String status;

  const AppointmentDetails({
    required this.date,
    required this.slot,
    required this.type,
    required this.reason,
    required this.symptoms,
    required this.status,
  });

  AppointmentDetails copyWith({
    DateTime? date,
    String? slot,
    BookingOption? type,
    BookingReason? reason,
    String? symptoms,
    String? status,
  }) => AppointmentDetails(
    date: date ?? this.date,
    slot: slot ?? this.slot,
    type: type ?? this.type,
    reason: reason ?? this.reason,
    symptoms: symptoms ?? this.symptoms,
    status: status ?? this.status,
  );

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) =>
      AppointmentDetails(
        date: DateTime.parse(json['date']),
        slot: json['slot'],
        type: BookingOption.fromString(json['type']),
        reason: BookingReason.fromString(json['reason']),
        symptoms: json['symptoms'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'slot': slot,
    'type': type.toJson(),
    'reason': reason.toJson(),
    'symptoms': symptoms,
    'status': status,
  };
}

class DoctorDetails {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String image;

  const DoctorDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
  });

  DoctorDetails copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? image,
  }) => DoctorDetails(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    address: address ?? this.address,
    image: image ?? this.image,
  );

  factory DoctorDetails.fromJson(Map<String, dynamic> json) => DoctorDetails(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    address: json['address'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'address': address,
    'image': image,
  };
}

class Medication {
  final String name;
  final String dosage;
  final FoodTiming foodTiming;
  final List<MedicineTime> timeOfDay;

  const Medication({
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
    'food_timing': foodTiming.toJson(),
    'time_of_day': List<dynamic>.from(timeOfDay.map((x) => x.toJson())),
  };
}

class PetDetails {
  final int id;
  final String name;
  final String category;
  final String subCategory;
  final String gender;
  final String age;
  final double weight;
  final String image;
  final String? healthCondition;

  PetDetails({
    required this.id,
    required this.name,
    required this.category,
    required this.subCategory,
    required this.gender,
    required this.age,
    required this.weight,
    required this.image,
    this.healthCondition,
  });

  PetDetails copyWith({
    int? id,
    String? name,
    String? category,
    String? subCategory,
    String? gender,
    String? age,
    double? weight,
    String? image,
    String? healthCondition,
  }) => PetDetails(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    subCategory: subCategory ?? this.subCategory,
    gender: gender ?? this.gender,
    age: age ?? this.age,
    weight: weight ?? this.weight,
    image: image ?? this.image,
    healthCondition: healthCondition ?? this.healthCondition,
  );

  factory PetDetails.fromJson(Map<String, dynamic> json) => PetDetails(
    id: json['id'],
    name: json['name'],
    category: json['category'],
    subCategory: json['sub_category'],
    gender: json['gender'],
    age: json['age'],
    weight: json['weight']?.toDouble() ?? 0.0,
    image: json['image'],
    healthCondition: json['health_condition'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'sub_category': subCategory,
    'gender': gender,
    'age': age,
    'weight': weight,
    'image': image,
    'health_condition': healthCondition,
  };
}
