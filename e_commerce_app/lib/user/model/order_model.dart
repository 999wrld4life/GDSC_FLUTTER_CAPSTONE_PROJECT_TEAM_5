// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_app/product/model/product.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String status;
  final List<Product> orderProducts;

  const Order({
    required this.status,
    required this.orderProducts,
  });

  Order copyWith({
    String? status,
    List<Product>? orderProducts,
  }) {
    return Order(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'orderProducts': orderProducts.map((x) => x.toMap()).toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      status: map['status'] as String,
      orderProducts: List<Product>.from((map['orderProducts'] as List<int>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, orderProducts];
}
