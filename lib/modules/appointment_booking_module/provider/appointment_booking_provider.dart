import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/models/slot_model.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class AppointmentBookingProvider extends ChangeNotifier {
  final BuildContext context;

  AppointmentBookingProvider(this.context);

  DateTime? _selectedDate;
  SlotModel? _selectedTimeSlot;
  String? _selectedReason;
  BookingOption _selectedBookingOption = BookingOption.clinicalAppointment;
  final TextEditingController symptomsController = TextEditingController();

  DateTime? get selectedDate => _selectedDate;
  SlotModel? get selectedTimeSlot => _selectedTimeSlot;
  String? get selectedReason => _selectedReason;
  BookingOption get selectedBookingOption => _selectedBookingOption;

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void selectTimeSlot(SlotModel slot) {
    _selectedTimeSlot = slot;
    notifyListeners();
  }

  void selectReason(String reason) {
    _selectedReason = reason;
    notifyListeners();
  }

  void selectBookingOption(BookingOption option) {
    _selectedBookingOption = option;
    notifyListeners();
  }

  @override
  void dispose() {
    symptomsController.dispose();
    super.dispose();
  }

  void bookAppointment() {
    if (_selectedBookingOption == BookingOption.clinicalAppointment) {
      if (_selectedDate == null) {
        CustomSnackBar.showError(
          context,
          message: 'Please select a date for appointment.',
        );
        return;
      }

      if (_selectedReason == null) {
        CustomSnackBar.showError(
          context,
          message: 'Please select reason for the appointment.',
        );
        return;
      }

      if (_selectedTimeSlot == null) {
        CustomSnackBar.showError(
          context,
          message: 'Please select any one of the time slot.',
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
      if (_selectedBookingOption == BookingOption.audioCall &&
          symptoms.isEmpty) {
        CustomSnackBar.showError(
          context,
          message: 'Please enter symptoms of youe pet.',
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
