// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/cart_module/models/cart_items_model.dart';
import 'package:petcure_user_app/modules/cart_module/utils/cart_page_helper.dart';
import 'package:petcure_user_app/modules/cart_module/widgets/cart_item_widget.dart';
import 'package:petcure_user_app/modules/cart_module/widgets/order_summary.dart';
import 'package:petcure_user_app/modules/payment_module/view/payment_page.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';
import 'package:petcure_user_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();

  static route() => MaterialPageRoute(builder: (context) => const CartPage());
}

class _CartPageState extends State<CartPage> {
  late final CartPageHelper _cartPageHelper;

  @override
  void initState() {
    super.initState();
    _cartPageHelper = CartPageHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cartPageHelper.userCartItemsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: AppPalette.firstColor,
        foregroundColor: Colors.white,
      ),
      body: BlocListener<ProductOrderBloc, ProductOrderState>(
        listener: (context, state) {
          switch (state) {
            case ProductOrderLoading(:final message):
              OverlayLoader.show(context, message: message);
              break;
            case ProductOrderError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: errorMessage);
              break;
            case CartItemQuantityChanged(:final response):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(context, message: response.message);
              _cartPageHelper.userCartItemsInit();
              break;
            case PurchaseMade(:final response):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(context, message: response.message);
              Navigator.push(
                context,
                PaymentPage.route(
                  orderId: response.orderId,
                  totalRate: response.amountToPay,
                ),
              );
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: BlocBuilder<CartItemsCubit, CartItemsState>(
          builder: (context, state) {
            switch (state) {
              case CartItemsInitial _:
              case CartItemsLoading _:
                return const ListItemLoadingWidget(
                  itemCount: 5,
                  useSliver: false,
                );
              case CartItemsError(:final errorMessage):
                return CustomErrorWidget(
                  onRetry: _cartPageHelper.userCartItemsInit,
                  errorMessage: errorMessage,
                );
              case UserCartEmpty _:
                return const Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                );
              case UserCartItemsSuccess(:final cartItemsData):
                final List<CartItem> cartItems = cartItemsData.cartItems;
                return Column(
                  children: [
                    // Cart Items List
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return CartItemWidget(
                            item: item,
                            index: item.id,
                            onUpdatingQuantity: _cartPageHelper.updateQuantity,
                          );
                        },
                      ),
                    ),

                    // Order Summary
                    if (cartItems.isNotEmpty)
                      OrderSummary(
                        totalAmount: cartItemsData.totalPrice,
                        cartItems: cartItems,
                        placeOrder: _cartPageHelper.placeOrder,
                      ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
