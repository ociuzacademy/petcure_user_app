// add_pet_form_provider.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_user_app/core/cubit/pet_category/pet_category_cubit.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/core/models/age.dart';
import 'package:petcure_user_app/core/models/api_models/pet_category_model.dart';
import 'package:petcure_user_app/core/models/api_models/pet_sub_category_model.dart';
import 'package:petcure_user_app/modules/add_pet_module/class/add_pet_details.dart';
import 'package:petcure_user_app/modules/add_pet_module/cubit/pet_sub_category_cubit.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class AddPetFormProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController medicalConditionController =
      TextEditingController();
  final TextEditingController ageYearsController = TextEditingController();
  final TextEditingController ageMonthsController = TextEditingController();

  // Focus Nodes
  final FocusNode petNameFocusNode = FocusNode();
  final FocusNode weightFocusNode = FocusNode();
  final FocusNode medicalConditionFocusNode = FocusNode();

  // State variables
  File? _imageFile;
  DateTime? _birthDate;
  String? _selectedGender;
  bool _havingSpecificHealthCondition = false;
  PetCategoryModel? _selectedCategory;
  Subcategory? _selectedSubCategory;
  bool _isLoading = false;

  // Getters
  File? get imageFile => _imageFile;
  DateTime? get birthDate => _birthDate;
  String? get selectedGender => _selectedGender;
  bool get havingSpecificHealthCondition => _havingSpecificHealthCondition;
  PetCategoryModel? get selectedCategory => _selectedCategory;
  Subcategory? get selectedSubCategory => _selectedSubCategory;
  bool get isLoading => _isLoading;

  // Setters with notifyListeners
  set imageFile(File? value) {
    _imageFile = value;
    notifyListeners();
  }

  set birthDate(DateTime? value) {
    _birthDate = value;
    notifyListeners();
  }

  set selectedGender(String? value) {
    _selectedGender = value;
    notifyListeners();
  }

  set havingSpecificHealthCondition(bool value) {
    _havingSpecificHealthCondition = value;
    notifyListeners();
  }

  set selectedCategory(PetCategoryModel? value) {
    _selectedCategory = value;
    _selectedSubCategory = null; // Reset subcategory when category changes
    notifyListeners();
  }

  set selectedSubCategory(Subcategory? value) {
    _selectedSubCategory = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Image picking methods
  Future<void> pickImageFromGallery(BuildContext context) async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: 'Error: ${e.toString()}');
      }
    }
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: 'Error: ${e.toString()}');
      }
    }
  }

  // Date selection
  Future<void> selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      birthDate = picked;
      final Age age = AppHelpers.calculateAge(picked);
      ageYearsController.text = age.ageInYears.toString();
      ageMonthsController.text = age.ageInMonths.toString();
      notifyListeners();
    }
  }

  // Category methods
  void getPetCategories(BuildContext context) {
    final PetCategoryCubit petCategoryCubit = context.read<PetCategoryCubit>();
    petCategoryCubit.getPetCategories();
  }

  void getPetSubCategories(BuildContext context, int categoryId) {
    final PetSubCategoryCubit petSubCategoryCubit = context
        .read<PetSubCategoryCubit>();
    petSubCategoryCubit.getPetSubCategories(categoryId);
  }

  // Validation methods
  String? validatePetName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter pet name';
    }
    return null;
  }

  String? validateAgeYears(String? value) {
    if (value == null || value.isEmpty) {
      return 'Years';
    }
    return null;
  }

  String? validateAgeMonths(String? value) {
    if (value == null || value.isEmpty) {
      return 'Months';
    }
    int? months = int.tryParse(value);
    if (months != null && (months < 0 || months > 11)) {
      return '0-11 only';
    }
    return null;
  }

  String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter weight';
    }
    return null;
  }

  String? validateMedicalCondition(String? value) {
    if (havingSpecificHealthCondition && (value == null || value.isEmpty)) {
      return 'Please enter medical condition';
    }
    return null;
  }

  // Form submission validation
  AddPetDetails? validateForm(BuildContext context) {
    FocusScope.of(context).unfocus();

    // Check health condition
    if (havingSpecificHealthCondition &&
        medicalConditionController.text.isEmpty) {
      CustomSnackBar.showError(
        context,
        message:
            'If your pet has any specific medical condition, please specify.',
      );
      return null;
    }

    // Validate form fields
    if (!formKey.currentState!.validate()) {
      CustomSnackBar.showError(
        context,
        message: 'Please add data in all required fields.',
      );
      return null;
    }

    // Check category and subcategory
    if (selectedCategory == null || selectedSubCategory == null) {
      CustomSnackBar.showError(
        context,
        message: 'Please select both category and sub-category.',
      );
      return null;
    }

    // Validate age
    int years = int.tryParse(ageYearsController.text) ?? 0;
    int months = int.tryParse(ageMonthsController.text) ?? 0;
    if (years == 0 && months == 0) {
      CustomSnackBar.showError(context, message: 'Please enter a valid age.');
      return null;
    }

    // Validate weight
    double weight = double.tryParse(weightController.text.trim()) ?? 0;
    if (weight == 0.0) {
      CustomSnackBar.showError(
        context,
        message: 'Please enter a valid weight.',
      );
      return null;
    }

    // Validate image
    if (imageFile == null) {
      CustomSnackBar.showError(
        context,
        message: "Please upload your pet's image.",
      );
      return null;
    }

    // Validate gender
    if (selectedGender == null) {
      CustomSnackBar.showError(
        context,
        message: 'Please select the gender of your pet.',
      );
      return null;
    }

    final AddPetDetails petDetails = AddPetDetails(
      name: petNameController.text.trim(),
      birthDate: birthDate!,
      gender: _selectedGender!,
      categoryid: _selectedCategory!.id,
      subCategoryId: _selectedSubCategory!.petsubcategoryId,
      weight: double.parse(weightController.text.trim()),
      petImage: _imageFile!,
    );

    return petDetails;
  }

  // Clear form method
  void clearForm() {
    petNameController.clear();
    weightController.clear();
    medicalConditionController.clear();
    ageYearsController.clear();
    ageMonthsController.clear();

    imageFile = null;
    birthDate = null;
    selectedGender = null;
    havingSpecificHealthCondition = false;
    selectedCategory = null;
    selectedSubCategory = null;

    notifyListeners();
  }

  @override
  void dispose() {
    petNameController.dispose();
    weightController.dispose();
    medicalConditionController.dispose();
    ageYearsController.dispose();
    ageMonthsController.dispose();

    petNameFocusNode.dispose();
    weightFocusNode.dispose();
    medicalConditionFocusNode.dispose();

    super.dispose();
  }
}
