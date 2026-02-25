// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:petcure_user_app/core/models/location.dart';
import 'package:petcure_user_app/core/models/place_model.dart';

class UserRegisterDetails {
  final String username;
  final String email;
  final String phoneNumber;
  final String address;
  final Location location;
  final String password;
  final File? image;
  final PlaceModel place;
  const UserRegisterDetails({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.location,
    required this.password,
    this.image,
    required this.place,
  });
}
