// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  final String status;
  final String quantity;

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
    required this.status,
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
    String? status,
    String? quantity,
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
      status: status ?? this.status,
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
      'status': status,
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
      status: map['status'] as String,
      quantity: map['quantity'] as String,
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
      status,
      quantity,
    ];
  }
}
