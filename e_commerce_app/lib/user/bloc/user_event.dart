part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class AddCartEvent extends UserEvent{
  final Product cartItem;
  final String userId;

  AddCartEvent({required this.cartItem, required this.userId});

  @override
  List<Object?> get props => [cartItem, userId];
}

class RemoveCartEvent extends UserEvent{
  final String userId;
  final String docId;

  RemoveCartEvent({required this.userId, required this.docId});
  
  @override
  List<Object?> get props => [userId, docId];
}

class UpdateCartEvent extends UserEvent{
  final Cart cartItem;
  final String userId;
  final int quantity;

  UpdateCartEvent({required this.cartItem, required this.userId, required this.quantity});

  @override
  List<Object?> get props => [cartItem, userId, quantity];
}

class LoadCartEvent extends UserEvent {
  final String userId;

  LoadCartEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}


class AddOrderEvent extends UserEvent{
  final Product cartItem;
  final String userId;

  AddOrderEvent({required this.cartItem, required this.userId});

  @override
  List<Object?> get props => [cartItem, userId];
}

class BuyNowEvent extends UserEvent{
  final Product cartItem;
  final String userId;

  BuyNowEvent({required this.cartItem, required this.userId});

  @override
  List<Object?> get props => [cartItem, userId];

}

 class AddOrderFromEvent extends UserEvent{
  final List<Cart> products;
  final double price;
  final String userId;

  AddOrderFromEvent({required this.products, required this.price, required this.userId});

  @override
  List<Object?> get props => [products, price, userId];
 }

 class LoadAllProductsEvent extends UserEvent {}

 class UpdateProductevent extends UserEvent{
  final Product product;
  final String imageUrl;
  final String productId;

  UpdateProductevent({required this.product,required this.imageUrl,required this.productId});

  @override
  List<Object?> get props => [product, imageUrl, productId];
 }