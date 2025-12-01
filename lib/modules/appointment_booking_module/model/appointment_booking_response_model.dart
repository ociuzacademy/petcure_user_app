// To parse this JSON data, do
//
//     final appointmentBookingResponseModel = appointmentBookingResponseModelFromJson(jsonString);

import 'dart:convert';

AppointmentBookingResponseModel appointmentBookingResponseModelFromJson(
  String str,
) => AppointmentBookingResponseModel.fromJson(json.decode(str));

String appointmentBookingResponseModelToJson(
  AppointmentBookingResponseModel data,
) => json.encode(data.toJson());

class AppointmentBookingResponseModel {
  final String message;
  final Data data;

  AppointmentBookingResponseModel({required this.message, required this.data});

  AppointmentBookingResponseModel copyWith({String? message, Data? data}) =>
      AppointmentBookingResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AppointmentBookingResponseModel.fromJson(Map<String, dynamic> json) =>
      AppointmentBookingResponseModel(
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {'message': message, 'data': data.toJson()};
}

class Data {
  final int id;
  final String appointmentType;
  final int pet;
  final String petName;
  final int doctor;
  final String doctorName;
  final String doctorPhone;
  final DateTime date;
  final int slot;
  final String? reason;
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
    this.reason,
    this.symptoms,
    this.diagnosisAndVerdict,
    this.notes,
  });

  Data copyWith({
    int? id,
    String? appointmentType,
    int? pet,
    String? petName,
    int? doctor,
    String? doctorName,
    String? doctorPhone,
    DateTime? date,
    int? slot,
    String? reason,
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
    reason: reason ?? this.reason,
    symptoms: symptoms ?? this.symptoms,
    diagnosisAndVerdict: diagnosisAndVerdict ?? this.diagnosisAndVerdict,
    notes: notes ?? this.notes,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    appointmentType: json['appointment_type'],
    pet: json['pet'],
    petName: json['pet_name'],
    doctor: json['doctor'],
    doctorName: json['doctor_name'],
    doctorPhone: json['doctor_phone'],
    date: DateTime.parse(json['date']),
    slot: json['slot'],
    reason: json['reason'],
    symptoms: json['symptoms'],
    diagnosisAndVerdict: json['diagnosis_and_verdict'],
    notes: json['notes'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appointment_type': appointmentType,
    'pet': pet,
    'pet_name': petName,
    'doctor': doctor,
    'doctor_name': doctorName,
    'doctor_phone': doctorPhone,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'slot': slot,
    'reason': reason,
    'symptoms': symptoms,
    'diagnosis_and_verdict': diagnosisAndVerdict,
    'notes': notes,
  };
}
