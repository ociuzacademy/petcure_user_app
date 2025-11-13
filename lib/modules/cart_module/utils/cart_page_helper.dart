// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

class CartPageHelper {
  final BuildContext context;
  const CartPageHelper({required this.context});

  void updateQuantity(int cartItemId, int newQuantity) {
    final ProductOrderBloc productOrderBloc = context.read<ProductOrderBloc>();
    productOrderBloc.add(
      ProductOrderEvent.updatingCartItemQuantity(cartItemId, newQuantity),
    );
  }

  void placeOrder() {
    final ProductOrderBloc productOrderBloc = context.read<ProductOrderBloc>();
    productOrderBloc.add(const ProductOrderEvent.makingPurchase());
  }
}
