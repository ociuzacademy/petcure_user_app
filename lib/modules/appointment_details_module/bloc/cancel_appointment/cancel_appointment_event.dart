part of 'cancel_appointment_bloc.dart';

@freezed
sealed class CancelAppointmentEvent with _$CancelAppointmentEvent {
  const factory CancelAppointmentEvent.started() = _Started;
  const factory CancelAppointmentEvent.cancelAppointment({
    required int bookingId,
  }) = _CancelAppointment;
}
