import 'package:e_commerce_app/views/pages/login_and_register/login_or_register_page.dart';
import 'package:e_commerce_app/views/shared/buttons/button_with_icon.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFfffffc),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    padding: const EdgeInsets.only(top: 50),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image:
                          AssetImage('assets/onboardingImages/background.png'),
                      fit: BoxFit.cover,
                    )),
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      children: [
                        Image.asset(
                          'assets/onboardingImages/image 1.png',
                        ),
                        Image.asset('assets/onboardingImages/1.png'),
                        Image.asset('assets/onboardingImages/2.png'),
                        Image.asset('assets/onboardingImages/3.png'),
                        Image.asset('assets/onboardingImages/man-paying.png'),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 5,
                      effect: WormEffect(
                        type: WormType.thin,
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey[300]!,
                        activeDotColor: const Color.fromRGBO(96, 85, 216, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Welcome to Our Shop !',
                      style: textStyle(32, Colors.black, FontWeight.bold, 1),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'We are a new online shopping platform that helps you to find the best products for you.',
                      style: textStyle(16, Colors.grey, FontWeight.normal, 1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWithIcon(
                      icon: Icons.arrow_right_alt_sharp,
                      text: 'Get Started',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginOrRegisterPage(),
                            ));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
