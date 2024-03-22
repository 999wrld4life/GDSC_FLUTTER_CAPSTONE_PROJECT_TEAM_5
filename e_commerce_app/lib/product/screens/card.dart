import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.h,
      shadowColor: Theme.of(context).colorScheme.secondaryContainer,
      child: Container(
        width: 340.w,
        height: 130.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade500,
              Colors.blue.shade800,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Winter Discount',
                    style: textStyle(14.sp, Colors.white, FontWeight.bold, 1.1),
                  ),
                  Text(
                    '    20% off',
                    style: textStyle(20.sp, Colors.white, FontWeight.bold, 1),
                  ),
                  Text(
                    '  For Children',
                    style: textStyle(14.sp, Colors.white, FontWeight.bold, 1.1),
                  )
                ],
              ),
              Image.asset('assets/card.png')
            ],
          ),
        ),
      ),
    );
  }
}
