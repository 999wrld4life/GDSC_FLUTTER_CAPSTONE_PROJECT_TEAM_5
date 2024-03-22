// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_app/product/model/product.dart';
import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final List<Product> favoriteProducts;

  const Favorite({
    required this.favoriteProducts,
  });

  Favorite copyWith({
    List<Product>? favoriteProducts,
  }) {
    return Favorite(
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favoriteProducts': favoriteProducts.map((x) => x.toMap()).toList(),
    };
  }

  // factory Favorite.fromMap(Map<String, dynamic> map) {
  //   return Favorite(
  //     favoriteProducts: List<Product>.from((map['favoriteProducts'] as List<int>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory Favorite.fromJson(String source) => Favorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [favoriteProducts];
}
