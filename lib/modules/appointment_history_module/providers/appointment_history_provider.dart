// appointment_history_provider.dart
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart';
import 'package:petcure_user_app/core/models/booking.dart';

class AppointmentHistoryProvider with ChangeNotifier {
  List<Pet> _pets = [];
  Pet? _selectedPet;
  bool _showHistory = false;
  final List<Booking> _bookingHistory = [];

  // Getters
  List<Pet> get pets => _pets;
  Pet? get selectedPet => _selectedPet;
  bool get showHistory => _showHistory;
  List<Booking> get bookingHistory => _bookingHistory;

  AppointmentHistoryProvider() {
    _initializeData([]);
  }

  void _initializeData(List<Pet> pets) {
    _pets = pets;
    notifyListeners();
  }

  // Method to set pets from API response
  void setPetsFromApi(UserPetsModel userPets) {
    // Convert API pets to local Pet model
    _pets = userPets.pets;

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

  void getPetAppointmentHistory(Pet pet) {
    // if (pet != null) {
    //   _showHistory = true;
    //   _bookingHistory = FakeData.generateFakeBookingHistory(pet);
    //   notifyListeners();
    // } else {
    //   _showHistory = false;
    //   notifyListeners();
    //   throw Exception('Please select a pet');
    // }
  }

  String fetchLeadingImage(String reason) {
    switch (reason) {
      case 'Vaccine':
        return 'assets/icons/icons8-syringe-48.png';
      case 'Routine Checkup':
        return 'assets/icons/icons8-veterinary-examination-48.png';
      default:
        return 'assets/icons/icons8-pets-medical-examination-48.png';
    }
  }
}
