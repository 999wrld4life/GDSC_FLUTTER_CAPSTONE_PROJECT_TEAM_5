part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class CartAddedState extends UserState {}

class CartRemovedState extends UserState {}

class CartErrorState extends UserState{
  final String message;

  CartErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CartUpdatedState extends UserState{
}
