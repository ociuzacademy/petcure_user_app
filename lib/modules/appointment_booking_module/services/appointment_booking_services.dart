import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/classes/appointment_booking_data.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/model/appointment_booking_response_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/model/slots_model.dart';

class AppointmentBookingServices {
  static Future<SlotsModel> getSlotsList({
    required int doctorId,
    required DateTime date,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'doctor_id': doctorId.toString(),
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };

      final url = Uri.parse(
        AppUrls.viewSlotsListUrl,
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
        final response = SlotsModel.fromJson(decoded);

        return response;
      } else {
        throw Exception('Failed to load response');
      }
    } on TimeoutException catch (e) {
      debugPrint('AppointmentBookingServices: Request timeout - $e');
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

  static Future<AppointmentBookingResponseModel> bookAppointment({
    required AppointmentBookingData appointmentBookingData,
  }) async {
    debugPrint(
      'AppointmentBookingServices: Appointment type: ${appointmentBookingData.bookingOption.label}',
    );
    try {
      final Map<String, dynamic> params = appointmentBookingData.toJson();

      debugPrint('AppointmentBookingServices: Params: $params');

      final url = Uri.parse(AppUrls.bookAppointmentUrl);

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
        final AppointmentBookingResponseModel response =
            AppointmentBookingResponseModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('AppointmentBookingServices: Request timeout - $e');
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
