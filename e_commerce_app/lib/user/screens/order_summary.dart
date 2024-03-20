import 'package:e_commerce_app/user/bloc/user_bloc.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  final void Function(double) onTotalChanged;
  const OrderSummary({super.key, required this.onTotalChanged});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if(state is CartLoadedState){
          final items = state.cart.length;
          int total = 0;
          for(int i = 0; i < items; i++){
            total += state.cart[i].quantity;
          }
          final itemCount = items + total;
          double subtotal = 0;
          for(int i = 0; i < items; i++){
            subtotal += state.cart[i].quantity * state.cart[i].price;
          }
          final finalTotal = subtotal + 20 + 50;

          onTotalChanged(finalTotal);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 247, 247, 1),
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
                      total.toString(),
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
                      subtotal.toString(),
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
                      '20',
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
                      '50',
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
                      finalTotal.toString(),
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
      }else if(state is BuyNowState){
          int total = 0;
          double subtotal = state.product.price;
          
          final finalTotal = subtotal + 20 + 50;

          onTotalChanged(finalTotal);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 247, 247, 1),
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
                      '1',
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
                      subtotal.toString(),
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
                      '20',
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
                      '50',
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
                      finalTotal.toString(),
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
      else {
        return Center(
          child: Text('$state'),
        );
      }
      },
    );
  }
}
