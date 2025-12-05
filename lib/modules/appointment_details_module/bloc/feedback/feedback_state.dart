part of 'feedback_bloc.dart';

@freezed
sealed class FeedbackState with _$FeedbackState {
  const factory FeedbackState.initial() = FeedbackInitial;
  const factory FeedbackState.loading() = FeedbackLoading;
  const factory FeedbackState.success(FeedbackResponseModel response) =
      FeedbackSuccess;
  const factory FeedbackState.error(String message) = FeedbackError;
}
