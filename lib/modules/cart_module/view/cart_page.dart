// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/core/models/cart_item.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/cart_module/utils/cart_page_helper.dart';
import 'package:petcure_user_app/modules/cart_module/widgets/cart_item_widget.dart';
import 'package:petcure_user_app/modules/cart_module/widgets/order_summary.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();

  static route() => MaterialPageRoute(builder: (context) => const CartPage());
}

class _CartPageState extends State<CartPage> {
  late final CartPageHelper _cartPageHelper;
  final ValueNotifier<List<CartItem>> _cartItems =
      ValueNotifier<List<CartItem>>([]);
  final ValueNotifier<double> _totalAmount = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    _cartPageHelper = CartPageHelper(
      context: context,
      cartItems: _cartItems,
      totalAmount: _totalAmount,
    );
    _cartItems.value = FakeData.generateFakeCartItems(count: 5);
    _cartPageHelper.calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: AppPalette.firstColor,
        foregroundColor: Colors.white,
      ),
      body: ValueListenableBuilder(
        valueListenable: _cartItems,
        builder: (context, cartItems, child) {
          return Column(
            children: [
              // Cart Items List
              Expanded(
                child: cartItems.isEmpty
                    ? const Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return CartItemWidget(
                            item: item,
                            index: index,
                            onUpdatingQuantity: _cartPageHelper.updateQuantity,
                          );
                        },
                      ),
              ),

              // Order Summary
              if (cartItems.isNotEmpty)
                ValueListenableBuilder(
                  valueListenable: _totalAmount,
                  builder: (context, totalAmount, child) {
                    return OrderSummary(
                      totalAmount: totalAmount,
                      cartItems: cartItems,
                      placeOrder: _cartPageHelper.placeOrder,
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
