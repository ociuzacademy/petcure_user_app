// product_details_helper.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/product_details_module/cubit/product_details_cubit.dart';

class ProductDetailsHelper {
  final BuildContext context;
  final int productId;
  final ValueNotifier<bool> addedToCart;

  const ProductDetailsHelper({
    required this.context,
    required this.productId,
    required this.addedToCart,
  });

  void productDetailsInit() {
    final ProductDetailsCubit productDetailsCubit = context
        .read<ProductDetailsCubit>();
    productDetailsCubit.getPetProductDetails(productId);
  }

  void addToCart() {
    addedToCart.value = true;
    // You can also add API call here to actually add the product to cart
  }

  void navigateToCart() {
    // Uncomment and implement when you have a cart page
    // Navigator.push(context, CartPage.route());

    // For now, just show a dialog or snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navigate to cart page'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Calculate estimated delivery date
  DateTime get estimatedDeliveryDate {
    return DateTime.now().add(const Duration(days: 2));
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
