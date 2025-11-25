part of 'reorder_bloc.dart';

@freezed
sealed class ReorderEvent with _$ReorderEvent {
  const factory ReorderEvent.started() = _Started;
  const factory ReorderEvent.reordering(int orderId) = _Reordering;
}
