// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/models/cart_item.dart';
import 'package:petcure_user_app/modules/payment_module/view/payment_page.dart';

class CartPageHelper {
  final BuildContext context;
  final ValueNotifier<List<CartItem>> cartItems;
  final ValueNotifier<double> totalAmount;
  const CartPageHelper({
    required this.context,
    required this.cartItems,
    required this.totalAmount,
  });

  void calculateTotal() {
    totalAmount.value = cartItems.value.fold(0.0, (sum, item) {
      return sum + (item.productPrice * item.quantity);
    });
  }

  void updateQuantity(int index, int newQuantity) {
    // Create a new list to ensure proper notification
    final newList = List<CartItem>.from(cartItems.value);

    if (newQuantity <= 0) {
      newList.removeAt(index);
    } else {
      newList[index] = CartItem(
        product: newList[index].product,
        quantity: newQuantity,
        productPrice: newQuantity * newList[index].product.price,
        deliveryDate: DateTime.now().add(
          Duration(days: newList[index].product.daysToDeliver),
        ),
      );
    }

    // Update the value notifier with the new list
    cartItems.value = newList;
    calculateTotal();
  }

  void placeOrder() {
    Navigator.push(
      context,
      PaymentPage.route(orderId: 'ORD-001', totalRate: totalAmount.value),
    );
  }
}
