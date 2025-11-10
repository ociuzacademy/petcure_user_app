// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class EditProfileData {
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final UpdatedLocation location;
  final String? password;
  final File? image;
  const EditProfileData({
    this.username,
    this.email,
    this.phoneNumber,
    this.address,
    required this.location,
    this.password,
    this.image,
  });
}

class UpdatedLocation {
  final double? latitude;
  final double? longitude;
  const UpdatedLocation({this.latitude, this.longitude});
}
