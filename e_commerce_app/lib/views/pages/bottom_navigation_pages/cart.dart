import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/product/model/product.dart';
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

  void _removeFromCart({required Product product}) {
    User? user = _authBloc.repo.getCurrentUser();
    context.read<UserBloc>().add(RemoveCartEvent(
        cartItem: product, userId: user!.uid, docId: product.name));
    print('----------bugging inside _removeFromCart function ----------------');
  }

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if(state is CartRemovedState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item successfully removed from the cart'))
          );
        }
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
        child: Column(
          children: [
            const Text(
              'Cart',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('user_data')
                    .doc(user!.uid)
                    .collection('cart')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('No carts found'),
                    );
                  }

                  final carts = snapshot.data!.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return Cart.fromMap(data);
                  }).toList();

                  return ListView.builder(
                    itemCount: carts.length,
                    itemBuilder: (context, index) {
                      final product = carts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.w),
                                  height: 80.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          product.imageUrl,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      style: textStyle(12.sp, Colors.deepPurple,
                                          FontWeight.bold, 1),
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
                                      //delete from cart
                                    },
                                    child: const Icon(Icons.delete,
                                        color: Colors.red, size: 35),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          //decrease amount
                                        },
                                        child: const CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.deepPurple,
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        '1',
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
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.deepPurple,
                                        child: IconButton(
                                          onPressed: () {
                                          //  int result = int.parse(product.quantity);
                                          //  result ++;
                                            // context.read<UserBloc>().add(UpdateCartEvent(cartItem: product, userId: user.uid, quantity: result));
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            const OrderSummary(),
            SizedBox(height: 10.h),
            Center(child: Button(buttonWidth: 330.w, text: 'Check out'))
          ],
        ),
      )),
    );
  }
}
