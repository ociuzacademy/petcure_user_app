// To parse this JSON data, do
//
//     final cardPaymentResponseModel = cardPaymentResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_user_app/modules/payment_module/enums/payment_for.dart';

CardPaymentResponseModel cardPaymentResponseModelFromJson(String str) =>
    CardPaymentResponseModel.fromJson(json.decode(str));

String cardPaymentResponseModelToJson(CardPaymentResponseModel data) =>
    json.encode(data.toJson());

class CardPaymentResponseModel {
  final String message;
  final int paymentid;
  final String amount;
  final PaymentFor paymentFor;
  final String paymentmethod;
  final String lastfourdigits;
  final String cardholdername;
  final DateTime transactiondate;
  final int? appointmentid;
  final int? orderid;

  CardPaymentResponseModel({
    required this.message,
    required this.paymentid,
    required this.amount,
    required this.paymentFor,
    required this.paymentmethod,
    required this.lastfourdigits,
    required this.cardholdername,
    required this.transactiondate,
    this.appointmentid,
    this.orderid,
  });

  CardPaymentResponseModel copyWith({
    String? message,
    int? paymentid,
    String? amount,
    PaymentFor? paymentFor,
    String? paymentmethod,
    String? lastfourdigits,
    String? cardholdername,
    DateTime? transactiondate,
    int? appointmentid,
    int? orderid,
  }) => CardPaymentResponseModel(
    message: message ?? this.message,
    paymentid: paymentid ?? this.paymentid,
    amount: amount ?? this.amount,
    paymentFor: paymentFor ?? this.paymentFor,
    paymentmethod: paymentmethod ?? this.paymentmethod,
    lastfourdigits: lastfourdigits ?? this.lastfourdigits,
    cardholdername: cardholdername ?? this.cardholdername,
    transactiondate: transactiondate ?? this.transactiondate,
    appointmentid: appointmentid ?? this.appointmentid,
    orderid: orderid ?? this.orderid,
  );

  factory CardPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      CardPaymentResponseModel(
        message: json['message'],
        paymentid: json['paymentid'],
        amount: json['amount'],
        paymentFor: PaymentFor.fromJson(json['for']),
        paymentmethod: json['paymentmethod'],
        lastfourdigits: json['lastfourdigits'],
        cardholdername: json['cardholdername'],
        transactiondate: DateTime.parse(json['transactiondate']),
        appointmentid: json['appointmentid'],
        orderid: json['orderid'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'paymentid': paymentid,
    'amount': amount,
    'for': paymentFor.label,
    'paymentmethod': paymentmethod,
    'lastfourdigits': lastfourdigits,
    'cardholdername': cardholdername,
    'transactiondate': transactiondate.toIso8601String(),
    'appointmentid': appointmentid,
    'orderid': orderid,
  };
}
