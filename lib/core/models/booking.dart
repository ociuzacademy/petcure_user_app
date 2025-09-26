// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petcure_user_app/core/models/doctor.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/models/slot_model.dart';

class Booking {
  final Pet pet;
  final Doctor doctor;
  final DateTime bookingDate;
  final SlotModel timeSlot;
  final String reasonForBooking;
  final BookingOption bookingOption;
  const Booking({
    required this.pet,
    required this.doctor,
    required this.bookingDate,
    required this.timeSlot,
    required this.reasonForBooking,
    required this.bookingOption,
  });
}
