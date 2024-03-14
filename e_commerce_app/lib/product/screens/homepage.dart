import 'package:e_commerce_app/product/screens/card.dart';
import 'package:e_commerce_app/product/screens/my_product.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  final _controller = PageController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
              tileColor: Theme.of(context).colorScheme.background,
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Natty Tem',
                    style: textStyle(
                        16.sp,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1),
                  ),
                  Text(
                    'nattemmol@gmail.com',
                    style: textStyle(
                        12.sp,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1),
                  ),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                radius: 25,
                child: Icon(
                  Icons.notifications,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            // const SearchField(),
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
                    jumpScale: 3,
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
                      style: textStyle(
                          13.sp, Colors.blue.shade400, FontWeight.bold, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            // Container(
            //   height: 130.h,
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (BuildContext context) {
            //             // return const DetailsPage();
            //           },
            //         ),
            //       );
            //     },
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 5,
            //       itemBuilder: (context, index) {
            //         return const MyProduct();
            //       },
            //     ),
            //   ),
            // ),
            SizedBox(height: 10.h),
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
                      style: textStyle(
                          13.sp, Colors.blue.shade400, FontWeight.bold, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 130.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const MyProduct();
                },
              ),
            ),
            SizedBox(
              height: 100.h,
            )
          ],
        ),
      ),
    );
  }
}
