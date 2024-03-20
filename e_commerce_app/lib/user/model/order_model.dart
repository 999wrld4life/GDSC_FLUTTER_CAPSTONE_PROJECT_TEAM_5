// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/user/model/cart_model.dart';
import 'package:equatable/equatable.dart';

class MyOrders extends Equatable {
  final List<Cart> orders;
  final double totalPrice;
  

  MyOrders({
    required this.orders,
    required this.totalPrice,
  });

  MyOrders copyWith({
    List<Cart>? orders,
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

  factory MyOrders.fromEmpty(){
    return MyOrders(
      orders: [],
      totalPrice: 0,
    );
  }

  // factory MyOrders.fromMap(Map<String, Cart> map) {
  //   return MyOrders(
  //     orders: List<Cart>.from((map['products'] as List<Cart>).map<Cart>((x) => Cart.fromMap(x as Map<String,dynamic>),),),
  //     totalPrice: map['totalPrice'] as double,
  //   );
  // }

  factory MyOrders.fromMap(Map<String, dynamic> map) {
  // if (map == null) return null; // Return null if map is null
  
  List<Cart> orders = [];
  if (map['products'] is List<dynamic>) {
    orders = (map['products'] as List<dynamic>).map((x) {
      if (x is Map<String, dynamic>) {
        return Cart.fromMap(x);
      } else {
        // Handle invalid data here, e.g., return a default Cart object
        return Cart.fromEmpty(); // Example of handling invalid data
      }
    }).toList();
  }

  double totalPrice = map['totalPrice'] as double ?? 0.0; // Provide a default value if totalPrice is null
  
  return MyOrders(
    orders: orders,
    totalPrice: totalPrice,
  );
}

  String toJson() => json.encode(toMap());

  factory MyOrders.fromJson(String source) => MyOrders.fromMap(json.decode(source) as Map<String, Cart>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [orders, totalPrice];
}
