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
  final int paymentId;
  final String amount;
  final PaymentFor paymentFor;
  final String paymentMethod;
  final String lastFourDigits;
  final String cardholderName;
  final DateTime transactionDate;
  final int? orderId;
  final int? appointmentId;

  CardPaymentResponseModel({
    required this.message,
    required this.paymentId,
    required this.amount,
    required this.paymentFor,
    required this.paymentMethod,
    required this.lastFourDigits,
    required this.cardholderName,
    required this.transactionDate,
    this.orderId,
    this.appointmentId,
  });

  CardPaymentResponseModel copyWith({
    String? message,
    int? paymentId,
    String? amount,
    PaymentFor? paymentFor,
    String? paymentMethod,
    String? lastFourDigits,
    String? cardholderName,
    DateTime? transactionDate,
    int? orderId,
    int? appointmentId,
  }) => CardPaymentResponseModel(
    message: message ?? this.message,
    paymentId: paymentId ?? this.paymentId,
    amount: amount ?? this.amount,
    paymentFor: paymentFor ?? this.paymentFor,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    lastFourDigits: lastFourDigits ?? this.lastFourDigits,
    cardholderName: cardholderName ?? this.cardholderName,
    transactionDate: transactionDate ?? this.transactionDate,
    orderId: orderId ?? this.orderId,
    appointmentId: appointmentId ?? this.appointmentId,
  );

  factory CardPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      CardPaymentResponseModel(
        message: json['message'],
        paymentId: json['payment_id'],
        amount: json['amount'],
        paymentFor: PaymentFor.fromLabel(json['for']),
        paymentMethod: json['payment_method'],
        lastFourDigits: json['last_four_digits'],
        cardholderName: json['cardholder_name'],
        transactionDate: DateTime.parse(json['transaction_date']),
        orderId: json['order_id'],
        appointmentId: json['appointment_id'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'payment_id': paymentId,
    'amount': amount,
    'for': paymentFor.label,
    'payment_method': paymentMethod,
    'last_four_digits': lastFourDigits,
    'cardholder_name': cardholderName,
    'transaction_date':
        "${transactionDate.year.toString().padLeft(4, '0')}-${transactionDate.month.toString().padLeft(2, '0')}-${transactionDate.day.toString().padLeft(2, '0')}",
    'order_id': orderId,
    'appointment_id': appointmentId,
  };
}
