// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) =>
    UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) =>
    json.encode(data.toJson());

class UserRegisterModel {
  final String status;
  final String message;
  final Data data;

  const UserRegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });

  UserRegisterModel copyWith({String? status, String? message, Data? data}) =>
      UserRegisterModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterModel(
        status: json['status'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}

class Data {
  final int id;
  final String username;
  final String email;
  final String address;
  final String password;
  final String phone;
  final String image;
  final String latitude;
  final String longitude;
  final int numberOfPets;

  const Data({
    required this.id,
    required this.username,
    required this.email,
    required this.address,
    required this.password,
    required this.phone,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.numberOfPets,
  });

  Data copyWith({
    int? id,
    String? username,
    String? email,
    String? address,
    String? password,
    String? phone,
    String? image,
    String? latitude,
    String? longitude,
    int? numberOfPets,
  }) => Data(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
    address: address ?? this.address,
    password: password ?? this.password,
    phone: phone ?? this.phone,
    image: image ?? this.image,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    numberOfPets: numberOfPets ?? this.numberOfPets,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    username: json['username'],
    email: json['email'],
    address: json['address'],
    password: json['password'],
    phone: json['phone'],
    image: json['image'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    numberOfPets: json['number_of_pets'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'address': address,
    'password': password,
    'phone': phone,
    'image': image,
    'latitude': latitude,
    'longitude': longitude,
    'number_of_pets': numberOfPets,
  };
}
