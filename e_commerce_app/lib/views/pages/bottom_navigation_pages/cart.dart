import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Cart Page',
          style: textStyle(40, Colors.black, FontWeight.bold, 1),
        ),
      ),
    );
  }
}
