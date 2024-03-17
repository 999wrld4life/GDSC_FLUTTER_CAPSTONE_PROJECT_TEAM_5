part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class CartLoadingState extends UserState {}

class CartAddedState extends UserState {}

class CartRemovedState extends UserState {}

class CartErrorState extends UserState{
  final String message;

  CartErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CartUpdatedState extends UserState{
  final Cart cart;

  CartUpdatedState({required this.cart});

  @override
  List<Object?> get props => [cart];
}

class CartLoadedState extends UserState{
  final List<Cart> cart;

  CartLoadedState({required this.cart});

  @override
  List<Object?> get props => [cart];
}

class OrderLoadingState extends UserState {}

class OrderAddedState extends UserState {
  final Product order;

  OrderAddedState({required this.order});

  @override
  List<Object?> get props => [order];
}
class OrderLoadedState extends UserState{
  final List<MyOrders> orders;

  OrderLoadedState({required this.orders});

  @override
  List<Object?> get props => [orders];
}

class SpecificOrderLoadedState extends UserState{
  final MyOrders order;

  SpecificOrderLoadedState({required this.order});

  @override
  List<Object?> get props => [order];
}

class ProductLoadedState extends UserState{
  final Product products;

  ProductLoadedState({required this.products});

  @override
  List<Object?> get props => [products];
}

class BuyNowState extends UserState{
  final Product product;

  BuyNowState({required this.product});

  @override
  List<Object?> get props => [product];

}
