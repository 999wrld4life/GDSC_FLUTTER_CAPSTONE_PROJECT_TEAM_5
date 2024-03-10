import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
            color: Theme.of(context).colorScheme.inversePrimary,
          )
        ],
      ),
      body: Center(
        child: Text(
          'Admin page',
          style: textStyle(40, Colors.black, FontWeight.bold, 1.2),
        ),
      ),
    );
  }
}
