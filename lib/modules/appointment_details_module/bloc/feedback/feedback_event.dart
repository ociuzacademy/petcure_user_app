part of 'feedback_bloc.dart';

@freezed
sealed class FeedbackEvent with _$FeedbackEvent {
  const factory FeedbackEvent.started() = _Started;
  const factory FeedbackEvent.submittingFeedback(FeedbackData feedbackData) =
      _SubmittingFeedback;
}
