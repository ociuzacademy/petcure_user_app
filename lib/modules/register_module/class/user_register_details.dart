// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class UserRegisterDetails {
  final String username;
  final String email;
  final String phoneNumber;
  final String address;
  final Location location;
  final String password;
  final File image;
  const UserRegisterDetails({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.location,
    required this.password,
    required this.image,
  });
}

class Location {
  final double latitude;
  final double longitude;
  const Location({required this.latitude, required this.longitude});
}
