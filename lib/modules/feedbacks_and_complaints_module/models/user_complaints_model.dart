// To parse this JSON data, do
//
//     final userComplaintsModel = userComplaintsModelFromJson(jsonString);

import 'dart:convert';

UserComplaintsModel userComplaintsModelFromJson(String str) =>
    UserComplaintsModel.fromJson(json.decode(str));

String userComplaintsModelToJson(UserComplaintsModel data) =>
    json.encode(data.toJson());

class UserComplaintsModel {
  final String status;
  final int count;
  final List<Datum> data;

  const UserComplaintsModel({
    required this.status,
    required this.count,
    required this.data,
  });

  UserComplaintsModel copyWith({
    String? status,
    int? count,
    List<Datum>? data,
  }) => UserComplaintsModel(
    status: status ?? this.status,
    count: count ?? this.count,
    data: data ?? this.data,
  );

  factory UserComplaintsModel.fromJson(Map<String, dynamic> json) =>
      UserComplaintsModel(
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
  final String category;
  final String description;
  final DateTime createdAt;
  final int appointment;

  const Datum({
    required this.id,
    required this.category,
    required this.description,
    required this.createdAt,
    required this.appointment,
  });

  Datum copyWith({
    int? id,
    String? category,
    String? description,
    DateTime? createdAt,
    int? appointment,
  }) => Datum(
    id: id ?? this.id,
    category: category ?? this.category,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    appointment: appointment ?? this.appointment,
  );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
