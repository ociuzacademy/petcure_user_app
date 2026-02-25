import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/register_module/class/user_register_details.dart';
import 'package:petcure_user_app/modules/register_module/models/user_register_model.dart';

class RegisterUserService {
  static Future<UserRegisterModel> registerUser({
    required UserRegisterDetails userRegisterDetails,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrls.userRegisterUrl),
      );

      request.fields['username'] = userRegisterDetails.username;
      request.fields['email'] = userRegisterDetails.email;
      request.fields['password'] = userRegisterDetails.password;
      request.fields['address'] = userRegisterDetails.address;
      request.fields['phone'] = userRegisterDetails.phoneNumber;
      request.fields['latitude'] = userRegisterDetails.location.latitude
          .toString();
      request.fields['longitude'] = userRegisterDetails.location.longitude
          .toString();
      request.fields['place'] = userRegisterDetails.place.placeValue;

      if (userRegisterDetails.image != null) {
        var imageStream = http.ByteStream(
          userRegisterDetails.image!.openRead(),
        );
        var imageLength = await userRegisterDetails.image!.length();
        var multipartFile = http.MultipartFile(
          'image',
          imageStream,
          imageLength,
          filename: userRegisterDetails.image!.path.split('/').last,
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

      if (resp.statusCode == 201) {
        final dynamic decoded = jsonDecode(responseBody);
        final UserRegisterModel response = UserRegisterModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('RegisterUserService: Request timeout - $e');
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
