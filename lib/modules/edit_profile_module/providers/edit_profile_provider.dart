import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class EditProfileProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Focus Nodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();

  // State Variables
  File? _profileImage;
  String? _initialProfileImageUrl;
  bool _isLoadingImage = false;
  bool _isUpdatingProfile = false;

  // Getters
  File? get profileImage => _profileImage;
  String? get initialProfileImageUrl => _initialProfileImageUrl;
  bool get isLoadingImage => _isLoadingImage;
  bool get isUpdatingProfile => _isUpdatingProfile;

  // Setters with notifyListeners
  set profileImage(File? value) {
    _profileImage = value;
    notifyListeners();
  }

  set isLoadingImage(bool value) {
    _isLoadingImage = value;
    notifyListeners();
  }

  set isUpdatingProfile(bool value) {
    _isUpdatingProfile = value;
    notifyListeners();
  }

  // Load initial user data (replace with actual API call)
  Future<void> loadUserData() async {
    await Future.delayed(const Duration(milliseconds: 500));

    fullNameController.text = 'John Doe';
    emailController.text = 'user@email.com';
    phoneNumberController.text = '+91 9876543210';
    passwordController.text = 'password123';
    addressController.text =
        '3058 Peck Court, Costa Mesa, California, 92627, United States.';
    _initialProfileImageUrl = 'https://i.pravatar.cc/300';

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

  // Validation methods
  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter full name';
    }

    // Allow only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name (letters and spaces only)';
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

  // Update profile method
  Future<void> updateProfile(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (!formKey.currentState!.validate()) {
      CustomSnackBar.showError(
        context,
        message: 'Please enter valid values in all fields',
      );
      return;
    }

    isUpdatingProfile = true;

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (context.mounted) {
        CustomSnackBar.showSuccess(
          context,
          message: 'Profile updated successfully',
        );

        Navigator.pushAndRemoveUntil(
          context,
          HomePage.route(),
          (route) => false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: 'Error updating profile: ${e.toString()}',
        );
      }
    } finally {
      isUpdatingProfile = false;
    }
  }

  // Clear form method (optional, for completeness)
  void clearForm() {
    fullNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    addressController.clear();
    profileImage = null;
    _initialProfileImageUrl = null;
    notifyListeners();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    addressController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    addressFocusNode.dispose();

    super.dispose();
  }
}
