// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

class CartPageHelper {
  final BuildContext context;
  const CartPageHelper({required this.context});

  void userCartItemsInit() {
    final CartItemsCubit cartItemsCubit = context.read<CartItemsCubit>();

    cartItemsCubit.getUserCartItems();
  }

  void updateQuantity(int cartItemId, int newQuantity) {
    final ProductOrderBloc productOrderBloc = context.read<ProductOrderBloc>();
    productOrderBloc.add(
      ProductOrderEvent.updatingCartItemQuantity(cartItemId, newQuantity),
    );
  }

  void showPlaceOrderDialogueBox() {
    CustomDialogBox.showCustomDialog(
      context: context,
      title: 'Place Order',
      message:
          'Do you wanted to place this order with all the current cart items?',
      onSubmit: _placeOrder,
    );
  }

  void _placeOrder() {
    final ProductOrderBloc productOrderBloc = context.read<ProductOrderBloc>();
    productOrderBloc.add(const ProductOrderEvent.makingPurchase());
  }
}
