// To parse this JSON data, do
//
//     final addToCartResponseModel = addToCartResponseModelFromJson(jsonString);

import 'dart:convert';

AddToCartResponseModel addToCartResponseModelFromJson(String str) =>
    AddToCartResponseModel.fromJson(json.decode(str));

String addToCartResponseModelToJson(AddToCartResponseModel data) =>
    json.encode(data.toJson());

class AddToCartResponseModel {
  final bool success;
  final String message;
  final CartItem cartItem;

  const AddToCartResponseModel({
    required this.success,
    required this.message,
    required this.cartItem,
  });

  AddToCartResponseModel copyWith({
    bool? success,
    String? message,
    CartItem? cartItem,
  }) => AddToCartResponseModel(
    success: success ?? this.success,
    message: message ?? this.message,
    cartItem: cartItem ?? this.cartItem,
  );

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) =>
      AddToCartResponseModel(
        success: json['success'],
        message: json['message'],
        cartItem: CartItem.fromJson(json['cart_item']),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'cart_item': cartItem.toJson(),
  };
}

class CartItem {
  final int id;
  final String user;
  final int product;
  final String productName;
  final int quantity;
  final String totalPrice;

  const CartItem({
    required this.id,
    required this.user,
    required this.product,
    required this.productName,
    required this.quantity,
    required this.totalPrice,
  });

  CartItem copyWith({
    int? id,
    String? user,
    int? product,
    String? productName,
    int? quantity,
    String? totalPrice,
  }) => CartItem(
    id: id ?? this.id,
    user: user ?? this.user,
    product: product ?? this.product,
    productName: productName ?? this.productName,
    quantity: quantity ?? this.quantity,
    totalPrice: totalPrice ?? this.totalPrice,
  );

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json['id'],
    user: json['user'],
    product: json['product'],
    productName: json['product_name'],
    quantity: json['quantity'],
    totalPrice: json['total_price'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'product': product,
    'product_name': productName,
    'quantity': quantity,
    'total_price': totalPrice,
  };
}
