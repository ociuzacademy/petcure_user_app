// To parse this JSON data, do
//
//     final upiPaymentResponseModel = upiPaymentResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_user_app/modules/payment_module/enums/payment_for.dart';

UpiPaymentResponseModel upiPaymentResponseModelFromJson(String str) =>
    UpiPaymentResponseModel.fromJson(json.decode(str));

String upiPaymentResponseModelToJson(UpiPaymentResponseModel data) =>
    json.encode(data.toJson());

class UpiPaymentResponseModel {
  final String message;
  final int paymentId;
  final String amount;
  final PaymentFor paymentFor;
  final int? appointmentId;
  final int? orderId;

  UpiPaymentResponseModel({
    required this.message,
    required this.paymentId,
    required this.amount,
    required this.paymentFor,
    this.appointmentId,
    this.orderId,
  });

  UpiPaymentResponseModel copyWith({
    String? message,
    int? paymentId,
    String? amount,
    PaymentFor? paymentFor,
    int? appointmentId,
    int? orderId,
  }) => UpiPaymentResponseModel(
    message: message ?? this.message,
    paymentId: paymentId ?? this.paymentId,
    amount: amount ?? this.amount,
    paymentFor: paymentFor ?? this.paymentFor,
    appointmentId: appointmentId ?? this.appointmentId,
    orderId: orderId ?? this.orderId,
  );

  factory UpiPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      UpiPaymentResponseModel(
        message: json['message'],
        paymentId: json['payment_id'],
        amount: json['amount'],
        paymentFor: PaymentFor.fromJson(json['for']),
        appointmentId: json['appointment_id'],
        orderId: json['order_id'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'payment_id': paymentId,
    'amount': amount,
    'for': paymentFor.label,
    'appointment_id': appointmentId,
    'order_id': orderId,
  };
}
