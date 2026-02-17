part of 'share_prescription_bloc.dart';

@freezed
sealed class SharePrescriptionState with _$SharePrescriptionState {
  const factory SharePrescriptionState.initial() = SharePrescriptionInitial;
  const factory SharePrescriptionState.loading() = SharePrescriptionLoading;
  const factory SharePrescriptionState.success() = SharePrescriptionSuccess;
  const factory SharePrescriptionState.failure(String error) =
      SharePrescriptionFailure;
}
