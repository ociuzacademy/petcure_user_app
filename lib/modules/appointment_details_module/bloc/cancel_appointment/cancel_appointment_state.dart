part of 'cancel_appointment_bloc.dart';

@freezed
sealed class CancelAppointmentState with _$CancelAppointmentState {
  const factory CancelAppointmentState.initial() = CancelAppointmentInitial;
  const factory CancelAppointmentState.loading() = CancelAppointmentLoading;
  const factory CancelAppointmentState.success(
    CancelAppointmentResponseModel response,
  ) = CancelAppointmentSuccess;
  const factory CancelAppointmentState.error(String message) =
      CancelAppointmentError;
}
