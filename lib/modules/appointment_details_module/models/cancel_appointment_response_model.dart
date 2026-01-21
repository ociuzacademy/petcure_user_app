// To parse this JSON data, do
//
//     final cancelAppointmentResponseModel = cancelAppointmentResponseModelFromJson(jsonString);

import 'dart:convert';

CancelAppointmentResponseModel cancelAppointmentResponseModelFromJson(
  String str,
) => CancelAppointmentResponseModel.fromJson(json.decode(str));

String cancelAppointmentResponseModelToJson(
  CancelAppointmentResponseModel data,
) => json.encode(data.toJson());

class CancelAppointmentResponseModel {
  final String message;
  final int appointmentId;
  final String status;

  const CancelAppointmentResponseModel({
    required this.message,
    required this.appointmentId,
    required this.status,
  });

  CancelAppointmentResponseModel copyWith({
    String? message,
    int? appointmentId,
    String? status,
  }) => CancelAppointmentResponseModel(
    message: message ?? this.message,
    appointmentId: appointmentId ?? this.appointmentId,
    status: status ?? this.status,
  );

  factory CancelAppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      CancelAppointmentResponseModel(
        message: json['message'],
        appointmentId: json['appointment_id'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'appointment_id': appointmentId,
    'status': status,
  };
}
