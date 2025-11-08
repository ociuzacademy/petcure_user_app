// To parse this JSON data, do
//
//     final petProductModel = petProductModelFromJson(jsonString);

import 'dart:convert';

List<PetProductModel> petProductModelFromJson(String str) =>
    List<PetProductModel>.from(
      json.decode(str).map((x) => PetProductModel.fromJson(x)),
    );

String petProductModelToJson(List<PetProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetProductModel {
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

  const PetProductModel({
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

  PetProductModel copyWith({
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
  }) => PetProductModel(
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

  factory PetProductModel.fromJson(Map<String, dynamic> json) =>
      PetProductModel(
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
