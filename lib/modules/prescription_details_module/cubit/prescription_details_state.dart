part of 'prescription_details_cubit.dart';

@freezed
sealed class PrescriptionDetailsState with _$PrescriptionDetailsState {
  const factory PrescriptionDetailsState.initial() = PrescriptionDetailsInitial;
  const factory PrescriptionDetailsState.loading() = PrescriptionDetailsLoading;
  const factory PrescriptionDetailsState.loaded(
    PrescriptionDetailsModel prescriptions,
  ) = PrescriptionDetailsLoaded;
  const factory PrescriptionDetailsState.error(String error) =
      PrescriptionDetailsError;
}
