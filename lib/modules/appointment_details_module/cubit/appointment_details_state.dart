part of 'appointment_details_cubit.dart';

@freezed
sealed class AppointmentDetailsState with _$AppointmentDetailsState {
  const factory AppointmentDetailsState.initial() = AppointmentDetailsInitial;
  const factory AppointmentDetailsState.loading() = AppointmentDetailsLoading;
  const factory AppointmentDetailsState.success(AppointmentDetailsModel data) =
      AppointmentDetailsSuccess;
  const factory AppointmentDetailsState.error(String message) =
      AppointmentDetailsError;
}
