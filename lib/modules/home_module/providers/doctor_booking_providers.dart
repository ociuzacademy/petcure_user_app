// doctor_booking_providers.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:petcure_user_app/core/models/doctor.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:petcure_user_app/modules/home_module/models/user_pets_model.dart'
    hide Pet;

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

  DoctorBookingProvider() {
    _initializeData();
  }

  void _initializeData() {
    _doctors = FakeData.generateFakeDoctors(); // Keep doctors as fake for now
    notifyListeners();
  }

  // Method to set pets from API response
  void setPetsFromApi(UserPetsModel userPets) {
    // Convert API pets to local Pet model
    _pets = userPets.pets.map((apiPet) {
      return Pet(
        petId: apiPet.id.toString(),
        ownerId: apiPet.user.toString(),
        name: apiPet.name,
        birthDate: apiPet.birthDate,
        category: apiPet.category.toString(),
        subCategory: apiPet.subCategory.toString(),
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
          message: "Location services are disabled.",
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
            message: "Location permissions are denied.",
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (!context.mounted) return;
        CustomSnackBar.showError(
          context,
          message: "Location permissions are permanently denied.",
        );
        return;
      }

      LocationSettings locationSettings = LocationSettings(
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
      CustomSnackBar.showError(context, message: "Error getting location: $e");
    }
  }

  void findDoctors(BuildContext context) {
    if (_latitudeController.text.isNotEmpty &&
        _longitudeController.text.isNotEmpty) {
      if (_selectedPet != null) {
        _showDoctors = true;
        notifyListeners();
      } else {
        CustomSnackBar.showError(context, message: "Please select a pet");
        _showDoctors = false;
        notifyListeners();
      }
    } else {
      CustomSnackBar.showError(context, message: "Please add location");
      _showDoctors = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }
}
