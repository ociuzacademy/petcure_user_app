// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/models/booking.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class AppointmentHistoryHelper {
  final BuildContext context;
  final ValueNotifier<Pet?> selectedPet;
  final ValueNotifier<bool> showHistory;
  final ValueNotifier<List<Booking>> bookingHistory;
  const AppointmentHistoryHelper({
    required this.context,
    required this.selectedPet,
    required this.showHistory,
    required this.bookingHistory,
  });

  void getChildVaccineHistory() {
    if (selectedPet.value != null) {
      showHistory.value = true;
      bookingHistory.value = FakeData.generateFakeBookingHistory(
        selectedPet.value!,
      );
    } else {
      CustomSnackBar.showError(context, message: "Please select a pet");
      showHistory.value = false;
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
