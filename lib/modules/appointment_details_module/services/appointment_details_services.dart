import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';

class AppointmentDetailsServices {
  static Future<AppointmentDetailsModel> getAppointmentDetails({
    required int bookingId,
  }) async {
    try {
      final Map<String, dynamic> params = {'booking_id': bookingId.toString()};

      final url = Uri.parse(
        AppUrls.appointmentDetailsUrl,
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
        final response = AppointmentDetailsModel.fromJson(decoded);

        return response;
      } else if (resp.statusCode == 404) {
        // Handle 404 error specifically
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        final errorMessage = errorResponse['error']?.toString() ?? '';

        throw Exception(errorMessage);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['error'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('AppointmentDetailsServices: Request timeout - $e');
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
