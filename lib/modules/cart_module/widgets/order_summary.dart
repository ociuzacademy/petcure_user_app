// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/cart_module/helper/cart_helper.dart';
import 'package:petcure_user_app/modules/cart_module/models/cart_items_model.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({
    super.key,
    required this.totalAmount,
    required this.cartItems,
    required this.placeOrder,
  });

  final double totalAmount;
  final List<CartItem> cartItems;
  final VoidCallback placeOrder;

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Estimated Delivery
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green[100]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_shipping, size: 16, color: Colors.green[700]),
                const SizedBox(width: 8),
                Text(
                  'Estimated Delivery: ${CartHelper.formatDeliveryDate(DateTime.now().add(const Duration(days: 5)))}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Total Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '\u{20B9}${widget.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppPalette.firstColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Place Order Button
          CustomButton(
            buttonWidth: double.infinity,
            backgroundColor: AppPalette.firstColor,
            textColor: AppPalette.whiteColor,
            labelText: 'Place Order',
            onClick: widget.cartItems.isNotEmpty ? widget.placeOrder : () {},
          ),
        ],
      ),
    );
  }
}
