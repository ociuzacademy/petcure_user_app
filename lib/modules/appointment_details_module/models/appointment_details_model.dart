// To parse this JSON data, do
//
//     final appointmentDetailsModel = appointmentDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/enums/booking_reason.dart';

AppointmentDetailsModel appointmentDetailsModelFromJson(String str) =>
    AppointmentDetailsModel.fromJson(json.decode(str));

String appointmentDetailsModelToJson(AppointmentDetailsModel data) =>
    json.encode(data.toJson());

class AppointmentDetailsModel {
  final bool success;
  final String message;
  final Data data;

  AppointmentDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  AppointmentDetailsModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) => AppointmentDetailsModel(
    success: success ?? this.success,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      AppointmentDetailsModel(
        success: json['success'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data.toJson(),
  };
}

class Data {
  final int id;
  final BookingOption appointmentType;
  final int pet;
  final String petName;
  final int doctor;
  final String doctorName;
  final String doctorPhone;
  final DateTime date;
  final int slot;
  final int slotId;
  final String slotStart;
  final String slotEnd;
  final BookingReason? reason;
  final String? symptoms;
  final String? diagnosisAndVerdict;
  final String? notes;

  Data({
    required this.id,
    required this.appointmentType,
    required this.pet,
    required this.petName,
    required this.doctor,
    required this.doctorName,
    required this.doctorPhone,
    required this.date,
    required this.slot,
    required this.slotId,
    required this.slotStart,
    required this.slotEnd,
    this.reason,
    this.symptoms,
    this.diagnosisAndVerdict,
    this.notes,
  });

  Data copyWith({
    int? id,
    BookingOption? appointmentType,
    int? pet,
    String? petName,
    int? doctor,
    String? doctorName,
    String? doctorPhone,
    DateTime? date,
    int? slot,
    int? slotId,
    String? slotStart,
    String? slotEnd,
    BookingReason? reason,
    String? symptoms,
    String? diagnosisAndVerdict,
    String? notes,
  }) => Data(
    id: id ?? this.id,
    appointmentType: appointmentType ?? this.appointmentType,
    pet: pet ?? this.pet,
    petName: petName ?? this.petName,
    doctor: doctor ?? this.doctor,
    doctorName: doctorName ?? this.doctorName,
    doctorPhone: doctorPhone ?? this.doctorPhone,
    date: date ?? this.date,
    slot: slot ?? this.slot,
    slotId: slotId ?? this.slotId,
    slotStart: slotStart ?? this.slotStart,
    slotEnd: slotEnd ?? this.slotEnd,
    reason: reason ?? this.reason,
    symptoms: symptoms ?? this.symptoms,
    diagnosisAndVerdict: diagnosisAndVerdict ?? this.diagnosisAndVerdict,
    notes: notes ?? this.notes,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    appointmentType: BookingOption.fromString(json['appointment_type']),
    pet: json['pet'],
    petName: json['pet_name'],
    doctor: json['doctor'],
    doctorName: json['doctor_name'],
    doctorPhone: json['doctor_phone'],
    date: DateTime.parse(json['date']),
    slot: json['slot'],
    slotId: json['slot_id'],
    slotStart: json['slot_start'],
    slotEnd: json['slot_end'],
    reason: json['reason'] != null
        ? BookingReason.fromString(json['reason'])
        : null,
    symptoms: json['symptoms'],
    diagnosisAndVerdict: json['diagnosis_and_verdict'],
    notes: json['notes'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appointment_type': appointmentType.label,
    'pet': pet,
    'pet_name': petName,
    'doctor': doctor,
    'doctor_name': doctorName,
    'doctor_phone': doctorPhone,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'slot': slot,
    'slot_id': slotId,
    'slot_start': slotStart,
    'slot_end': slotEnd,
    'reason': reason?.label,
    'symptoms': symptoms,
    'diagnosis_and_verdict': diagnosisAndVerdict,
    'notes': notes,
  };
}
