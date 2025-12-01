part of 'appointment_booking_bloc.dart';

@freezed
sealed class AppointmentBookingEvent with _$AppointmentBookingEvent {
  const factory AppointmentBookingEvent.started() = _Started;
  const factory AppointmentBookingEvent.bookingAppointment(
    AppointmentBookingData data,
  ) = _BookingAppointment;
}
