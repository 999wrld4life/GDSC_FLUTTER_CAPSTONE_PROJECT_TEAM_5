import 'package:flutter/material.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBigProduct extends StatelessWidget {
  const MyBigProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      height: 135.h,
      width: 180.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100.h,
                // width: 170.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(
                              'assets/images/318b065a77b0f2c3eb752665f2fff4b1.png')
                          .image,
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 12.w,
                child: GestureDetector(
                  // ignore: prefer_const_constructors
                  child: Icon(
                    Icons.favorite_border,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 2.h, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Hey',
                      style: textStyle(
                          16,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.bold,
                          1.2),
                    ),
                    const SizedBox(
                        // height: 5,
                        ),
                    Text(
                      '\$40',
                      style: textStyle(16, Colors.purple, FontWeight.bold, 1.2),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    //add to cart
                  },
                  child: const CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
