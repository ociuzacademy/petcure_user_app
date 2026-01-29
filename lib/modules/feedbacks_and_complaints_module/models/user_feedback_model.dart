// To parse this JSON data, do
//
//     final userFeedbacksModel = userFeedbacksModelFromJson(jsonString);

import 'dart:convert';

UserFeedbacksModel userFeedbacksModelFromJson(String str) =>
    UserFeedbacksModel.fromJson(json.decode(str));

String userFeedbacksModelToJson(UserFeedbacksModel data) =>
    json.encode(data.toJson());

class UserFeedbacksModel {
  final String status;
  final int count;
  final List<Datum> data;

  const UserFeedbacksModel({
    required this.status,
    required this.count,
    required this.data,
  });

  UserFeedbacksModel copyWith({
    String? status,
    int? count,
    List<Datum>? data,
  }) => UserFeedbacksModel(
    status: status ?? this.status,
    count: count ?? this.count,
    data: data ?? this.data,
  );

  factory UserFeedbacksModel.fromJson(Map<String, dynamic> json) =>
      UserFeedbacksModel(
        status: json['status'],
        count: json['count'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'count': count,
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final int rating;
  final String feedback;
  final DateTime createdAt;
  final int appointment;

  const Datum({
    required this.id,
    required this.rating,
    required this.feedback,
    required this.createdAt,
    required this.appointment,
  });

  Datum copyWith({
    int? id,
    int? rating,
    String? feedback,
    DateTime? createdAt,
    int? appointment,
  }) => Datum(
    id: id ?? this.id,
    rating: rating ?? this.rating,
    feedback: feedback ?? this.feedback,
    createdAt: createdAt ?? this.createdAt,
    appointment: appointment ?? this.appointment,
  );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
