import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';

import 'package:petcure_user_app/modules/orders_list_module/models/user_order_list_model.dart';
import 'package:petcure_user_app/modules/orders_list_module/services/orders_list_services.dart';

part 'orders_list_cubit.freezed.dart';
part 'orders_list_state.dart';

class OrdersListCubit extends Cubit<OrdersListState> {
  OrdersListCubit() : super(const OrdersListState.initial());

  Future<void> getUserOrdersList() async {
    emit(const OrdersListState.ordersListLoading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final List<UserOrderListModel> orders =
          await OrdersListServices.getUserOrdersList(userId: userId);

      if (orders.isEmpty) {
        emit(const OrdersListState.ordersListEmpty());
      } else {
        emit(OrdersListState.ordersListSuccess(orders));
      }
    } catch (e) {
      emit(OrdersListState.ordersListError(e.toString()));
    }
  }
}
