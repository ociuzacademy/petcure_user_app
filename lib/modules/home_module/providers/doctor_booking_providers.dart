// doctor_booking_providers.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart'
    hide Pet;
import 'package:petcure_user_app/core/models/location.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/modules/home_module/models/nearby_doctors_model.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class DoctorBookingProvider with ChangeNotifier {
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  List<Pet> _pets = [];
  List<Doctor> _doctors = [];
  Pet? _selectedPet;
  bool _showDoctors = false;

  // Getters
  TextEditingController get latitudeController => _latitudeController;
  TextEditingController get longitudeController => _longitudeController;
  List<Pet> get pets => _pets;
  List<Doctor> get doctors => _doctors;
  Pet? get selectedPet => _selectedPet;
  bool get showDoctors => _showDoctors;

  set showDoctors(bool value) {
    _showDoctors = value;
    notifyListeners();
  }

  void initializeData(NearbyDoctorsModel nearbyDoctors) {
    _doctors = nearbyDoctors.doctors;
    notifyListeners();
  }

  // Method to set pets from API response
  void setPetsFromApi(UserPetsModel userPets) {
    // Convert API pets to local Pet model
    _pets = userPets.pets.map((apiPet) {
      return Pet(
        petId: apiPet.id,
        ownerId: apiPet.user,
        name: apiPet.name,
        birthDate: apiPet.birthDate,
        categoryId: apiPet.category,
        category: apiPet.categoryName,
        subCategoryId: apiPet.subCategory,
        subCategory: apiPet.subCategoryName,
        photoUrl: apiPet.petImage, // You might need to add base URL here
        weight: apiPet.weight,
        gender: apiPet.gender,
        healthConditions: apiPet.healthCondition,
      );
    }).toList();

    if (_pets.isNotEmpty) {
      _selectedPet = _pets.first;
    }

    notifyListeners();
  }

  void setSelectedPet(Pet? pet) {
    _selectedPet = pet;
    _showDoctors = false;
    _latitudeController.clear();
    _longitudeController.clear();
    notifyListeners();
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        CustomSnackBar.showError(
          context,
          message: 'Location services are disabled.',
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (!context.mounted) return;
          CustomSnackBar.showError(
            context,
            message: 'Location permissions are denied.',
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (!context.mounted) return;
        CustomSnackBar.showError(
          context,
          message: 'Location permissions are permanently denied.',
        );
        return;
      }

      LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      _latitudeController.text = position.latitude.toString();
      _longitudeController.text = position.longitude.toString();
      notifyListeners();
    } catch (e) {
      if (!context.mounted) return;
      CustomSnackBar.showError(context, message: 'Error getting location: $e');
    }
  }

  Location? validateNearbyDoctorSearch() {
    if (_selectedPet == null) {
      debugPrint('Selected pet empty');
      return null;
    }

    final String latitudeText = _latitudeController.text.trim();
    final String longitudeText = _longitudeController.text.trim();
    if (latitudeText.isEmpty || longitudeText.isEmpty) {
      debugPrint('Location empty');
      return null;
    }

    return Location(
      latitude: double.parse(latitudeText),
      longitude: double.parse(longitudeText),
    );
  }

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }
}
