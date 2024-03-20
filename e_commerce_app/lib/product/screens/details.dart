import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/screens/checkout_screen.dart';
import 'package:e_commerce_app/user/bloc/user_bloc.dart';
import 'package:e_commerce_app/user/model/cart_model.dart';
import 'package:e_commerce_app/user/repo/user_repo.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/mainscreen.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatefulWidget {
  final Product product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());
  final UserRepo _userRepo = UserRepo();

  void _addTocart({required Product product}) {
    User? user = _authBloc.repo.getCurrentUser();
    context
        .read<UserBloc>()
        .add(AddCartEvent(cartItem: product, userId: user!.uid));
    print('----------bugging inside _addTocart function ----------------');
  }

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is CartAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Successfully added to Cart')));
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: 340.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(widget.product.imageUrl),
                          fit: BoxFit.cover),
                    ),
                    
                  ),
                  Positioned(
                    top: 40.h,
                    left: 16.w,
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(220, 222, 222, 223),
                          foregroundColor:
                              const Color.fromARGB(158, 95, 94, 94),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(1),
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    right: 16.w,
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(220, 222, 222, 223),
                          foregroundColor:
                              const Color.fromARGB(158, 95, 94, 94),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(1),
                        ),
                        child: const Icon(Icons.favorite),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(
                      top: 8.h, left: 15.w,  right: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: textStyle(
                            23,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.w900,
                            1),
                      ),
                      Text(
                        '\$ ${widget.product.price}',
                        style: textStyle(
                            21,
                            const Color.fromRGBO(96, 85, 216, 1),
                            FontWeight.bold,
                            1),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const MyRatingPage(),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                   'Description',
                    style: textStyle(
                        18,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Description(),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    'Size',
                    style: textStyle(
                        18,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child:  SizedBox(
                    child: Row(
                      children: [
                        SizeOfMaterial(sizeOfMaterial: 8,),
                        SizeOfMaterial(sizeOfMaterial: 10,),
                        SizeOfMaterial(sizeOfMaterial: 38,),
                        SizeOfMaterial(sizeOfMaterial: 40,),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 250.w,
                        child: ElevatedButton(
                          onPressed: () {
                            // context.read<UserBloc>().add(AddOrderFromEvent(products: [Cart.fromProduct(widget.product)], price: widget.product.price));
                            context.read<UserBloc>().add(BuyNowEvent(cartItem: widget.product,userId: user!.uid));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckOutScreen(orders: [Cart.fromProduct(widget.product)],),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(96, 85, 216, 1),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 40.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Text(
                            'Buy Now',
                            style: textStyle(
                                18, Colors.white, FontWeight.bold, 1.2),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () => _addTocart(product: widget.product),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(242, 244, 245, 1),
                            foregroundColor:
                                const Color.fromARGB(255, 122, 121, 121),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: const Icon(Icons.shopping_bag,size: 35,),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SizeOfMaterial extends StatelessWidget {
   SizeOfMaterial({super.key,required this.sizeOfMaterial});
  int sizeOfMaterial;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 50.h,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(
              color: Color.fromARGB(255, 214, 214, 214),
              width: 1.0,
            ),
          ),
          child:  Text(sizeOfMaterial.toString(),style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}

class MyRatingPage extends StatelessWidget {
  const MyRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: 3,
            minRating: 0,
            direction: Axis.horizontal,
            itemCount: 1,
            itemSize: 35,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text(
            '4.5',
            style: textStyle(15, Theme.of(context).colorScheme.inversePrimary,
                FontWeight.bold, 1),
          ),
          Text(
            ' (20 Review)',
            style: textStyle(12, Theme.of(context).colorScheme.inversePrimary,
                FontWeight.normal, 1),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});
   
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(left: 15.w),
        child: Text(
  
 "Proin iaculis felis quis tortor auctor, eu mollis felis ullamcorper. In nec diam semper, placerat enim sit amet, lacinia felis. Nulla nec lacus id velit dictum euismod. Integer dictum arcu nec nulla luctus, eget ultricies neque varius.",
style: textStyle(12.sp, Theme.of(context).colorScheme.inversePrimary,
              FontWeight.normal, 1),
        ),
      )),
    );
  }
}
