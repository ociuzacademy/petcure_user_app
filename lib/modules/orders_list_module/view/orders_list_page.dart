import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/core/models/order.dart';
import 'package:petcure_user_app/modules/orders_list_module/utils/order_list_helper.dart';
import 'package:petcure_user_app/modules/orders_list_module/widgets/order_list_card.dart';

class OrdersListPage extends StatefulWidget {
  const OrdersListPage({super.key});

  @override
  State<OrdersListPage> createState() => _OrdersListPageState();

  static route() => MaterialPageRoute(builder: (context) => OrdersListPage());
}

class _OrdersListPageState extends State<OrdersListPage> {
  late final OrderListHelper _orderListHelper;
  late final List<Order> _orders;

  @override
  void initState() {
    super.initState();
    _orders = FakeData.generateFakeOrders(count: 15);
    _orderListHelper = OrderListHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          final isDelayed = _orderListHelper.isDeliveryDelayed(order);

          return OrderListCard(
            order: order,
            getStatusText: _orderListHelper.getStatusText,
            getStatusColor: _orderListHelper.getStatusColor,
            getStatusIcon: _orderListHelper.getStatusIcon,
            formatDate: _orderListHelper.formatDate,
            formatDeliveryDate: _orderListHelper.formatDeliveryDate,
            getProductNames: _orderListHelper.getProductNames,
            getDeliveryProgress: _orderListHelper.getDeliveryProgress,
            getDeliveryStage: _orderListHelper.getDeliveryStage,
            isDelayed: isDelayed,
          );
        },
      ),
    );
  }
}
