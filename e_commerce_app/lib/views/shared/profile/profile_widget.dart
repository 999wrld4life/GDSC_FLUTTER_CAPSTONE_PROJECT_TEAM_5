import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {super.key,
      required this.radius,
      required this.name,
      required this.email,
      required this.imagePath});
  final double radius;
  final String name;
  final String email;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 10.h),
        Text(
          name,
          style: textStyle(24.sp, Theme.of(context).colorScheme.inversePrimary,
              FontWeight.bold, 1),
        ),
        Text(
          email,
          style: textStyle(16.sp, Theme.of(context).colorScheme.inversePrimary,
              FontWeight.normal, 1),
        ),
      ],
    );
  }
}
