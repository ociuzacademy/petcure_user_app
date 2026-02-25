// update_pet_provider.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_user_app/core/utils/app_utils.dart';
import 'package:petcure_user_app/core/models/api_models/pet_details_model.dart';
import 'package:petcure_user_app/modules/update_pet_module/class/update_pet_details.dart';

class UpdatePetProvider with ChangeNotifier {
  // Form Key and Focus Nodes
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode petNameFocusNode = FocusNode();
  final FocusNode weightFocusNode = FocusNode();
  final FocusNode medicalConditionFocusNode = FocusNode();

  // Text Editing Controllers
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _medicalConditionController =
      TextEditingController();
  final TextEditingController _ageYearsController = TextEditingController();
  final TextEditingController _ageMonthsController = TextEditingController();

  // State Variables
  File? _imageFile;
  DateTime? _birthDate;
  String? _selectedGender;
  bool _havingSpecificHealthCondition = false;
  PetDetailsModel? _petDetails;

  // Getters
  TextEditingController get petNameController => _petNameController;
  TextEditingController get weightController => _weightController;
  TextEditingController get medicalConditionController =>
      _medicalConditionController;
  TextEditingController get ageYearsController => _ageYearsController;
  TextEditingController get ageMonthsController => _ageMonthsController;

  File? get imageFile => _imageFile;
  DateTime? get birthDate => _birthDate;
  String? get selectedGender => _selectedGender;
  bool get havingSpecificHealthCondition => _havingSpecificHealthCondition;
  PetDetailsModel? get petDetails => _petDetails;

  void initializeWithPetDataFromApi(PetDetailsModel petDetails) {
    _petDetails = petDetails;
    final String gender = petDetails.pet.gender;
    _petDetails!.pet.copyWith(
      gender: gender[0].toUpperCase() + gender.substring(1),
    );
    _petNameController.text = petDetails.pet.name;
    _weightController.text = petDetails.pet.weight.toString();
    _medicalConditionController.text = petDetails.pet.healthCondition ?? '';
    _selectedGender = gender[0].toUpperCase() + gender.substring(1);

    // Calculate age from birth date if available
    final age = AppUtils.calculateAge(petDetails.pet.birthDate);
    _ageYearsController.text = age.ageInYears.toString();
    _ageMonthsController.text = age.ageInMonths.toString();
    _birthDate = petDetails.pet.birthDate;

    // Set health condition based on whether medical condition exists
    _havingSpecificHealthCondition =
        petDetails.pet.healthCondition?.isNotEmpty ?? false;

    notifyListeners();
  }

  // Setters
  void setImageFile(File? file) {
    _imageFile = file;
    notifyListeners();
  }

  void removeImageFile() {
    _imageFile = null;
    notifyListeners();
  }

  void setBirthDate(DateTime? date) {
    _birthDate = date;
    if (date != null) {
      final age = AppUtils.calculateAge(date);
      _ageYearsController.text = age.ageInYears.toString();
      _ageMonthsController.text = age.ageInMonths.toString();
    }
    notifyListeners();
  }

  void setSelectedGender(String? gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void setHavingSpecificHealthCondition(bool value) {
    _havingSpecificHealthCondition = value;
    if (!value) {
      _medicalConditionController.clear();
    }
    notifyListeners();
  }

  // Focus Management Methods
  void moveToNextFocus(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void unfocusAll() {
    petNameFocusNode.unfocus();
    weightFocusNode.unfocus();
    medicalConditionFocusNode.unfocus();
  }

  // Methods
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> selectBirthDate(BuildContext context) async {
    unfocusAll();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setBirthDate(picked);
    }
  }

  UpdatePetDetails? validateForm() {
    unfocusAll();

    if (!formKey.currentState!.validate()) {
      return null;
    }

    final String petName = _petNameController.text.trim();
    final String weightInString = _weightController.text.trim();
    final String healthCondition = _medicalConditionController.text.trim();

    if (_havingSpecificHealthCondition && healthCondition.isEmpty) {
      // We'll show the snackbar in the updatePet method
      return null;
    }

    if (petName.isEmpty) {
      return null;
    }

    if (_selectedGender == null) {
      return null;
    }

    final weight = double.tryParse(weightInString);
    if (weight! <= 0) {
      return null;
    }

    return UpdatePetDetails(
      petName: _petDetails!.pet.name != petName ? petName : null,
      birthDate: _petDetails!.pet.birthDate != _birthDate ? _birthDate : null,
      gender: _petDetails!.pet.gender != _selectedGender
          ? _selectedGender
          : null,
      healthCondition:
          _havingSpecificHealthCondition &&
              _petDetails!.pet.healthCondition! == healthCondition
          ? healthCondition
          : null,
      petImage: _imageFile,
      weight: weight,
    );
  }

  @override
  void dispose() {
    // Dispose focus nodes
    petNameFocusNode.dispose();
    weightFocusNode.dispose();
    medicalConditionFocusNode.dispose();

    // Dispose controllers
    _petNameController.dispose();
    _weightController.dispose();
    _medicalConditionController.dispose();
    _ageYearsController.dispose();
    _ageMonthsController.dispose();

    super.dispose();
  }
}
