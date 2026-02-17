part of 'share_prescription_bloc.dart';

@freezed
sealed class SharePrescriptionEvent with _$SharePrescriptionEvent {
  const factory SharePrescriptionEvent.started() = _Started;
  const factory SharePrescriptionEvent.sharePrescriptionDocument({
    required int prescriptionId,
  }) = _SharePrescriptionDocument;
}
