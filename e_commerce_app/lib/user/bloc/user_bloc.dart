import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/repo/product_repo.dart';
import 'package:e_commerce_app/user/model/cart_model.dart';
import 'package:e_commerce_app/user/model/order_model.dart';
import 'package:e_commerce_app/user/repo/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo;
  final ProductRepo _productRepo;
  UserBloc({
    required UserRepo userRepo,
    required ProductRepo productRepo,

  })  : _userRepo = userRepo,
        _productRepo = productRepo,
  super(UserInitial()) {
    on<AddCartEvent>((event, emit) async{
      try {
        await _userRepo.addToCart(product: event.cartItem, userId: event.userId);
        final reu = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(event.userId)
        .collection('cart')
        .get();
        final carts = reu.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return Cart.fromMap(data);
                  }).toList();
        emit(CartAddedState());
        emit(CartLoadedState(cart: carts));
      } catch (e) {
        emit(CartErrorState(message: 'Error adding to cart $e'));
      }
    });
    on<RemoveCartEvent>((event, emit)async{
      try {
        _userRepo.removeFromCart(userId: event.userId, docId: event.docId);
        final reu = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(event.userId)
        .collection('cart')
        .get();
        final carts = reu.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return Cart.fromMap(data);
                  }).toList();
        emit(CartRemovedState());
        emit(CartLoadedState(cart: carts));
      } catch (e) {
        emit(CartErrorState(message: 'Error while removing from cart $e'));
      }
    });
    on<UpdateCartEvent>((event, emit) async{
      try {
        await _userRepo.updateCartItem(product: event.cartItem, userId: event.userId, docId: event.cartItem.name, quantity: event.quantity);
        final reu = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(event.userId)
        .collection('cart')
        .get();
        final carts = reu.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return Cart.fromMap(data);
                  }).toList();
        emit(CartLoadedState(cart: carts));
      } catch (e) {
        emit(CartErrorState(message: 'Error while removing from cart $e'));
      }
    },);
    on<LoadCartEvent>((event, emit) async{
      try {
        final reu = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(event.userId)
        .collection('cart')
        .get();
        final carts = reu.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return Cart.fromMap(data);
                  }).toList();
        print(carts);
        emit(CartLoadedState(cart: carts));
      } catch (e) {
        emit(CartErrorState(message: 'Error while loading cart $e'));
      }
    });
    on<LoadAllProductsEvent>((event, emit) async{
      try {
        final reu = await FirebaseFirestore.instance
        .collection('products')
        .get();
        final allproducts = reu.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return Product.fromMap(data,id: doc.id);
                  }).toList();
        // print(carts);
        emit(AllProductsLoadedState(products: allproducts));
      } catch (e) {
        emit(CartErrorState(message: 'Error while loading All Products $e'));
      }
    });
    on<UpdateProductevent>((event, emit) async{
      emit(UpdateProductLoadingState());
      try {
        await _productRepo.editProduct(newProduct: event.product,imageUrl: event.product.imageUrl,productId: event.productId);
        final reu = await FirebaseFirestore.instance
        .collection('products')
        .get();
        final allproducts = reu.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return Product.fromMap(data,id: doc.id);
                  }).toList();
        // print(carts);
        emit(AllProductsLoadedState(products: allproducts));
      } catch (e) {
        emit(CartErrorState(message: 'Error while loading All Products $e'));
      }
    });




    on<AddOrderEvent>((event, emit) async{
      try {
        final ff = await _userRepo.addToOrder(product: event.cartItem, userId: event.userId);
        // emit(OrderAddedState(order: ff!));
      } catch (e) {
        emit(CartErrorState(message: 'Error adding to cart $e'));
      }
    });

    on<BuyNowEvent>((event, emit) async{
      try {
        // await _userRepo.addToOrder(product: event.cartItem, userId: event.userId);
        final fhf = event.cartItem;

        emit(BuyNowState(product: Cart.fromProduct(fhf)));
      } catch (e) {
        emit(CartErrorState(message: 'Error adding to cart $e'));
      }
    });

    on<AddOrderFromEvent>((event, emit) async{
      try {
        await _userRepo.addOrder(products: event.products, price: event.price, userId: event.userId);
        // emit(OrderSuccessState(message: 'Success adding to order from'));
        // emit(BuyNowState(product: Product.fromCart(event.products[0])));
      } catch (e) {
        emit(CartErrorState(message: 'Error adding to cart $e'));
      }
    });

  }
}
