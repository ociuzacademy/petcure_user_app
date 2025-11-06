// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class EditProfileHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController addressController;
  final ValueNotifier<File?> profileImage;
  const EditProfileHelper({
    required this.context,
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.addressController,
    required this.profileImage,
  });

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: 'Error: ${e.toString()}');
      }
    }
  }

  void editProfile() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      CustomSnackBar.showSuccess(
        context,
        message: 'Profile edited successfully',
      );
      Navigator.pushAndRemoveUntil(context, HomePage.route(), (route) => false);
    } else {
      CustomSnackBar.showError(
        context,
        message: 'Please enter valid values at all fields',
      );
    }
  }
}
