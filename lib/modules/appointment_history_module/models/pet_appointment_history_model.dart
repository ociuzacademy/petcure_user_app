// To parse this JSON data, do
//
//     final petAppointmentHistoryModel = petAppointmentHistoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/enums/booking_reason.dart';

PetAppointmentHistoryModel petAppointmentHistoryModelFromJson(String str) =>
    PetAppointmentHistoryModel.fromJson(json.decode(str));

String petAppointmentHistoryModelToJson(PetAppointmentHistoryModel data) =>
    json.encode(data.toJson());

class PetAppointmentHistoryModel {
  final String petName;
  final int totalBookings;
  final List<Booking> bookings;

  PetAppointmentHistoryModel({
    required this.petName,
    required this.totalBookings,
    required this.bookings,
  });

  PetAppointmentHistoryModel copyWith({
    String? petName,
    int? totalBookings,
    List<Booking>? bookings,
  }) => PetAppointmentHistoryModel(
    petName: petName ?? this.petName,
    totalBookings: totalBookings ?? this.totalBookings,
    bookings: bookings ?? this.bookings,
  );

  factory PetAppointmentHistoryModel.fromJson(Map<String, dynamic> json) =>
      PetAppointmentHistoryModel(
        petName: json['pet_name'],
        totalBookings: json['total_bookings'],
        bookings: List<Booking>.from(
          json['bookings'].map((x) => Booking.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    'pet_name': petName,
    'total_bookings': totalBookings,
    'bookings': List<dynamic>.from(bookings.map((x) => x.toJson())),
  };
}

class Booking {
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

  Booking({
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

  Booking copyWith({
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
  }) => Booking(
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

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
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
