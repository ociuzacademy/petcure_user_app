import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/enums/booking_reason.dart';

class AppointmentBookingData {
  final BookingOption bookingOption;
  final int petId;
  final int doctorId;
  final DateTime date;
  final int slotId;
  final BookingReason? reason;
  final String? symptoms;
  final int? vaccineId;

  const AppointmentBookingData({
    required this.bookingOption,
    required this.petId,
    required this.doctorId,
    required this.date,
    required this.slotId,
    this.reason,
    this.symptoms,
    this.vaccineId,
  });

  Map<String, dynamic> toJson() {
    return {
      'appointment_type': bookingOption.label,
      'pet': petId,
      'doctor': doctorId,
      'date':
          "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      'slot': slotId,
      'reason': reason?.label,
      'symptoms': symptomsLabel,
      'vaccine': reason == BookingReason.vaccine ? vaccineId : null,
    };
  }

  String? get symptomsLabel {
    String? label;
    if (bookingOption == BookingOption.clinicalAppointment) {
      if (reason != null) {
        switch (reason!) {
          case BookingReason.routineCheckup:
            label = symptoms;
          case BookingReason.vaccine:
            label = null;
          case BookingReason.sickness:
            label = symptoms;
        }
      } else {
        label = null;
      }
    } else {
      label = symptoms;
    }
    return label;
  }
}
