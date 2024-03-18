import 'package:e_commerce_app/onboarding/components/card_image.dart';
import 'package:e_commerce_app/onboarding/components/card_text.dart';
import 'package:e_commerce_app/views/pages/login_and_register/login_or_register_page.dart';
import 'package:e_commerce_app/views/shared/buttons/button_with_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyPageView extends StatelessWidget {
  final _controller = PageController();

  MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CardImage(
          images: 'assets/card.png',
        ),
        // Post(images: 'lib/images/download Cosmos.jfif',),
        // Post(images: 'lib/images/download.jfif',),
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: const ExpandingDotsEffect(
            activeDotColor: const Color.fromRGBO(96, 85, 216, 1),
            dotColor: Colors.white,
            spacing: 8,
            dotHeight: 15,
            dotWidth: 5,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const CardText(
          header: 'Welcome to Our Shop !',
          description:
              'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor',
        ),
        const SizedBox(
          height: 15,
        ),
        ButtonWithIcon(
          text: 'Get Started',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginOrRegisterPage(),));
          },
        )
      ],
    );
  }
}
