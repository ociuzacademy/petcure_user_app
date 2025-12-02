part of 'appointment_history_cubit.dart';

@freezed
sealed class AppointmentHistoryState with _$AppointmentHistoryState {
  const factory AppointmentHistoryState.initial() = AppointmentHistoryInitial;
  const factory AppointmentHistoryState.loading() = AppointmentHistoryLoading;
  const factory AppointmentHistoryState.success({
    required PetAppointmentHistoryModel petAppointmentHistory,
  }) = AppointmentHistorySuccess;
  const factory AppointmentHistoryState.error({required String error}) =
      AppointmentHistoryError;
}
