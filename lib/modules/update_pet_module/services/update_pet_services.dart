import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/update_pet_module/class/update_pet_details.dart';
import 'package:petcure_user_app/modules/update_pet_module/models/pet_update_response_model.dart';

class UpdatePetServices {
  static Future<PetUpdateResponseModel> updatePetDetails({
    required int petId,
    required UpdatePetDetails petDetails,
  }) async {
    try {
      if (petDetails.isAllNull()) {
        throw Exception('You haven\'t provided anything to update.');
      }

      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse(AppUrls.updatePetUrl),
      );

      request.fields['pet_id'] = petId.toString();
      if (petDetails.petName != null) {
        request.fields['name'] = petDetails.petName!;
      }

      if (petDetails.birthDate != null) {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formattedDate = formatter.format(petDetails.birthDate!);
        request.fields['birth_date'] = formattedDate;
      }

      if (petDetails.gender != null) {
        request.fields['gender'] = petDetails.gender!.toLowerCase();
      }

      if (petDetails.weight != null) {
        request.fields['weight'] = petDetails.weight!.toString();
      }

      if (petDetails.healthCondition != null) {
        debugPrint('Health condition: ${petDetails.healthCondition}');
        request.fields['health_condition'] = petDetails.healthCondition!;
      }

      if (petDetails.petImage != null) {
        var imageStream = http.ByteStream(petDetails.petImage!.openRead());
        var imageLength = await petDetails.petImage!.length();
        var multipartFile = http.MultipartFile(
          'pet_image',
          imageStream,
          imageLength,
          filename: petDetails.petImage!.path.split('/').last,
        );
        request.files.add(multipartFile);
      }

      // Send request
      final resp = await request.send().timeout(
        const Duration(seconds: AppConstants.requestTimeoutSeconds),
        onTimeout: () {
          throw TimeoutException(
            'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
          );
        },
      );

      // Convert the response stream to a string
      final responseBody = await resp.stream.bytesToString();

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(responseBody);
        final PetUpdateResponseModel response = PetUpdateResponseModel.fromJson(
          decoded,
        );
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('UpdatePetServices: Request timeout - $e');
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
