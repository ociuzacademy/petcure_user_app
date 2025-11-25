part of 'reorder_bloc.dart';

@freezed
sealed class ReorderState with _$ReorderState {
  const factory ReorderState.initial() = ReorderInitial;
  const factory ReorderState.reorderLoading() = ReorderLoading;
  const factory ReorderState.reorderError(String errorMessage) = ReorderError;
  const factory ReorderState.reorderSuccess(ReorderResponseModel response) =
      ReorderSuccess;
}
