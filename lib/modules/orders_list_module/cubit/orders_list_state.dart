part of 'orders_list_cubit.dart';

@freezed
sealed class OrdersListState with _$OrdersListState {
  const factory OrdersListState.initial() = OrdersListInitial;
  const factory OrdersListState.ordersListLoading() = OrdersListLoading;
  const factory OrdersListState.ordersListError(String errorMessage) =
      OrdersListError;
  const factory OrdersListState.ordersListEmpty() = OrdersListEmpty;
  const factory OrdersListState.ordersListSuccess(
    List<UserOrderListModel> orders,
  ) = OrdersListSuccess;
}
