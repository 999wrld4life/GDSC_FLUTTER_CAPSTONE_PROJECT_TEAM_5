import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/product/screens/card.dart';
import 'package:e_commerce_app/product/screens/search_screen.dart';
import 'package:e_commerce_app/views/pages/all_products_screen.dart';
import 'package:e_commerce_app/views/pages/util/catagory_builder.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   toolbarHeight: 30,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user?.photoURL ??
                        'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello!',
                      ),
                      Text(
                        user?.displayName ?? 'unknown',
                        style: textStyle(
                            18,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.grey[300]?.withOpacity(0.5),
                    radius: 25,
                    child: Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(children: [
                    Icon(
                      Icons.search,
                      size: 40,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Search here",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  SizedBox(
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
                      jumpScale: 2,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8.h),
              Row(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllProductScreen(),
                          ));
                    },
                    child: const Text('See all',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6055D8),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              const CatagoryBuilder(),
              SizedBox(height: 8.h),
              Row(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AllProductScreen(),));
                    },
                    child: const Text('See all',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6055D8),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              const CatagoryBuilder(),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Collections',
                    style: textStyle(
                        18.sp,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1.1),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AllProductScreen(),));
                    },
                    child: const Text('See all',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6055D8),
                        )),
                  ),
                ],
              ),
              const CatagoryBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
