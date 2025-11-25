// To parse this JSON data, do
//
//     final reorderResponseModel = reorderResponseModelFromJson(jsonString);

import 'dart:convert';

ReorderResponseModel reorderResponseModelFromJson(String str) =>
    ReorderResponseModel.fromJson(json.decode(str));

String reorderResponseModelToJson(ReorderResponseModel data) =>
    json.encode(data.toJson());

class ReorderResponseModel {
  final bool success;
  final String message;
  final int newOrderId;
  final int totalItems;
  final String totalAmount;
  final DateTime estimatedDeliveryDate;

  const ReorderResponseModel({
    required this.success,
    required this.message,
    required this.newOrderId,
    required this.totalItems,
    required this.totalAmount,
    required this.estimatedDeliveryDate,
  });

  ReorderResponseModel copyWith({
    bool? success,
    String? message,
    int? newOrderId,
    int? totalItems,
    String? totalAmount,
    DateTime? estimatedDeliveryDate,
  }) => ReorderResponseModel(
    success: success ?? this.success,
    message: message ?? this.message,
    newOrderId: newOrderId ?? this.newOrderId,
    totalItems: totalItems ?? this.totalItems,
    totalAmount: totalAmount ?? this.totalAmount,
    estimatedDeliveryDate: estimatedDeliveryDate ?? this.estimatedDeliveryDate,
  );

  factory ReorderResponseModel.fromJson(Map<String, dynamic> json) =>
      ReorderResponseModel(
        success: json['success'],
        message: json['message'],
        newOrderId: json['new_order_id'],
        totalItems: json['total_items'],
        totalAmount: json['total_amount'],
        estimatedDeliveryDate: DateTime.parse(json['estimated_delivery_date']),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'new_order_id': newOrderId,
    'total_items': totalItems,
    'total_amount': totalAmount,
    'estimated_delivery_date': estimatedDeliveryDate.toIso8601String(),
  };
}
