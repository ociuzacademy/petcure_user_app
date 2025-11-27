// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_user_app/core/enums/user_order_delivery_status.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  final int id;
  final int user;
  final DateTime orderDate;
  final UserOrderDeliveryStatus status;
  final String totalAmount;
  final DateTime estimatedDeliveryDate;
  final List<Item> items;

  const OrderDetailsModel({
    required this.id,
    required this.user,
    required this.orderDate,
    required this.status,
    required this.totalAmount,
    required this.estimatedDeliveryDate,
    required this.items,
  });

  OrderDetailsModel copyWith({
    int? id,
    int? user,
    DateTime? orderDate,
    UserOrderDeliveryStatus? status,
    String? totalAmount,
    DateTime? estimatedDeliveryDate,
    List<Item>? items,
  }) => OrderDetailsModel(
    id: id ?? this.id,
    user: user ?? this.user,
    orderDate: orderDate ?? this.orderDate,
    status: status ?? this.status,
    totalAmount: totalAmount ?? this.totalAmount,
    estimatedDeliveryDate: estimatedDeliveryDate ?? this.estimatedDeliveryDate,
    items: items ?? this.items,
  );

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json['id'],
        user: json['user'],
        orderDate: DateTime.parse(json['order_date']),
        status: UserOrderDeliveryStatus.fromString(json['status']),
        totalAmount: json['total_amount'],
        estimatedDeliveryDate: DateTime.parse(json['estimated_delivery_date']),
        items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'order_date': orderDate.toIso8601String(),
    'status': status.value,
    'total_amount': totalAmount,
    'estimated_delivery_date': estimatedDeliveryDate.toIso8601String(),
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  final Product product;
  final int quantity;
  final String productPrice;
  final String totalPrice;

  const Item({
    required this.product,
    required this.quantity,
    required this.productPrice,
    required this.totalPrice,
  });

  Item copyWith({
    Product? product,
    int? quantity,
    String? productPrice,
    String? totalPrice,
  }) => Item(
    product: product ?? this.product,
    quantity: quantity ?? this.quantity,
    productPrice: productPrice ?? this.productPrice,
    totalPrice: totalPrice ?? this.totalPrice,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    product: Product.fromJson(json['product']),
    quantity: json['quantity'],
    productPrice: json['product_price'],
    totalPrice: json['total_price'],
  );

  Map<String, dynamic> toJson() => {
    'product': product.toJson(),
    'quantity': quantity,
    'product_price': productPrice,
    'total_price': totalPrice,
  };
}

class Product {
  final int id;
  final String name;
  final String description;
  final String price;
  final int stock;
  final int productcategory;
  final String productcategoryName;
  final int petcategory;
  final String petcategoryName;
  final int petsubcategory;
  final String petsubcategoryName;
  final DateTime createdAt;
  final List<Image> images;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.productcategory,
    required this.productcategoryName,
    required this.petcategory,
    required this.petcategoryName,
    required this.petsubcategory,
    required this.petsubcategoryName,
    required this.createdAt,
    required this.images,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    int? stock,
    int? productcategory,
    String? productcategoryName,
    int? petcategory,
    String? petcategoryName,
    int? petsubcategory,
    String? petsubcategoryName,
    DateTime? createdAt,
    List<Image>? images,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    price: price ?? this.price,
    stock: stock ?? this.stock,
    productcategory: productcategory ?? this.productcategory,
    productcategoryName: productcategoryName ?? this.productcategoryName,
    petcategory: petcategory ?? this.petcategory,
    petcategoryName: petcategoryName ?? this.petcategoryName,
    petsubcategory: petsubcategory ?? this.petsubcategory,
    petsubcategoryName: petsubcategoryName ?? this.petsubcategoryName,
    createdAt: createdAt ?? this.createdAt,
    images: images ?? this.images,
  );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    price: json['price'],
    stock: json['stock'],
    productcategory: json['productcategory'],
    productcategoryName: json['productcategory_name'],
    petcategory: json['petcategory'],
    petcategoryName: json['petcategory_name'],
    petsubcategory: json['petsubcategory'],
    petsubcategoryName: json['petsubcategory_name'],
    createdAt: DateTime.parse(json['created_at']),
    images: List<Image>.from(json['images'].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'stock': stock,
    'productcategory': productcategory,
    'productcategory_name': productcategoryName,
    'petcategory': petcategory,
    'petcategory_name': petcategoryName,
    'petsubcategory': petsubcategory,
    'petsubcategory_name': petsubcategoryName,
    'created_at': createdAt.toIso8601String(),
    'images': List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  final int id;
  final String image;

  const Image({required this.id, required this.image});

  Image copyWith({int? id, String? image}) =>
      Image(id: id ?? this.id, image: image ?? this.image);

  factory Image.fromJson(Map<String, dynamic> json) =>
      Image(id: json['id'], image: json['image']);

  Map<String, dynamic> toJson() => {'id': id, 'image': image};
}
