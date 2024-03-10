import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 78),
      child: Container(
        height: 422.h,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                width: 205.w,
                height: 205.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0XFFD4D9E0)),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  alignment: const Alignment(1, -0.95),
                  width: 305.w,
                  height: 305.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  left: 1.w,
                  child: Container(
                    alignment: Alignment.center,
                    height: 369.h,
                    width: 204.w,
                    child: Image.asset(
                      'assets/images/318b065a77b0f2c3eb752665f2fff4b1.png',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
