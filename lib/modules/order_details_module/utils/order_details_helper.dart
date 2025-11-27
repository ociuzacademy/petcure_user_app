// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

import 'package:petcure_user_app/modules/order_details_module/models/order_details_model.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/q_r_code_widget.dart';
import 'package:petcure_user_app/core/enums/user_order_delivery_status.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

class OrderDetailsHelper {
  final BuildContext context;
  final int orderId;
  const OrderDetailsHelper({required this.context, required this.orderId});

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

  // Get delivery progress value
  static double getDeliveryProgress(
    UserOrderDeliveryStatus orderDeliveryStatus,
  ) {
    switch (orderDeliveryStatus) {
      case UserOrderDeliveryStatus.pending:
        return 0;
      case UserOrderDeliveryStatus.orderPlaced:
        return 0.33;
      case UserOrderDeliveryStatus.orderOnTheWay:
        return 0.66;
      case UserOrderDeliveryStatus.orderDelivered:
        return 1.0;
      default:
        return 0;
    }
  }

  // Generate QR code data string from order
  String get _qrCodeData {
    final data = {'orderId': orderId};
    return jsonEncode(data);
  }

  // Fetch order details
  void orderDetailsInit() {
    final OrderDetailsCubit orderDetailsCubit = context
        .read<OrderDetailsCubit>();
    orderDetailsCubit.getOrderDetails(orderId);
  }

  // Show QR code bottom sheet
  void showQrCodeBottomSheet(OrderDetailsModel orderDetails) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QRCodeWidget(
        orderId: orderId,
        qrCodeData: _qrCodeData,
        formatDeliveryDate: formatDeliveryDate,
        items: orderDetails.items,
        totalRate: orderDetails.totalAmount,
        estimatedDeliveryDate: orderDetails.estimatedDeliveryDate,
      ),
    );
  }

  void showReorderDialogueBox() {
    CustomDialogBox.showCustomDialog(
      context: context,
      title: 'Reorder',
      message: 'Do you wanted to reorder all the items from this order?',
      onSubmit: _reorder,
    );
  }

  void showCancelOrderDialogueBox() {
    CustomDialogBox.showCustomDialog(
      context: context,
      title: 'Cancel Order',
      message: 'Do you wanted to cancel this order?',
      onSubmit: _cancelOrder,
    );
  }

  void _reorder() {
    final ReorderBloc reorderBloc = context.read<ReorderBloc>();
    reorderBloc.add(ReorderEvent.reordering(orderId));
  }

  void _cancelOrder() {
    final CancelOrderBloc cancelOrderBloc = context.read<CancelOrderBloc>();
    cancelOrderBloc.add(CancelOrderEvent.cancellingOrder(orderId));
  }
}
