part of 'complaint_bloc.dart';

@freezed
sealed class ComplaintState with _$ComplaintState {
  const factory ComplaintState.initial() = ComplaintInitial;
  const factory ComplaintState.loading() = ComplaintLoading;
  const factory ComplaintState.success(ComplaintResponseModel response) =
      ComplaintSuccess;
  const factory ComplaintState.error(String message) = ComplaintError;
}
