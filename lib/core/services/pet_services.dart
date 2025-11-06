// pet_services.dart

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/models/api_models/pet_category_model.dart';
import 'package:petcure_user_app/core/models/api_models/pet_sub_category_model.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart';

class PetServices {
  static Future<List<PetCategoryModel>> getPetCategoryList() async {
    try {
      final url = Uri.parse(AppUrls.getPetCategoryListUrl);

      final resp = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (resp.statusCode == 200) {
        final List<dynamic> decoded = jsonDecode(resp.body);
        final response = decoded
            .map((item) => PetCategoryModel.fromJson(item))
            .toList();

        return response;
      } else {
        throw Exception('Failed to load response');
      }
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

  static Future<PetSubCategoryModel> getPetSubCategoryList({
    required int categoryId,
  }) async {
    try {
      Map<String, dynamic> params = {'category_id': categoryId.toString()};

      // Construct the URL with query parameters
      final url = Uri.parse(
        AppUrls.getPetSubCategoryListUrl,
      ).replace(queryParameters: params);

      final resp = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final response = PetSubCategoryModel.fromJson(decoded);

        return response;
      } else {
        throw Exception('Failed to load response');
      }
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

  static Future<UserPetsModel> getUserPets(String userId) async {
    try {
      Map<String, dynamic> params = {'user_id': userId.toString()};

      final url = Uri.parse(
        AppUrls.getUserPetsUrl,
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
        final response = UserPetsModel.fromJson(decoded);

        debugPrint(response.toString());

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception('${errorResponse['message'] ?? 'Unknown error'}');
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
