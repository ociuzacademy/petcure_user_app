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

  const AppointmentBookingData({
    required this.bookingOption,
    required this.petId,
    required this.doctorId,
    required this.date,
    required this.slotId,
    this.reason,
    this.symptoms,
  });

  Map<String, dynamic> toJson() {
    return {
      'booking_option': bookingOption == BookingOption.clinicalAppointment
          ? 'clinical'
          : 'audio_call',
      'pet': petId,
      'doctor': doctorId,
      'date':
          "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      'slot': slotId,
      'reason': bookingOption == BookingOption.clinicalAppointment
          ? reason?.label
          : null,
      'symptoms': symptomsLabel,
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
      label = null;
    }
    return label;
  }
}
