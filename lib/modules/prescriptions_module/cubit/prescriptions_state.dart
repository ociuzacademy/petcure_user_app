part of 'prescriptions_cubit.dart';

@freezed
sealed class PrescriptionsState with _$PrescriptionsState {
  const factory PrescriptionsState.initial() = PrescriptionsInitial;
  const factory PrescriptionsState.loading() = PrescriptionsLoading;
  const factory PrescriptionsState.loaded(PrescriptionListModel prescriptions) =
      PrescriptionsLoaded;
  const factory PrescriptionsState.error(String error) = PrescriptionsError;
}
