// pet_services.dart

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/models/api_models/pet_category_model.dart';
import 'package:petcure_user_app/core/models/api_models/pet_sub_category_model.dart';

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
      Map<String, dynamic> params = {"category_id": categoryId.toString()};

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
}
