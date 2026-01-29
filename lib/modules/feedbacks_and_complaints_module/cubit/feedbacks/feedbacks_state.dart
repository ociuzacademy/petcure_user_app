part of 'feedbacks_cubit.dart';

@freezed
sealed class FeedbacksState with _$FeedbacksState {
  const factory FeedbacksState.initial() = FeedbacksInitial;
  const factory FeedbacksState.loading() = FeedbacksLoading;
  const factory FeedbacksState.loaded(UserFeedbacksModel userFeedbacksModel) =
      FeedbacksLoaded;
  const factory FeedbacksState.error(String error) = FeedbacksError;
}
