part of 'complaint_bloc.dart';

@freezed
sealed class ComplaintEvent with _$ComplaintEvent {
  const factory ComplaintEvent.started() = _Started;
  const factory ComplaintEvent.submittingComplaint(
    ComplaintData complaintData,
  ) = _SubmittingComplaint;
}
