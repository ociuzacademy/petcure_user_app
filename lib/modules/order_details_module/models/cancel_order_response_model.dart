// To parse this JSON data, do
//
//     final cancelOrderResponseModel = cancelOrderResponseModelFromJson(jsonString);

import 'dart:convert';

CancelOrderResponseModel cancelOrderResponseModelFromJson(String str) =>
    CancelOrderResponseModel.fromJson(json.decode(str));

String cancelOrderResponseModelToJson(CancelOrderResponseModel data) =>
    json.encode(data.toJson());

class CancelOrderResponseModel {
  final String status;
  final String message;

  const CancelOrderResponseModel({required this.status, required this.message});

  CancelOrderResponseModel copyWith({String? status, String? message}) =>
      CancelOrderResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory CancelOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      CancelOrderResponseModel(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
