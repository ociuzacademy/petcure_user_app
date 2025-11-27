// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petcure_user_app/modules/orders_list_module/cubit/orders_list_cubit.dart';
import 'package:petcure_user_app/core/enums/user_order_delivery_status.dart';
import 'package:petcure_user_app/modules/orders_list_module/models/user_order_list_model.dart';

class OrderListHelper {
  final BuildContext context;
  const OrderListHelper({required this.context});

  void orderListInit() {
    final OrdersListCubit ordersListCubit = context.read<OrdersListCubit>();
    ordersListCubit.getUserOrdersList();
  }

  // Helper function to get status color
  static Color getStatusColor(UserOrderDeliveryStatus status) {
    switch (status) {
      case UserOrderDeliveryStatus.pending:
        return Colors.orange;
      case UserOrderDeliveryStatus.orderPlaced:
        return Colors.blue;
      case UserOrderDeliveryStatus.orderOnTheWay:
        return Colors.purple;
      case UserOrderDeliveryStatus.orderDelivered:
        return Colors.green;
      case UserOrderDeliveryStatus.orderCancelled:
        return Colors.red;
    }
  }

  // Helper function to get status text
  static String getStatusText(UserOrderDeliveryStatus status) {
    return status.value.toUpperCase(); // Now we can directly use the enum value
  }

  // Helper function to get status icon
  static IconData getStatusIcon(UserOrderDeliveryStatus status) {
    switch (status) {
      case UserOrderDeliveryStatus.pending:
        return Icons.pending;
      case UserOrderDeliveryStatus.orderPlaced:
        return Icons.shopping_cart;
      case UserOrderDeliveryStatus.orderOnTheWay:
        return Icons.local_shipping;
      case UserOrderDeliveryStatus.orderDelivered:
        return Icons.check_circle;
      case UserOrderDeliveryStatus.orderCancelled:
        return Icons.cancel;
    }
  }

  // Helper function to format date
  static String formatDate(DateTime date) {
    return '${getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  // Helper function to get month name
  static String getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  // Helper function to get product names
  static String getProductNames(List<Item> products) {
    if (products.isEmpty) return 'No products';

    final names = products.map((item) => item.product.name).toList();
    if (names.length <= 2) {
      return names.join(', ');
    } else {
      return '${names.take(2).join(', ')} and ${names.length - 2} more';
    }
  }

  // Format delivery date
  static String formatDeliveryDate(DateTime date) {
    final today = DateTime.now();
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow';
    } else {
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${months[date.month - 1]} ${date.day}';
    }
  }
}
