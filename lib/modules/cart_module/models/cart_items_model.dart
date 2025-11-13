// To parse this JSON data, do
//
//     final cartItemsModel = cartItemsModelFromJson(jsonString);

import 'dart:convert';

CartItemsModel cartItemsModelFromJson(String str) =>
    CartItemsModel.fromJson(json.decode(str));

String cartItemsModelToJson(CartItemsModel data) => json.encode(data.toJson());

class CartItemsModel {
  final bool success;
  final int count;
  final double totalPrice;
  final List<CartItem> cartItems;

  const CartItemsModel({
    required this.success,
    required this.count,
    required this.totalPrice,
    required this.cartItems,
  });

  CartItemsModel copyWith({
    bool? success,
    int? count,
    double? totalPrice,
    List<CartItem>? cartItems,
  }) => CartItemsModel(
    success: success ?? this.success,
    count: count ?? this.count,
    totalPrice: totalPrice ?? this.totalPrice,
    cartItems: cartItems ?? this.cartItems,
  );

  factory CartItemsModel.fromJson(Map<String, dynamic> json) => CartItemsModel(
    success: json['success'],
    count: json['count'],
    totalPrice: json['total_price'],
    cartItems: List<CartItem>.from(
      json['cart_items'].map((x) => CartItem.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'count': count,
    'total_price': totalPrice,
    'cart_items': List<dynamic>.from(cartItems.map((x) => x.toJson())),
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
