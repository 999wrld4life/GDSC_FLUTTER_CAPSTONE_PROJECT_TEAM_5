import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData? icon;
  final String text;
  final double paddingLeft;
  final void Function()? onTap;
  const ButtonWithIcon({
    super.key,
    this.icon,
    required this.text,
    this.onTap,
    required this.paddingLeft,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.w,
        padding: EdgeInsets.fromLTRB(15.w, 11.h, 15.w, 11.h),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 39, 55, 176),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: paddingLeft.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: textStyle(14.sp, Theme.of(context).colorScheme.primary,
                    FontWeight.normal, 1.2),
              ),
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
