import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/add_pet_module/class/add_pet_details.dart';
import 'package:petcure_user_app/modules/add_pet_module/models/add_pet_response_model.dart';

class AddPetServices {
  static Future<AddPetResponseModel> addPet({
    required AddPetDetails petDetails,
    required String userId,
  }) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(AppUrls.addPetUrl));

      request.fields['user_id'] = userId;
      debugPrint('User ID: $userId');
      request.fields['name'] = petDetails.name;
      debugPrint('Name: ${petDetails.name}');
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(petDetails.birthDate);
      debugPrint('Birth date: $formattedDate');
      request.fields['birth_date'] = formattedDate;
      debugPrint('Gender: ${petDetails.gender.toLowerCase()}');
      request.fields['gender'] = petDetails.gender.toLowerCase();
      debugPrint('Category ID: ${petDetails.categoryid}');
      request.fields['category'] = petDetails.categoryid.toString();
      debugPrint('Sub Category ID: ${petDetails.subCategoryId}');
      request.fields['sub_category'] = petDetails.subCategoryId.toString();
      debugPrint('Weight: ${petDetails.weight}');
      request.fields['weight'] = petDetails.weight.toString();
      if (petDetails.healthCondition != null) {
        debugPrint('Health condition: ${petDetails.healthCondition}');
        request.fields['health_condition'] = petDetails.healthCondition!;
      }

      var imageStream = http.ByteStream(petDetails.petImage.openRead());
      var imageLength = await petDetails.petImage.length();
      var multipartFile = http.MultipartFile(
        'pet_image',
        imageStream,
        imageLength,
        filename: petDetails.petImage.path.split("/").last,
      );
      request.files.add(multipartFile);

      // Send request
      final resp = await request.send().timeout(
        Duration(seconds: AppConstants.requestTimeoutSeconds),
        onTimeout: () {
          throw TimeoutException(
            'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
          );
        },
      );

      // Convert the response stream to a string
      final responseBody = await resp.stream.bytesToString();

      if (resp.statusCode == 201) {
        final dynamic decoded = jsonDecode(responseBody);
        final AddPetResponseModel response = AddPetResponseModel.fromJson(
          decoded,
        );
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
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
