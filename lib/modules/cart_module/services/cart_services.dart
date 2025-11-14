import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/cart_module/exceptions/empty_cart_exception.dart';
import 'package:petcure_user_app/modules/cart_module/models/cart_item_update_quantity_response_model.dart';
import 'package:petcure_user_app/modules/cart_module/models/cart_items_model.dart';
import 'package:petcure_user_app/modules/cart_module/models/make_purchase_response_model.dart';

class CartServices {
  static Future<CartItemsModel> getUserCartItems({
    required String userId,
  }) async {
    try {
      final Map<String, dynamic> params = {'user_id': userId};

      final url = Uri.parse(
        AppUrls.getUserCartItemsUrl,
      ).replace(queryParameters: params);

      final resp = await http
          .get(
            url,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
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
        final response = CartItemsModel.fromJson(decoded);

        return response;
      } else if (resp.statusCode == 404) {
        // Handle 404 error specifically
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        final errorMessage = errorResponse['error']?.toString() ?? '';

        if (errorMessage.toLowerCase().contains('no items in the cart')) {
          throw EmptyCartException('Your cart is empty');
        } else {
          throw Exception(errorMessage);
        }
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['error'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('CartServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on EmptyCartException {
      rethrow;
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<CartItemUpdateQuantityResponseModel> updateCartItemQuantity({
    required int cartId,
    required int quantity,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'cart_id': cartId,
        'quantity': quantity,
      };

      final url = Uri.parse(AppUrls.updateCartItemQuantityUrl);

      final resp = await http
          .patch(
            url,
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
        final CartItemUpdateQuantityResponseModel response =
            CartItemUpdateQuantityResponseModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['error'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('MenuServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<MakePurchaseResponseModel> makePurchase({
    required String userId,
  }) async {
    try {
      final Map<String, dynamic> params = {'user_id': userId};

      final url = Uri.parse(AppUrls.makePurchaseUrl);

      final resp = await http
          .post(
            url,
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
        final MakePurchaseResponseModel response =
            MakePurchaseResponseModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['error'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('MenuServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
