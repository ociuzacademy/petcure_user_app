// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/models/slot_model.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class AppointmentBookingHelper {
  final BuildContext context;
  final TextEditingController symptomsController;
  final ValueNotifier<DateTime?> selectedDate;
  final ValueNotifier<SlotModel?> selectedTimeSlot;
  final ValueNotifier<String?> selectedReason;
  final ValueNotifier<BookingOption> selectedBookingOption;
  AppointmentBookingHelper({
    required this.context,
    required this.symptomsController,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.selectedReason,
    required this.selectedBookingOption,
  });

  void bookAppointment() {
    if (selectedBookingOption.value == BookingOption.clinicalAppointment) {
      if (selectedDate.value == null) {
        CustomSnackBar.showError(
          context,
          message: "Please select a date for appointment.",
        );
        return;
      }

      if (selectedReason.value == null) {
        CustomSnackBar.showError(
          context,
          message: "Please select reason for the appointment.",
        );
        return;
      }

      if (selectedTimeSlot.value == null) {
        CustomSnackBar.showError(
          context,
          message: "Please select any one of the time slot.",
        );
        return;
      }

      CustomSnackBar.showSuccess(
        context,
        message: 'Doctor appointment for your pet booked successfully',
      );

      Navigator.pop(context);
    } else {
      final String symptoms = symptomsController.text.trim();
      if (selectedBookingOption.value == BookingOption.videoConference &&
          symptoms.isEmpty) {
        CustomSnackBar.showError(
          context,
          message: "Please enter symptoms of youe pet.",
        );
        return;
      }

      CustomSnackBar.showSuccess(
        context,
        message: 'Doctor appointment for your pet booked successfully',
      );

      Navigator.pop(context);
    }
  }
}
