import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/cart_item.dart';
import 'package:petcure_user_app/core/models/order.dart';

class OrderListHelper {
  // Helper function to get status color
  Color getStatusColor(OrderDeliveryStatus status) {
    switch (status) {
      case OrderDeliveryStatus.orderPlaced:
        return Colors.orange;
      case OrderDeliveryStatus.orderOnTheWay:
        return Colors.blue;
      case OrderDeliveryStatus.orderDelivered:
        return Colors.green;
    }
  }

  // Helper function to get status text
  String getStatusText(OrderDeliveryStatus status) {
    switch (status) {
      case OrderDeliveryStatus.orderPlaced:
        return 'Order Placed';
      case OrderDeliveryStatus.orderOnTheWay:
        return 'On The Way';
      case OrderDeliveryStatus.orderDelivered:
        return 'Delivered';
    }
  }

  // Helper function to get status icon
  IconData getStatusIcon(OrderDeliveryStatus status) {
    switch (status) {
      case OrderDeliveryStatus.orderPlaced:
        return Icons.shopping_cart;
      case OrderDeliveryStatus.orderOnTheWay:
        return Icons.local_shipping;
      case OrderDeliveryStatus.orderDelivered:
        return Icons.check_circle;
    }
  }

  // Helper function to format date
  String formatDate(DateTime date) {
    return '${getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  // Helper function to get month name
  String getMonthName(int month) {
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
  String getProductNames(List<CartItem> products) {
    if (products.isEmpty) return 'No products';

    final names = products.map((item) => item.product.productName).toList();
    if (names.length <= 2) {
      return names.join(', ');
    } else {
      return '${names.take(2).join(', ')} and ${names.length - 2} more';
    }
  }

  // Format delivery date
  String formatDeliveryDate(DateTime date) {
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

  // Check if delivery is delayed
  bool isDeliveryDelayed(Order order) {
    return order.estimatedDeliveryDate.isBefore(DateTime.now()) &&
        order.orderDeliveryStatus != OrderDeliveryStatus.orderDelivered;
  }

  double getDeliveryProgress(OrderDeliveryStatus status) {
    switch (status) {
      case OrderDeliveryStatus.orderPlaced:
        return 0.33;
      case OrderDeliveryStatus.orderOnTheWay:
        return 0.66;
      case OrderDeliveryStatus.orderDelivered:
        return 1.0;
    }
  }

  String getDeliveryStage(OrderDeliveryStatus status, int stage) {
    switch (stage) {
      case 1:
        return 'Ordered';
      case 2:
        return 'Shipped';
      case 3:
        return 'Delivered';
      default:
        return '';
    }
  }
}
