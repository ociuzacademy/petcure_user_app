// To parse this JSON data, do
//
//     final feedbackResponseModel = feedbackResponseModelFromJson(jsonString);

import 'dart:convert';

FeedbackResponseModel feedbackResponseModelFromJson(String str) =>
    FeedbackResponseModel.fromJson(json.decode(str));

String feedbackResponseModelToJson(FeedbackResponseModel data) =>
    json.encode(data.toJson());

class FeedbackResponseModel {
  final String status;
  final String message;
  final Data data;

  const FeedbackResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  FeedbackResponseModel copyWith({
    String? status,
    String? message,
    Data? data,
  }) => FeedbackResponseModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory FeedbackResponseModel.fromJson(Map<String, dynamic> json) =>
      FeedbackResponseModel(
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
  final int rating;
  final String feedback;
  final DateTime createdAt;
  final int appointment;

  const Data({
    required this.id,
    required this.rating,
    required this.feedback,
    required this.createdAt,
    required this.appointment,
  });

  Data copyWith({
    int? id,
    int? rating,
    String? feedback,
    DateTime? createdAt,
    int? appointment,
  }) => Data(
    id: id ?? this.id,
    rating: rating ?? this.rating,
    feedback: feedback ?? this.feedback,
    createdAt: createdAt ?? this.createdAt,
    appointment: appointment ?? this.appointment,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    rating: json['rating'],
    feedback: json['feedback'],
    createdAt: DateTime.parse(json['created_at']),
    appointment: json['appointment'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'rating': rating,
    'feedback': feedback,
    'created_at': createdAt.toIso8601String(),
    'appointment': appointment,
  };
}
