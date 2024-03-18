import 'package:e_commerce_app/onboarding/components/page_view.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height, //422,
            width: double.infinity,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyPageView(),
                MyPageView(),
                MyPageView(),
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}