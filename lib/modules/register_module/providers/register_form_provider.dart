// register_form_provider.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_user_app/modules/register_module/class/user_register_details.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class RegisterFormProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();

  File? _profileImage;
  bool _isLoadingLocation = false;
  bool _isRegistering = false;

  // Getters
  File? get profileImage => _profileImage;
  bool get isLoadingLocation => _isLoadingLocation;
  bool get isRegistering => _isRegistering;

  // Setters with notifyListeners
  set profileImage(File? value) {
    _profileImage = value;
    notifyListeners();
  }

  set isLoadingLocation(bool value) {
    _isLoadingLocation = value;
    notifyListeners();
  }

  set isRegistering(bool value) {
    _isRegistering = value;
    notifyListeners();
  }

  // Image picking method
  Future<void> pickImage(BuildContext context) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: 'Error: ${e.toString()}');
      }
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
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
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

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
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
  UserRegisterDetails? validateForm(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!formKey.currentState!.validate()) {
      CustomSnackBar.showError(
        context,
        message: 'Please fill all the fields correctly',
      );
      return null;
    }

    if (profileImage == null) {
      CustomSnackBar.showError(
        context,
        message: 'Please upload your profile picture',
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

    return UserRegisterDetails(
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      address: addressController.text.trim(),
      location: Location(
        latitude: double.parse(latitudeController.text.trim()),
        longitude: double.parse(longitudeController.text.trim()),
      ),
      password: passwordController.text.trim(),
      image: profileImage!,
    );
  }

  // Clear form method
  void clearForm() {
    usernameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    addressController.clear();
    latitudeController.clear();
    longitudeController.clear();
    profileImage = null;
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
