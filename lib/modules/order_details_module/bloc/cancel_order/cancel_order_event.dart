part of 'cancel_order_bloc.dart';

@freezed
sealed class CancelOrderEvent with _$CancelOrderEvent {
  const factory CancelOrderEvent.started() = _Started;
  const factory CancelOrderEvent.cancellingOrder(int orderId) =
      _CancellingOrder;
}
