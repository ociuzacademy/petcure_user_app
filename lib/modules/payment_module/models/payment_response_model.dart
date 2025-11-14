// To parse this JSON data, do
//
//     final paymentResponseModel = paymentResponseModelFromJson(jsonString);

import 'dart:convert';

PaymentResponseModel paymentResponseModelFromJson(String str) =>
    PaymentResponseModel.fromJson(json.decode(str));

String paymentResponseModelToJson(PaymentResponseModel data) =>
    json.encode(data.toJson());

class PaymentResponseModel {
  final String message;
  final int orderId;
  final String amount;

  const PaymentResponseModel({
    required this.message,
    required this.orderId,
    required this.amount,
  });

  PaymentResponseModel copyWith({
    String? message,
    int? orderId,
    String? amount,
  }) => PaymentResponseModel(
    message: message ?? this.message,
    orderId: orderId ?? this.orderId,
    amount: amount ?? this.amount,
  );

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModel(
        message: json['message'],
        orderId: json['order_id'],
        amount: json['amount'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'order_id': orderId,
    'amount': amount,
  };
}
