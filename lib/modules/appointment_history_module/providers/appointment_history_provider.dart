// appointment_history_provider.dart
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart';

class AppointmentHistoryProvider with ChangeNotifier {
  Pet? _selectedPet;
  bool _showHistory = false;

  // Getters
  Pet? get selectedPet => _selectedPet;
  bool get showHistory => _showHistory;

  void setSelectedPet(Pet? pet) {
    _selectedPet = pet;
    _showHistory = false;
    notifyListeners();
  }

  void setShowHistory(bool value) {
    _showHistory = value;
    notifyListeners();
  }
}
