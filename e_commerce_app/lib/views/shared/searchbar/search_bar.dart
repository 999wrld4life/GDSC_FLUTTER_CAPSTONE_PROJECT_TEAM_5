import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          hintText: 'Search here...',
          hintStyle: textStyle(
              12.sp,
              Theme.of(context).colorScheme.inversePrimary,
              FontWeight.normal,
              1.1),
          prefixIcon: Icon(Icons.search_rounded,
              size: 35.sp, color: Theme.of(context).colorScheme.inversePrimary),
          contentPadding: EdgeInsets.symmetric(horizontal: 24.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
