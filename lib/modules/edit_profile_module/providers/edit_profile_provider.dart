import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/models/api_models/user_profile_model.dart';
import 'package:petcure_user_app/modules/edit_profile_module/classes/edit_profile_data.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class EditProfileProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  // Focus Nodes
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();

  // State Variables
  UserProfileModel? _currentUserProfileData;
  File? _profileImage;
  String? _initialProfileImageUrl;
  bool _isLoadingImage = false;
  bool _isUpdatingProfile = false;
  bool _isLoadingLocation = false;

  // Getters
  UserProfileModel? get currentUserProfileData => _currentUserProfileData;
  File? get profileImage => _profileImage;
  String? get initialProfileImageUrl => _initialProfileImageUrl;
  bool get isLoadingImage => _isLoadingImage;
  bool get isUpdatingProfile => _isUpdatingProfile;
  bool get isLoadingLocation => _isLoadingLocation;

  // Setters with notifyListeners
  set profileImage(File? value) {
    _profileImage = value;
    notifyListeners();
  }

  set isLoadingImage(bool value) {
    _isLoadingImage = value;
    notifyListeners();
  }

  set isLoadingLocation(bool value) {
    _isLoadingLocation = value;
    notifyListeners();
  }

  set isUpdatingProfile(bool value) {
    _isUpdatingProfile = value;
    notifyListeners();
  }

  // Load initial user data (replace with actual API call)
  Future<void> loadUserData(UserProfileModel userProfileData) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _currentUserProfileData = userProfileData;

    usernameController.text = userProfileData.username;
    emailController.text = userProfileData.email;
    phoneNumberController.text = userProfileData.phone;
    passwordController.text = userProfileData.password;
    addressController.text = userProfileData.address;
    latitudeController.text = userProfileData.latitude;
    longitudeController.text = userProfileData.longitude;
    _initialProfileImageUrl = '${AppUrls.baseUrl}${userProfileData.image}';

    notifyListeners();
  }

  // Image picking method
  Future<void> pickImage(BuildContext context) async {
    try {
      isLoadingImage = true;

      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: 'Error picking image: ${e.toString()}',
        );
      }
    } finally {
      isLoadingImage = false;
    }
  }

  // Location method
  Future<void> getCurrentLocation(BuildContext context) async {
    isLoadingLocation = true;

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        CustomSnackBar.showError(
          context,
          message: 'Location services are disabled.',
        );
        isLoadingLocation = false;
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (!context.mounted) return;
          CustomSnackBar.showError(
            context,
            message: 'Location permissions are denied',
          );
          isLoadingLocation = false;
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (!context.mounted) return;
        CustomSnackBar.showError(
          context,
          message:
              'Location permissions are permanently denied, we cannot request permissions.',
        );
        isLoadingLocation = false;
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Update the text fields with the coordinates
      latitudeController.text = position.latitude.toStringAsFixed(6);
      longitudeController.text = position.longitude.toStringAsFixed(6);

      if (!context.mounted) return;
      CustomSnackBar.showSuccess(
        context,
        message:
            'Location fetched: ${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}',
      );
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: 'Error getting location: $e',
        );
      }
    } finally {
      isLoadingLocation = false;
    }
  }

  // Validation methods
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter username';
    }

    // Allow only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Please enter a valid username (letters and spaces only)';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }

    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    if (!emailValid) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }

    bool phoneValid = RegExp(r'^(\+91[\-\s]?)?[6-9]\d{9}$').hasMatch(value);
    if (!phoneValid) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please add your address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }

    if (value.length < 3) {
      return 'Password must be at least 3 characters';
    }
    return null;
  }

  String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please get your location';
    }
    return null;
  }

  // Check if form is valid and prepare data for registration
  EditProfileData? validateForm(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!formKey.currentState!.validate()) {
      CustomSnackBar.showError(
        context,
        message: 'Please fill all the fields correctly',
      );
      return null;
    }

    if (latitudeController.text.isEmpty || longitudeController.text.isEmpty) {
      CustomSnackBar.showError(
        context,
        message: 'Please get your location coordinates',
      );
      return null;
    }

    final String username = usernameController.text.trim();
    final String email = emailController.text.trim();
    final String phoneNumber = phoneNumberController.text.trim();
    final String address = addressController.text.trim();
    final double latitude = double.parse(latitudeController.text.trim());
    final double longitude = double.parse(longitudeController.text.trim());
    final String password = passwordController.text.trim();

    return EditProfileData(
      username: _currentUserProfileData!.username != username ? username : null,
      email: _currentUserProfileData!.email != email ? email : null,
      phoneNumber: _currentUserProfileData!.phone != phoneNumber
          ? phoneNumber
          : null,
      address: _currentUserProfileData!.address != address ? address : null,
      location: UpdatedLocation(
        latitude: double.parse(_currentUserProfileData!.latitude) != latitude
            ? latitude
            : null,
        longitude: double.parse(_currentUserProfileData!.longitude) != longitude
            ? longitude
            : null,
      ),
      password: _currentUserProfileData!.password != password ? password : null,
      image: profileImage,
    );
  }

  // Clear form method (optional, for completeness)
  void clearForm() {
    usernameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    addressController.clear();
    latitudeController.clear();
    longitudeController.clear();
    profileImage = null;
    _initialProfileImageUrl = null;
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    addressController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();

    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    addressFocusNode.dispose();

    super.dispose();
  }
}
