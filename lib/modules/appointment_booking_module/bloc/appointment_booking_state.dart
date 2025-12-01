part of 'appointment_booking_bloc.dart';

@freezed
sealed class AppointmentBookingState with _$AppointmentBookingState {
  const factory AppointmentBookingState.initial() = AppointmentBookingInitial;
  const factory AppointmentBookingState.loading() = AppointmentBookingLoading;
  const factory AppointmentBookingState.success(
    AppointmentBookingResponseModel response,
  ) = AppointmentBookingSuccess;
  const factory AppointmentBookingState.error(String error) =
      AppointmentBookingError;
}
