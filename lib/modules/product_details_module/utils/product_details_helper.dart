// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/models/product.dart';

class ProductDetailsHelper {
  final Product product;
  final ValueNotifier<bool> addedToCart;

  const ProductDetailsHelper({
    required this.product,
    required this.addedToCart,
  });

  void addToCart() {
    addedToCart.value = true;
  }

  // Calculate estimated delivery date
  DateTime get estimatedDeliveryDate {
    return DateTime.now().add(Duration(days: product.daysToDeliver));
  }

  // Format date to display
  String get formattedDeliveryDate {
    final date = estimatedDeliveryDate;
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
      // Format as "Mon, Jan 15"
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
      final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return '${days[date.weekday - 1]}, ${months[date.month - 1]} ${date.day}';
    }
  }
}
