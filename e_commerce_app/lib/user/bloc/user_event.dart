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
  final Product cartItem;
  final String userId;
  final String docId;

  RemoveCartEvent({required this.cartItem, required this.userId, required this.docId});
  
  @override
  List<Object?> get props => [cartItem, userId, docId];
}

class UpdateCartEvent extends UserEvent{
  final Cart cartItem;
  final String userId;
  final int quantity;

  UpdateCartEvent({required this.cartItem, required this.userId, required this.quantity});

  @override
  List<Object?> get props => [cartItem, userId, quantity];
}
