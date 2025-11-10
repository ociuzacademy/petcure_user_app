import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/edit_profile_module/classes/edit_profile_data.dart';
import 'package:petcure_user_app/modules/edit_profile_module/model/update_user_profile_response_model.dart';

class EditProfileServices {
  static Future<UpdateUserProfileResponseModel> registerUser({
    required String userId,
    required EditProfileData updatedProfileData,
  }) async {
    try {
      if (_isUpdatedDataEmpty(updatedProfileData)) {
        throw TimeoutException('You haven\'t provided anything to update.');
      }

      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse(AppUrls.editProfileUrl),
      );

      request.fields['user_id'] = userId;
      if (updatedProfileData.username != null) {
        request.fields['username'] = updatedProfileData.username!;
      }
      if (updatedProfileData.email != null) {
        request.fields['email'] = updatedProfileData.email!;
      }

      if (updatedProfileData.password != null) {
        request.fields['password'] = updatedProfileData.password!;
      }

      if (updatedProfileData.address != null) {
        request.fields['address'] = updatedProfileData.address!;
      }

      if (updatedProfileData.phoneNumber != null) {
        request.fields['phone'] = updatedProfileData.phoneNumber!;
      }

      if (updatedProfileData.location.latitude != null) {
        request.fields['latitude'] = updatedProfileData.location.latitude
            .toString();
      }

      if (updatedProfileData.location.longitude != null) {
        request.fields['longitude'] = updatedProfileData.location.longitude
            .toString();
      }

      if (updatedProfileData.image != null) {
        var imageStream = http.ByteStream(updatedProfileData.image!.openRead());
        var imageLength = await updatedProfileData.image!.length();
        var multipartFile = http.MultipartFile(
          'image',
          imageStream,
          imageLength,
          filename: updatedProfileData.image!.path.split('/').last,
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
        final UpdateUserProfileResponseModel response =
            UpdateUserProfileResponseModel.fromJson(decoded);
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

  static bool _isUpdatedDataEmpty(EditProfileData updatedProfileData) {
    return updatedProfileData.username != null &&
        updatedProfileData.email != null &&
        updatedProfileData.phoneNumber != null &&
        updatedProfileData.address != null &&
        updatedProfileData.location.latitude != null &&
        updatedProfileData.location.longitude != null &&
        updatedProfileData.password != null &&
        updatedProfileData.image != null;
  }
}
