import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/modules/orders_list_module/cubit/orders_list_cubit.dart';
import 'package:petcure_user_app/modules/orders_list_module/utils/order_list_helper.dart';
import 'package:petcure_user_app/modules/orders_list_module/widgets/order_list_card.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';

class OrdersListPage extends StatefulWidget {
  const OrdersListPage({super.key});

  @override
  State<OrdersListPage> createState() => _OrdersListPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const OrdersListPage());
}

class _OrdersListPageState extends State<OrdersListPage> {
  late final OrderListHelper _orderListHelper;

  @override
  void initState() {
    super.initState();
    _orderListHelper = OrderListHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _orderListHelper.orderListInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<OrdersListCubit, OrdersListState>(
        builder: (context, state) {
          return switch (state) {
            OrdersListLoading() => const ListItemLoadingWidget(itemCount: 5),
            OrdersListError(:final errorMessage) => CustomErrorWidget(
              onRetry: _orderListHelper.orderListInit,
              errorMessage: errorMessage,
            ),
            OrdersListSuccess(:final orders) => SafeArea(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];

                  return OrderListCard(
                    order: order,
                    getStatusText: OrderListHelper.getStatusText,
                    getStatusColor: OrderListHelper.getStatusColor,
                    getStatusIcon: OrderListHelper.getStatusIcon,
                    formatDate: OrderListHelper.formatDate,
                    formatDeliveryDate: OrderListHelper.formatDeliveryDate,
                    getProductNames: OrderListHelper.getProductNames,
                  );
                },
              ),
            ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
