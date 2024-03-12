import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: textStyle(
                  16.sp,
                  Theme.of(context).colorScheme.inversePrimary,
                  FontWeight.bold,
                  1.1),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Item',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
                Text(
                  '3',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
                Text(
                  '3',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
                Text(
                  '3',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Charges',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
                Text(
                  '3',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const Divider(
              thickness: 2,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
                Text(
                  '3',
                  style: textStyle(
                      14.sp,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.normal,
                      1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
