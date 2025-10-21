import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/login_module/models/login_model.dart';

class Login {
  static Future<LoginModel> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> params = {"email": email, "password": password};

      final resp = await http.post(
        Uri.parse(AppUrls.loginUrl),
        body: jsonEncode(params),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
        },
      );

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final LoginModel response = LoginModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to login: ${errorResponse['message'] ?? 'Unknown error'}',
        );
      }
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
