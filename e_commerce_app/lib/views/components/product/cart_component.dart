import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class MyCartProduct extends StatelessWidget {
  const MyCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: Container(
        width: double.infinity,
        height: 85.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  height: 80.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: Image.asset('assets/images/shoes.jpg').image,
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Watch',
                      style: textStyle(
                          12.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.bold,
                          1.1),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Rolex',
                      style: textStyle(
                          12.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.normal,
                          1.1),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      '\$40',
                      style: textStyle(
                          12.sp, Colors.deepPurple, FontWeight.bold, 1),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      //delete from cart
                    },
                    child:
                        const Icon(Icons.delete, color: Colors.red, size: 35),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //decrease amount
                        },
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.remove),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        '02',
                        style: textStyle(
                            16.sp,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1.3),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          //increase amount
                        },
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
