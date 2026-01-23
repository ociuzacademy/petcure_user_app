import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/enums/booking_reason.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/classes/appointment_booking_data.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/model/slots_model.dart';
import 'package:petcure_user_app/modules/home_module/models/nearby_doctors_model.dart';

class AppointmentBookingProvider extends ChangeNotifier {
  final BuildContext context;
  final Pet pet;
  final Doctor doctor;

  AppointmentBookingProvider(this.context, this.pet, this.doctor);

  DateTime? _selectedDate;
  Slot? _selectedTimeSlot;
  BookingReason? _selectedReason;
  BookingOption _selectedBookingOption = BookingOption.clinicalAppointment;
  int? _vaccineId;
  final TextEditingController symptomsController = TextEditingController();

  DateTime? get selectedDate => _selectedDate;
  Slot? get selectedTimeSlot => _selectedTimeSlot;
  BookingReason? get selectedReason => _selectedReason;
  BookingOption get selectedBookingOption => _selectedBookingOption;
  int? get vaccineId => _vaccineId;

  void selectDate(DateTime date) {
    _selectedDate = date;
    _selectedTimeSlot = null;
    notifyListeners();
  }

  void selectTimeSlot(Slot slot) {
    _selectedTimeSlot = slot;
    notifyListeners();
  }

  void selectReason(BookingReason reason) {
    _selectedReason = reason;
    notifyListeners();
  }

  void selectBookingOption(BookingOption option) {
    _selectedBookingOption = option;
    notifyListeners();
  }

  void setVaccineId(int? id) {
    _vaccineId = id;
    notifyListeners();
  }

  @override
  void dispose() {
    symptomsController.dispose();
    super.dispose();
  }

  AppointmentBookingData? get appointmentBookingData {
    if (_selectedDate == null || _selectedTimeSlot == null) {
      return null;
    }

    if (_selectedBookingOption == BookingOption.audioCall &&
        symptomsController.text.isEmpty) {
      return null;
    }

    if (_selectedReason == BookingReason.vaccine && _vaccineId == null) {
      return null;
    }

    return AppointmentBookingData(
      bookingOption: _selectedBookingOption,
      petId: pet.id,
      doctorId: doctor.id,
      date: _selectedDate!,
      slotId: _selectedTimeSlot!.slotId,
      symptoms: symptomsController.text,
      reason: _selectedReason,
      vaccineId: _vaccineId,
    );
  }
}
