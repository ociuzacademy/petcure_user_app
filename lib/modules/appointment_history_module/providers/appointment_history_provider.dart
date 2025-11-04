// appointment_history_provider.dart
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/models/booking.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart'
    hide Pet;

class AppointmentHistoryProvider with ChangeNotifier {
  List<Pet> _pets = [];
  Pet? _selectedPet;
  bool _showHistory = false;
  List<Booking> _bookingHistory = [];

  // Getters
  List<Pet> get pets => _pets;
  Pet? get selectedPet => _selectedPet;
  bool get showHistory => _showHistory;
  List<Booking> get bookingHistory => _bookingHistory;

  AppointmentHistoryProvider() {
    _initializeData();
  }

  void _initializeData() {
    _pets = FakeData.generateFakePets();
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
    _showHistory = false;
    notifyListeners();
  }

  void getChildVaccineHistory() {
    if (_selectedPet != null) {
      _showHistory = true;
      _bookingHistory = FakeData.generateFakeBookingHistory(_selectedPet!);
      notifyListeners();
    } else {
      _showHistory = false;
      notifyListeners();
      throw Exception("Please select a pet");
    }
  }

  String fetchLeadingImage(String reason) {
    switch (reason) {
      case "Vaccine":
        return "assets/icons/icons8-syringe-48.png";
      case "Routine Checkup":
        return "assets/icons/icons8-veterinary-examination-48.png";
      default:
        return "assets/icons/icons8-pets-medical-examination-48.png";
    }
  }
}
