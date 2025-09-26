// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/models/order.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/q_r_code_widget.dart';

class OrderDetailsHelper {
  final BuildContext context;
  final Order order;
  OrderDetailsHelper({required this.context, required this.order});

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
  bool isDeliveryDelayed() {
    return order.estimatedDeliveryDate.isBefore(DateTime.now()) &&
        order.orderDeliveryStatus != OrderDeliveryStatus.orderDelivered;
  }

  // Get delivery progress value
  double getDeliveryProgress() {
    switch (order.orderDeliveryStatus) {
      case OrderDeliveryStatus.orderPlaced:
        return 0.33;
      case OrderDeliveryStatus.orderOnTheWay:
        return 0.66;
      case OrderDeliveryStatus.orderDelivered:
        return 1.0;
    }
  }

  // Generate QR code data string from order
  String get _qrCodeData {
    final data = {
      'orderId': order.orderId,
      'orderDate': order.orderDate.toIso8601String(),
      'estimatedDelivery': order.estimatedDeliveryDate.toIso8601String(),
      'totalAmount': order.totalRate,
      'itemCount': order.productsOrdered.length,
      'status': order.orderDeliveryStatus.toString(),
      'userId': order.userId,
    };
    return data.toString();
  }

  // Show QR code bottom sheet
  void showQrCodeBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QRCodeWidget(
        order: order,
        qrCodeData: _qrCodeData,
        formatDeliveryDate: formatDeliveryDate,
      ),
    );
  }
}
