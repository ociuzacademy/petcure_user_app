// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/core/models/age.dart';

import 'package:petcure_user_app/modules/login_module/view/login_page.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class AddPetHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController petNameController;
  final TextEditingController weightController;
  final TextEditingController medicalConditionController;
  final TextEditingController ageYearsController;
  final TextEditingController ageMonthsController;
  final ValueNotifier<File?> imageFile;
  final ValueNotifier<String?> selectedGender;
  final ValueNotifier<bool> havingSpecificHealthCondition;
  final ValueNotifier<String?> selectedCategory;
  final ValueNotifier<String?> selectedSubCategory;
  final ValueNotifier<DateTime?> birthDate;
  const AddPetHelper({
    required this.context,
    required this.formKey,
    required this.petNameController,
    required this.weightController,
    required this.medicalConditionController,
    required this.ageYearsController,
    required this.ageMonthsController,
    required this.imageFile,
    required this.selectedGender,
    required this.havingSpecificHealthCondition,
    required this.selectedCategory,
    required this.selectedSubCategory,
    required this.birthDate,
  });

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        imageFile.value = File(pickedImage.path);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: 'Error: ${e.toString()}');
      }
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );

      if (pickedImage != null) {
        imageFile.value = File(pickedImage.path);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: 'Error: ${e.toString()}');
      }
    }
  }

  Future<void> selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      birthDate.value = picked;
      final Age age = AppHelpers.calculateAge(picked);
      ageYearsController.text = age.ageInYears.toString();
      ageMonthsController.text = age.ageInMonths.toString();
    }
  }

  void addPet() {
    FocusScope.of(context).unfocus();

    if (havingSpecificHealthCondition.value &&
        medicalConditionController.text.isEmpty) {
      CustomSnackBar.showError(
        context,
        message:
            "If your pet has any specific medical condition, please specify.",
      );
      return;
    }

    if (formKey.currentState!.validate()) {
      if (selectedCategory.value != null && selectedSubCategory.value != null) {
        // Parse age
        int years = int.tryParse(ageYearsController.text) ?? 0;
        int months = int.tryParse(ageMonthsController.text) ?? 0;

        if (years == 0 && months == 0) {
          CustomSnackBar.showError(
            context,
            message: "Please enter a valid age.",
          );
          return;
        }

        double weight = double.tryParse(weightController.text.trim()) ?? 0;
        if (weight == 0.0) {
          CustomSnackBar.showError(
            context,
            message: "Please enter a valid weight.",
          );
          return;
        }

        if (imageFile.value == null) {
          CustomSnackBar.showError(
            context,
            message: "Please upload your pet's image.",
          );
          return;
        }

        if (selectedGender.value == null) {
          CustomSnackBar.showError(
            context,
            message: "Please select the gender of your pet.",
          );
          return;
        }

        CustomSnackBar.showSuccess(
          context,
          message: 'You have added your pet successfully.',
        );
        Navigator.pushAndRemoveUntil(
          context,
          LoginPage.route(),
          (route) => false,
        );
      } else {
        CustomSnackBar.showError(
          context,
          message: "Please select both category and sub-category.",
        );
      }
    } else {
      CustomSnackBar.showError(
        context,
        message: "Please add data in all required fields.",
      );
    }
  }
}
