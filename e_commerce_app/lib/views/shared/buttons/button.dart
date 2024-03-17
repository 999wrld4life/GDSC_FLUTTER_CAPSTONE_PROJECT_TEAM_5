import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final double buttonWidth;
  final String text;
  const Button({
    super.key,
    required this.buttonWidth,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      padding: EdgeInsets.fromLTRB(15.w, 8.h, 15.w, 8.h),
      decoration: BoxDecoration(
        color: Color.fromRGBO(96, 85, 216, 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle(16.sp, Theme.of(context).colorScheme.primary,
              FontWeight.normal, 1.2),
        ),
      ),
    );
  }
}
