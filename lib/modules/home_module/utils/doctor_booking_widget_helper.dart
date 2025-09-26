// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class DoctorBookingWidgetHelper {
  final BuildContext context;
  final TextEditingController latitudeController;
  final TextEditingController longitudeController;
  final ValueNotifier<Pet?> selectedPet;
  final ValueNotifier<bool> showHospitals;
  const DoctorBookingWidgetHelper({
    required this.context,
    required this.latitudeController,
    required this.longitudeController,
    required this.selectedPet,
    required this.showHospitals,
  });
  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled && context.mounted) {
        CustomSnackBar.showError(
          context,
          message: "Location services are disabled.",
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied && context.mounted) {
          CustomSnackBar.showError(
            context,
            message: "Location permissions are denied.",
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever && context.mounted) {
        CustomSnackBar.showError(
          context,
          message: "Location permissions are permanently denied.",
        );
        return;
      }

      // ✅ FIXED: Use LocationSettings instead of desiredAccuracy
      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      latitudeController.text = position.latitude.toString();
      longitudeController.text = position.longitude.toString();
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          message: "Error getting location: $e",
        );
      }
    }
  }

  void findHospitals() {
    if (latitudeController.text.isNotEmpty &&
        longitudeController.text.isNotEmpty) {
      if (selectedPet.value != null) {
        showHospitals.value = true;
      } else {
        CustomSnackBar.showError(context, message: "Please select a pet");
        showHospitals.value = false;
      }
    } else {
      CustomSnackBar.showError(context, message: "Please add location");
      showHospitals.value = false;
    }
  }
}
