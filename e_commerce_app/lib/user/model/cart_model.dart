// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_app/product/model/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final String name;
  final String description;
  final String brand;
  final String toWhom;
  final double price;
  final double star;
  final String color;
  final String imageUrl;
  final List<String> review;
  final List<String> size;
  final int quantity;

  const Cart({
    required this.name,
    required this.description,
    required this.brand,
    required this.toWhom,
    required this.price,
    this.star = 3.0,
    required this.color,
    required this.imageUrl,
    this.review = const [],
    this.size = const [],
    required this.quantity,
  });

  Cart copyWith({
    String? name,
    String? description,
    String? brand,
    String? toWhom,
    double? price,
    double? star,
    String? color,
    String? imageUrl,
    List<String>? review,
    List<String>? size,
    int? quantity,
  }) {
    return Cart(
      name: name ?? this.name,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      toWhom: toWhom ?? this.toWhom,
      price: price ?? this.price,
      star: star ?? this.star,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
      review: review ?? this.review,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'brand': brand,
      'toWhom': toWhom,
      'price': price,
      'star': star,
      'color': color,
      'imageUrl': imageUrl,
      'review': review,
      'size': size,
      'quantity': quantity,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      name: map['name'] as String,
      description: map['description'] as String,
      brand: map['brand'] as String,
      toWhom: map['toWhom'] as String,
      price: map['price'] as double,
      star: map['star'] as double,
      color: map['color'] as String,
      imageUrl: map['imageUrl'] as String,
      review: List<String>.from((map['review'] ?? [])),
      size: List<String>.from((map['size'] ?? [])),
      quantity: map['quantity'] as int,
    );
  }

  factory Cart.fromProduct(Product product) {
    return Cart(
      name: product.name,
      description: product.description,
      brand: product.brand,
      toWhom: product.toWhom,
      price: product.price,
      star: product.star,
      color: product.color,
      imageUrl: product.imageUrl,
      review: product.review,
      size: product.size,
      quantity: 1,
    );
  }

  factory Cart.fromEmpty(){
    return const Cart(
      name: '',
      description: '',
      brand: '',
      toWhom: '',
      price: 0.0,
      star: 0.0,
      color: '',
      imageUrl: '',
      review: [],
      size: [],
      quantity: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      description,
      brand,
      toWhom,
      price,
      star,
      color,
      imageUrl,
      review,
      size,
      quantity,
    ];
  }
}
