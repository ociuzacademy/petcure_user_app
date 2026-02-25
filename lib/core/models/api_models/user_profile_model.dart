// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  final int id;
  final String username;
  final String email;
  final String address;
  final String place;
  final String password;
  final String phone;
  final String? image;
  final String latitude;
  final String longitude;
  final int numberOfPets;

  const UserProfileModel({
    required this.id,
    required this.username,
    required this.email,
    required this.address,
    required this.place,
    required this.password,
    required this.phone,
    this.image,
    required this.latitude,
    required this.longitude,
    required this.numberOfPets,
  });

  UserProfileModel copyWith({
    int? id,
    String? username,
    String? email,
    String? address,
    String? place,
    String? password,
    String? phone,
    String? image,
    String? latitude,
    String? longitude,
    int? numberOfPets,
  }) => UserProfileModel(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
    address: address ?? this.address,
    place: place ?? this.place,
    password: password ?? this.password,
    phone: phone ?? this.phone,
    image: image ?? this.image,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    numberOfPets: numberOfPets ?? this.numberOfPets,
  );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        address: json['address'],
        place: json['place'],
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
    'place': place,
    'password': password,
    'phone': phone,
    'image': image,
    'latitude': latitude,
    'longitude': longitude,
    'number_of_pets': numberOfPets,
  };
}
