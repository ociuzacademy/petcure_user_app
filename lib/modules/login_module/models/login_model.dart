// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String status;
  final String message;
  final String userId;
  final Data data;

  const LoginModel({
    required this.status,
    required this.message,
    required this.userId,
    required this.data,
  });

  LoginModel copyWith({
    String? status,
    String? message,
    String? userId,
    Data? data,
  }) => LoginModel(
    status: status ?? this.status,
    message: message ?? this.message,
    userId: userId ?? this.userId,
    data: data ?? this.data,
  );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json['status'],
    message: json['message'],
    userId: json['user_id'],
    data: Data.fromJson(json['data']),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'user_id': userId,
    'data': data.toJson(),
  };
}

class Data {
  final String email;
  final String password;

  const Data({required this.email, required this.password});

  Data copyWith({String? email, String? password}) =>
      Data(email: email ?? this.email, password: password ?? this.password);

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(email: json['email'], password: json['password']);

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
