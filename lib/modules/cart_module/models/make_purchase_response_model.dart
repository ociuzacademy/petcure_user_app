// To parse this JSON data, do
//
//     final makePurchaseResponseModel = makePurchaseResponseModelFromJson(jsonString);

import 'dart:convert';

MakePurchaseResponseModel makePurchaseResponseModelFromJson(String str) =>
    MakePurchaseResponseModel.fromJson(json.decode(str));

String makePurchaseResponseModelToJson(MakePurchaseResponseModel data) =>
    json.encode(data.toJson());

class MakePurchaseResponseModel {
  final bool success;
  final String message;
  final int orderId;
  final String amountToPay;
  final DateTime estimatedDeliveryDate;

  const MakePurchaseResponseModel({
    required this.success,
    required this.message,
    required this.orderId,
    required this.amountToPay,
    required this.estimatedDeliveryDate,
  });

  MakePurchaseResponseModel copyWith({
    bool? success,
    String? message,
    int? orderId,
    String? amountToPay,
    DateTime? estimatedDeliveryDate,
  }) => MakePurchaseResponseModel(
    success: success ?? this.success,
    message: message ?? this.message,
    orderId: orderId ?? this.orderId,
    amountToPay: amountToPay ?? this.amountToPay,
    estimatedDeliveryDate: estimatedDeliveryDate ?? this.estimatedDeliveryDate,
  );

  factory MakePurchaseResponseModel.fromJson(Map<String, dynamic> json) =>
      MakePurchaseResponseModel(
        success: json['success'],
        message: json['message'],
        orderId: json['order_id'],
        amountToPay: json['amount_to_pay'],
        estimatedDeliveryDate: DateTime.parse(json['estimated_delivery_date']),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'order_id': orderId,
    'amount_to_pay': amountToPay,
    'estimated_delivery_date':
        "${estimatedDeliveryDate.year.toString().padLeft(4, '0')}-${estimatedDeliveryDate.month.toString().padLeft(2, '0')}-${estimatedDeliveryDate.day.toString().padLeft(2, '0')}",
  };
}
