// To parse this JSON data, do
//
//     final cartItemUpdateQuantityResponseModel = cartItemUpdateQuantityResponseModelFromJson(jsonString);

import 'dart:convert';

CartItemUpdateQuantityResponseModel cartItemUpdateQuantityResponseModelFromJson(
  String str,
) => CartItemUpdateQuantityResponseModel.fromJson(json.decode(str));

String cartItemUpdateQuantityResponseModelToJson(
  CartItemUpdateQuantityResponseModel data,
) => json.encode(data.toJson());

class CartItemUpdateQuantityResponseModel {
  final bool success;
  final String message;
  final CartItem cartItem;

  const CartItemUpdateQuantityResponseModel({
    required this.success,
    required this.message,
    required this.cartItem,
  });

  CartItemUpdateQuantityResponseModel copyWith({
    bool? success,
    String? message,
    CartItem? cartItem,
  }) => CartItemUpdateQuantityResponseModel(
    success: success ?? this.success,
    message: message ?? this.message,
    cartItem: cartItem ?? this.cartItem,
  );

  factory CartItemUpdateQuantityResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => CartItemUpdateQuantityResponseModel(
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
  final int user;
  final int product;
  final String productName;
  final List<ProductImage> productImages;
  final int quantity;
  final String totalPrice;

  const CartItem({
    required this.id,
    required this.user,
    required this.product,
    required this.productName,
    required this.productImages,
    required this.quantity,
    required this.totalPrice,
  });

  CartItem copyWith({
    int? id,
    int? user,
    int? product,
    String? productName,
    List<ProductImage>? productImages,
    int? quantity,
    String? totalPrice,
  }) => CartItem(
    id: id ?? this.id,
    user: user ?? this.user,
    product: product ?? this.product,
    productName: productName ?? this.productName,
    productImages: productImages ?? this.productImages,
    quantity: quantity ?? this.quantity,
    totalPrice: totalPrice ?? this.totalPrice,
  );

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json['id'],
    user: json['user'],
    product: json['product'],
    productName: json['product_name'],
    productImages: List<ProductImage>.from(
      json['product_images'].map((x) => ProductImage.fromJson(x)),
    ),
    quantity: json['quantity'],
    totalPrice: json['total_price'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'product': product,
    'product_name': productName,
    'product_images': List<dynamic>.from(productImages.map((x) => x.toJson())),
    'quantity': quantity,
    'total_price': totalPrice,
  };
}

class ProductImage {
  final String image;

  const ProductImage({required this.image});

  ProductImage copyWith({String? image}) =>
      ProductImage(image: image ?? this.image);

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      ProductImage(image: json['image']);

  Map<String, dynamic> toJson() => {'image': image};
}
