// To parse this JSON data, do
//
//     final petAppointmentHistoryModel = petAppointmentHistoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/enums/booking_reason.dart';
import 'package:petcure_user_app/core/enums/booking_status.dart';

PetAppointmentHistoryModel petAppointmentHistoryModelFromJson(String str) =>
    PetAppointmentHistoryModel.fromJson(json.decode(str));

String petAppointmentHistoryModelToJson(PetAppointmentHistoryModel data) =>
    json.encode(data.toJson());

class PetAppointmentHistoryModel {
  final String petName;
  final int totalBookings;
  final List<Booking> bookings;
  final NextVaccine nextVaccine;

  const PetAppointmentHistoryModel({
    required this.petName,
    required this.totalBookings,
    required this.bookings,
    required this.nextVaccine,
  });

  PetAppointmentHistoryModel copyWith({
    String? petName,
    int? totalBookings,
    List<Booking>? bookings,
    NextVaccine? nextVaccine,
  }) => PetAppointmentHistoryModel(
    petName: petName ?? this.petName,
    totalBookings: totalBookings ?? this.totalBookings,
    bookings: bookings ?? this.bookings,
    nextVaccine: nextVaccine ?? this.nextVaccine,
  );

  factory PetAppointmentHistoryModel.fromJson(Map<String, dynamic> json) =>
      PetAppointmentHistoryModel(
        petName: json['pet_name'],
        totalBookings: json['total_bookings'],
        bookings: List<Booking>.from(
          json['bookings'].map((x) => Booking.fromJson(x)),
        ),
        nextVaccine: NextVaccine.fromJson(json['next_vaccine']),
      );

  Map<String, dynamic> toJson() => {
    'pet_name': petName,
    'total_bookings': totalBookings,
    'bookings': List<dynamic>.from(bookings.map((x) => x.toJson())),
    'next_vaccine': nextVaccine.toJson(),
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
  final int? vaccine;
  final BookingStatus status;
  final String? symptoms;
  final String? diagnosisAndVerdict;
  final String? notes;
  final String feeAmount;

  const Booking({
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
    this.vaccine,
    required this.status,
    this.symptoms,
    this.diagnosisAndVerdict,
    this.notes,
    required this.feeAmount,
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
    int? vaccine,
    BookingStatus? status,
    String? symptoms,
    String? diagnosisAndVerdict,
    String? notes,
    String? feeAmount,
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
    vaccine: vaccine ?? this.vaccine,
    status: status ?? this.status,
    symptoms: symptoms ?? this.symptoms,
    diagnosisAndVerdict: diagnosisAndVerdict ?? this.diagnosisAndVerdict,
    notes: notes ?? this.notes,
    feeAmount: feeAmount ?? this.feeAmount,
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
    vaccine: json['vaccine'],
    status: BookingStatus.fromString(json['status']),
    symptoms: json['symptoms'],
    diagnosisAndVerdict: json['diagnosis_and_verdict'],
    notes: json['notes'],
    feeAmount: json['fee_amount'],
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
    'vaccine': vaccine,
    'status': status.label,
    'symptoms': symptoms,
    'diagnosis_and_verdict': diagnosisAndVerdict,
    'notes': notes,
    'fee_amount': feeAmount,
  };
}

class NextVaccine {
  final int vaccineId;
  final String vaccineName;
  final String recommendedAge;
  final String diseaseProtected;
  final String petCurrentAge;
  final bool isAnnualRevaccination;
  final String note;

  const NextVaccine({
    required this.vaccineId,
    required this.vaccineName,
    required this.recommendedAge,
    required this.diseaseProtected,
    required this.petCurrentAge,
    required this.isAnnualRevaccination,
    required this.note,
  });

  NextVaccine copyWith({
    int? vaccineId,
    String? vaccineName,
    String? recommendedAge,
    String? diseaseProtected,
    String? petCurrentAge,
    bool? isAnnualRevaccination,
    String? note,
  }) => NextVaccine(
    vaccineId: vaccineId ?? this.vaccineId,
    vaccineName: vaccineName ?? this.vaccineName,
    recommendedAge: recommendedAge ?? this.recommendedAge,
    diseaseProtected: diseaseProtected ?? this.diseaseProtected,
    petCurrentAge: petCurrentAge ?? this.petCurrentAge,
    isAnnualRevaccination: isAnnualRevaccination ?? this.isAnnualRevaccination,
    note: note ?? this.note,
  );

  factory NextVaccine.fromJson(Map<String, dynamic> json) => NextVaccine(
    vaccineId: json['vaccine_id'],
    vaccineName: json['vaccine_name'],
    recommendedAge: json['recommended_age'],
    diseaseProtected: json['disease_protected'],
    petCurrentAge: json['pet_current_age'],
    isAnnualRevaccination: json['is_annual_revaccination'],
    note: json['note'],
  );

  Map<String, dynamic> toJson() => {
    'vaccine_id': vaccineId,
    'vaccine_name': vaccineName,
    'recommended_age': recommendedAge,
    'disease_protected': diseaseProtected,
    'pet_current_age': petCurrentAge,
    'is_annual_revaccination': isAnnualRevaccination,
    'note': note,
  };
}
