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
  final int paymentid;
  final String amount;
  final PaymentFor paymentFor;
  final int? appointmentid;
  final int? orderid;

  const UpiPaymentResponseModel({
    required this.message,
    required this.paymentid,
    required this.amount,
    required this.paymentFor,
    required this.appointmentid,
    required this.orderid,
  });

  UpiPaymentResponseModel copyWith({
    String? message,
    int? paymentid,
    String? amount,
    PaymentFor? paymentFor,
    int? appointmentid,
    int? orderid,
  }) => UpiPaymentResponseModel(
    message: message ?? this.message,
    paymentid: paymentid ?? this.paymentid,
    amount: amount ?? this.amount,
    paymentFor: paymentFor ?? this.paymentFor,
    appointmentid: appointmentid ?? this.appointmentid,
    orderid: orderid ?? this.orderid,
  );

  factory UpiPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      UpiPaymentResponseModel(
        message: json['message'],
        paymentid: json['paymentid'],
        amount: json['amount'],
        paymentFor: PaymentFor.fromJson(json['for']),
        appointmentid: json['appointmentid'],
        orderid: json['orderid'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'paymentid': paymentid,
    'amount': amount,
    'for': paymentFor.label,
    'appointmentid': appointmentid,
    'orderid': orderid,
  };
}
