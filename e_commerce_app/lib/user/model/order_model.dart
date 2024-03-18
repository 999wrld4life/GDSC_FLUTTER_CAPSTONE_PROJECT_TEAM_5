// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_app/product/model/product.dart';
import 'package:equatable/equatable.dart';

class MyOrders extends Equatable {
  final List<Product> orders;
  final double totalPrice;

  MyOrders({
    required this.orders,
    required this.totalPrice,
  });

  MyOrders copyWith({
    List<Product>? orders,
    double? totalPrice,
  }) {
    return MyOrders(
      orders: orders ?? this.orders,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orders': orders.map((x) => x.toMap()).toList(),
      'totalPrice': totalPrice,
    };
  }

  factory MyOrders.fromMap(Map<String, dynamic> map) {
    return MyOrders(
      orders: List<Product>.from((map['orders'] as List<int>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
      totalPrice: map['totalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyOrders.fromJson(String source) => MyOrders.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [orders, totalPrice];
}
