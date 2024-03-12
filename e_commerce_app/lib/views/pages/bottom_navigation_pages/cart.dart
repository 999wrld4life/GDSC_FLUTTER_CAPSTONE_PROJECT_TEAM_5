import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/components/order_summary/order_summary.dart';
import 'package:gdsc_captone_project/views/components/product/cart_component.dart';
import 'package:gdsc_captone_project/views/shared/buttons/button.dart';
import 'package:gdsc_captone_project/views/shared/buttons/circular_back_button.dart';
import 'package:gdsc_captone_project/views/shared/buttons/circular_more_verical.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircularBackArrow(),
                  Text(
                    'Cart',
                    style: textStyle(
                        18,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1.2),
                  ),
                  CircularMoreVert(
                    onPressed: () {
                      //show something
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const MyCartProduct(),
            const MyCartProduct(),
            const MyCartProduct(),
            SizedBox(height: 30.h),
            const OrderSummary(),
            SizedBox(height: 10.h),
            Center(child: Button(buttonWidth: 330.w, text: 'Check out'))
          ],
        ),
      ),
    );
  }
}
