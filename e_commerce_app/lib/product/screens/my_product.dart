import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProduct extends StatelessWidget {
  const MyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      height: 130.h,
      width: 160.w,
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
                height: 90.h,
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
                  child: const Icon(
                    Icons.favorite_border,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 2),
            child: Column(
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
          ),
        ],
      ),
    );
  }
}
