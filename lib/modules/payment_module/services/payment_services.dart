import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:petcure_user_app/core/enums/payment_purpose.dart';
import 'package:petcure_user_app/modules/payment_module/classes/card_data.dart';
import 'package:petcure_user_app/modules/payment_module/classes/u_p_i_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/payment_module/models/card_payment_response_model.dart';
import 'package:petcure_user_app/modules/payment_module/models/upi_payment_response_model.dart';

class PaymentServices {
  static Future<UpiPaymentResponseModel> submitUpiPayment({
    required String userId,
    required UPIData upiData,
  }) async {
    try {
      Map<String, dynamic> params = {
        'amount': upiData.orderData.amount,
        'user': userId,
        'upi_id': upiData.upiId,
      };

      if (upiData.orderData.paymentPurpose == PaymentPurpose.order) {
        params['order_id'] = upiData.orderData.orderId;
      } else {
        params['appointment_id'] = upiData.orderData.appointmentId;
      }

      final resp = await http
          .post(
            Uri.parse(AppUrls.upiPaymentUrl),
            body: jsonEncode(params),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
            },
          )
          .timeout(
            const Duration(seconds: AppConstants.requestTimeoutSeconds),
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final UpiPaymentResponseModel response =
            UpiPaymentResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to make payment: ${errorResponse['detail'] ?? 'Unknown error'}',
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('PaymentServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Server error');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  static Future<CardPaymentResponseModel> submitCardPayment({
    required String userId,
    required CardData cardData,
  }) async {
    try {
      Map<String, dynamic> params = {
        'user': userId,
        'amount': cardData.orderData.amount,
        'cardholder_name': cardData.cardHolderName,
        'card_number': cardData.cardNumber,
        'expiry_date': cardData.expiryDate,
        'cvv_number': cardData.cvvNumber,
      };

      if (cardData.orderData.paymentPurpose == PaymentPurpose.order) {
        params['order_id'] = cardData.orderData.orderId;
      } else {
        params['appointment_id'] = cardData.orderData.appointmentId;
      }

      final resp = await http
          .post(
            Uri.parse(AppUrls.cardPaymentUrl),
            body: jsonEncode(params),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
            },
          )
          .timeout(
            const Duration(seconds: AppConstants.requestTimeoutSeconds),
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final CardPaymentResponseModel response =
            CardPaymentResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to make payment: ${errorResponse['error'] ?? 'Unknown error'}',
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('PaymentServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Server error');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
