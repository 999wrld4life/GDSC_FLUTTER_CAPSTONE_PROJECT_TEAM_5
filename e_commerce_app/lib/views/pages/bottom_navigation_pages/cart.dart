import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/screens/checkout_screen.dart';
import 'package:e_commerce_app/user/bloc/user_bloc.dart';
import 'package:e_commerce_app/user/model/cart_model.dart';
import 'package:e_commerce_app/user/screens/order_summary.dart';
import 'package:e_commerce_app/views/shared/buttons/button.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());
  int quantity = 1;
  double finalTotal = 0;
  late List<Cart> _list = [];

  void updateTotal(double total) {
    finalTotal = total;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? dontRebuild() {
    User? user = _authBloc.repo.getCurrentUser();
    return FirebaseFirestore.instance
        .collection('user_data')
        .doc(user!.uid)
        .collection('cart')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? dontRebuildAgain;

  void _removeFromCart(Cart cart) {
    User? user = _authBloc.repo.getCurrentUser();
    context
        .read<UserBloc>()
        .add(RemoveCartEvent(userId: user!.uid, docId: cart.name));
    print('----------bugging inside _removeFromCart function ----------------');
  }

  @override
  void initState() {
    final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());
    User? user = _authBloc.repo.getCurrentUser();
    super.initState();
    context.read<UserBloc>().add(LoadCartEvent(userId: user!.uid));
  }

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is CartRemovedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item successfully removed from the cart')));
        }
      },
      child: Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                size: 40,
              ),
            ),
            title: const Text(
              'Cart',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.more_vert_rounded,
                  size: 40,
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is CartLoadedState) {
                        _list = state.cart;
                        return ListView.builder(
                          itemCount: state.cart.length,
                          itemBuilder: (context, index) {
                            final product = state.cart[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(248, 247, 247, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8.w),
                                          height: 80.h,
                                          width: 120.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  product.imageUrl,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              product.name,
                                              style: textStyle(
                                                  12.sp,
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                  FontWeight.bold,
                                                  1.1),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              product.brand,
                                              style: textStyle(
                                                  12.sp,
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                  FontWeight.normal,
                                                  1.1),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              '\$ ${product.price}',
                                              style: textStyle(
                                                  12.sp,
                                                  const Color.fromRGBO(
                                                      96, 85, 216, 1),
                                                  FontWeight.bold,
                                                  1),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 8.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context.read<UserBloc>().add(
                                                  RemoveCartEvent(
                                                      userId: user!.uid,
                                                      docId: state
                                                          .cart[index].name));
                                            },
                                            child: Icon(Icons.delete,
                                                color: Colors.red.shade300,
                                                size: 35),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  int qu = product.quantity;
                                                  if(qu > 1){
                                                    qu--;
                                                  context.read<UserBloc>().add(
                                                      UpdateCartEvent(
                                                          cartItem: product,
                                                          userId: user!.uid,
                                                          quantity: qu));
                                                  }
                                                },
                                                child: const CircleAvatar(
                                                  radius: 12,
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          96, 85, 216, 1),
                                                  child: Icon(Icons.remove),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                product.quantity.toString(),
                                                style: textStyle(
                                                    16.sp,
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .inversePrimary,
                                                    FontWeight.bold,
                                                    1.3),
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  int qu = product.quantity;
                                                  qu++;
                                                  context.read<UserBloc>().add(
                                                      UpdateCartEvent(
                                                          cartItem: product,
                                                          userId: user!.uid,
                                                          quantity: qu));
                                                },
                                                child: const CircleAvatar(
                                                  radius: 12,
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          96, 85, 216, 1),
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else  {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } 
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                OrderSummary(
                  onTotalChanged: updateTotal,
                ),
                SizedBox(height: 10.h),
                Center(
                  child: GestureDetector(
                      onTap: () {
                        // context.read<UserBloc>().add(AddOrderEvent(cartItem: cartItem, userId: userId))
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOutScreen(orders: _list,),
                            ));
                      },
                      child: Button(
                        buttonWidth: 330.w,
                        text: 'Check out',
                      )),
                )
              ],
            ),
          )),
    );
  }
}
