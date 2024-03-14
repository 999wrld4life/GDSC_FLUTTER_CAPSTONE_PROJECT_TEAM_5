import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());
  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Order Screen',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Active',
                      style: textStyle(
                          18.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.bold,
                          1.1),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed(RouteClass.seeAllPage);
                      },
                      child: Text(
                        'See all',
                        style: textStyle(
                            13.sp, Colors.blue.shade400, FontWeight.bold, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              statusBuilder('active', user!),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Completed',
                      style: textStyle(
                          18.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.bold,
                          1.1),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed(RouteClass.seeAllPage);
                      },
                      child: Text(
                        'See all',
                        style: textStyle(
                            13.sp, Colors.blue.shade400, FontWeight.bold, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              statusBuilder('completed', user)
            ],
          ),
        ),
      ),
    );
  }

  Widget statusBuilder(String status, User? user) {
    return Container(
      height: 120.h,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user_data')
            .doc(user!.uid)
            .collection('order')
            .where('status', isEqualTo: status)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final products = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Product.fromMap(data);
          }).toList();

          return GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {},
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product.imageUrl,
                        height: 80,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('\$${product.price}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
