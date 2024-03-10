import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/components/onboarding/post.dart';
import 'package:gdsc_captone_project/routes/routes.dart';
import 'package:gdsc_captone_project/views/shared/buttons/button_with_icon.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  final _controller = PageController();

  OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F9),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 422.h,
              width: double.infinity,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: const [
                  Post(),
                  Post(),
                  Post(),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.shade300,
                spacing: 8,
                dotHeight: 15,
                dotWidth: 15,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Container(
                height: 188,
                width: 305,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Our Shop !',
                      style: textStyle(
                          24.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.w700,
                          -0.8),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor',
                      style: textStyle(12.sp, const Color(0xFF171717),
                          FontWeight.normal, -0.1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonWithIcon(
                icon: Icons.arrow_forward_outlined,
                text: 'Get Started',
                onTap: () {
                  Get.toNamed(RouteClass.loginPage);
                },
                paddingLeft: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
