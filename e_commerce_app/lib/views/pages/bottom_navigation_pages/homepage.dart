import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/screens/card.dart';
import 'package:e_commerce_app/product/screens/details.dart';
import 'package:e_commerce_app/product/screens/product_details_screen.dart';
import 'package:e_commerce_app/user/bloc/user_bloc.dart';
import 'package:e_commerce_app/user/repo/user_repo.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());
  final _controller = PageController();
  final UserRepo _userRepo = UserRepo();

  void _addTocart({required Product product}) {
    User? user = _authBloc.repo.getCurrentUser();
    context
        .read<UserBloc>()
        .add(AddCartEvent(cartItem: product, userId: user!.uid));
    print('----------bugging inside _addTocart function ----------------');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ProductDetailsScreen(product: product),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user?.photoURL ??
                            'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello,',
                          ),
                          Text(
                            user?.displayName ?? 'unknown',
                            style: textStyle(
                                20,
                                Theme.of(context).colorScheme.inversePrimary,
                                FontWeight.bold,
                                1),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.notifications),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 130.h,
                        width: 340.w,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: _controller,
                          children: const [
                            MyCard(),
                            MyCard(),
                            MyCard(),
                            MyCard(),
                          ],
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 4,
                        effect: const JumpingDotEffect(
                          activeDotColor: Colors.deepPurple,
                          dotHeight: 12,
                          dotWidth: 12,
                          verticalOffset: 4,
                          jumpScale: 1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured',
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
                            style: textStyle(13.sp, Colors.blue.shade400,
                                FontWeight.bold, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height: 120.h,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          return Product.fromMap(data);
                        }).toList();

                        return GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                        product: product,
                                      ),
                                    ));
                              },
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Popular',
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
                            style: textStyle(13.sp, Colors.blue.shade400,
                                FontWeight.bold, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height: 120.h,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          return Product.fromMap(data);
                        }).toList();

                        return GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreen(product: product),
                                  ),
                                );
                              },
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
