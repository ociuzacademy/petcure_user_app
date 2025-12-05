// To parse this JSON data, do
//
//     final complaintResponseModel = complaintResponseModelFromJson(jsonString);

import 'dart:convert';

ComplaintResponseModel complaintResponseModelFromJson(String str) =>
    ComplaintResponseModel.fromJson(json.decode(str));

String complaintResponseModelToJson(ComplaintResponseModel data) =>
    json.encode(data.toJson());

class ComplaintResponseModel {
  final String status;
  final String message;
  final Data data;

  const ComplaintResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  ComplaintResponseModel copyWith({
    String? status,
    String? message,
    Data? data,
  }) => ComplaintResponseModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory ComplaintResponseModel.fromJson(Map<String, dynamic> json) =>
      ComplaintResponseModel(
        status: json['status'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}

class Data {
  final int id;
  final String category;
  final String description;
  final DateTime createdAt;
  final int appointment;

  const Data({
    required this.id,
    required this.category,
    required this.description,
    required this.createdAt,
    required this.appointment,
  });

  Data copyWith({
    int? id,
    String? category,
    String? description,
    DateTime? createdAt,
    int? appointment,
  }) => Data(
    id: id ?? this.id,
    category: category ?? this.category,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    appointment: appointment ?? this.appointment,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    category: json['category'],
    description: json['description'],
    createdAt: DateTime.parse(json['created_at']),
    appointment: json['appointment'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'description': description,
    'created_at': createdAt.toIso8601String(),
    'appointment': appointment,
  };
}
