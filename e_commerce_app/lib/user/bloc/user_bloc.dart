import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/user/model/cart_model.dart';
import 'package:e_commerce_app/user/repo/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo;
  UserBloc({
    required UserRepo userRepo,
  })  : _userRepo = userRepo,
  super(UserInitial()) {
    on<AddCartEvent>((event, emit) async{
      try {
        await _userRepo.addToCart(product: event.cartItem, userId: event.userId);
        emit(CartAddedState());
      } catch (e) {
        emit(CartErrorState(message: 'Error adding to cart $e'));
      }
    });
    on<RemoveCartEvent>((event, emit) async{
      try {
        await _userRepo.removeFromCart(product: event.cartItem, userId: event.userId, docId: event.docId);
        emit(CartRemovedState());
      } catch (e) {
        emit(CartErrorState(message: 'Error while removing from cart $e'));
      }
    });
    // on<UpdateCartEvent>((event, emit) async{
    //   try {
    //     await _userRepo.updateCartItem(product: event.cartItem, userId: event.userId, docId: event.cartItem.name, quantity: event.quantity.toString());
    //     emit(CartUpdatedState());
    //   } catch (e) {
    //     emit(CartErrorState(message: 'Error while removing from cart $e'));
    //   }
    // },);
  }
}
