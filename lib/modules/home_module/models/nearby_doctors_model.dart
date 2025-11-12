// To parse this JSON data, do
//
//     final nearbyDoctorsModel = nearbyDoctorsModelFromJson(jsonString);

import 'dart:convert';

NearbyDoctorsModel nearbyDoctorsModelFromJson(String str) =>
    NearbyDoctorsModel.fromJson(json.decode(str));

String nearbyDoctorsModelToJson(NearbyDoctorsModel data) =>
    json.encode(data.toJson());

class NearbyDoctorsModel {
  final List<Doctor> doctors;

  const NearbyDoctorsModel({required this.doctors});

  NearbyDoctorsModel copyWith({List<Doctor>? doctors}) =>
      NearbyDoctorsModel(doctors: doctors ?? this.doctors);

  factory NearbyDoctorsModel.fromJson(Map<String, dynamic> json) =>
      NearbyDoctorsModel(
        doctors: List<Doctor>.from(
          json['doctors'].map((x) => Doctor.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    'doctors': List<dynamic>.from(doctors.map((x) => x.toJson())),
  };
}

class Doctor {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final double latitude;
  final double longitude;
  final String image;
  final String idCard;
  final double distanceKm;

  const Doctor({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.idCard,
    required this.distanceKm,
  });

  Doctor copyWith({
    int? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? address,
    double? latitude,
    double? longitude,
    String? image,
    String? idCard,
    double? distanceKm,
  }) => Doctor(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    address: address ?? this.address,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    image: image ?? this.image,
    idCard: idCard ?? this.idCard,
    distanceKm: distanceKm ?? this.distanceKm,
  );

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'],
    fullName: json['full_name'],
    email: json['email'],
    phoneNumber: json['phone_number'],
    address: json['address'],
    latitude: json['latitude']?.toDouble(),
    longitude: json['longitude']?.toDouble(),
    image: json['image'],
    idCard: json['id_card'],
    distanceKm: json['distance_km']?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'email': email,
    'phone_number': phoneNumber,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
    'image': image,
    'id_card': idCard,
    'distance_km': distanceKm,
  };
}
