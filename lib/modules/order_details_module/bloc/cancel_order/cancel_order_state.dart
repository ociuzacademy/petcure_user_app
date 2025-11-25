part of 'cancel_order_bloc.dart';

@freezed
sealed class CancelOrderState with _$CancelOrderState {
  const factory CancelOrderState.initial() = CancelOrderInitial;
  const factory CancelOrderState.cancelOrderLoading() = CancelOrderLoading;
  const factory CancelOrderState.cancelOrderError(String errorMessage) =
      CancelOrderError;
  const factory CancelOrderState.cancelOrderSuccess(
    CancelOrderResponseModel response,
  ) = CancelOrderSuccess;
}
