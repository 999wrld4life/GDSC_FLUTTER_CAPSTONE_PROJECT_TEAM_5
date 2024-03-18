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