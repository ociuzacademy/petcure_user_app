import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:petcure_user_app/modules/payment_module/classes/card_data.dart';
import 'package:petcure_user_app/modules/payment_module/classes/u_p_i_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/payment_module/models/payment_response_model.dart';

class PaymentServices {
  static Future<PaymentResponseModel> submitUpiPayment({
    required String userId,
    required UPIData upiData,
  }) async {
    try {
      Map<String, dynamic> params = {
        'order': upiData.orderData.orderId,
        'amount': upiData.orderData.amount,
        'user': userId,
        'upi_id': upiData.upiId,
      };

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

      if (resp.statusCode == 201) {
        final dynamic decoded = jsonDecode(resp.body);
        final PaymentResponseModel response = PaymentResponseModel.fromJson(
          decoded,
        );
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to login: ${errorResponse['message'] ?? 'Unknown error'}',
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('MenuServices: Request timeout - $e');
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

  static Future<PaymentResponseModel> submitCardPayment({
    required String userId,
    required CardData cardData,
  }) async {
    try {
      Map<String, dynamic> params = {
        'user': userId,
        'order': cardData.orderData.orderId,
        'amount': cardData.orderData.amount,
        'card_holder_name': cardData.cardHolderName,
        'card_number': cardData.cardNumber,
        'expiry_date': cardData.expiryDate,
        'cvv': cardData.cvvNumber,
      };

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

      if (resp.statusCode == 201) {
        final dynamic decoded = jsonDecode(resp.body);
        final PaymentResponseModel response = PaymentResponseModel.fromJson(
          decoded,
        );
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to login: ${errorResponse['message'] ?? 'Unknown error'}',
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('MenuServices: Request timeout - $e');
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
