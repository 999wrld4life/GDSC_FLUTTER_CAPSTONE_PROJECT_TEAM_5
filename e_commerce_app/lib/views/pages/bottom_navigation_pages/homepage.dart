import 'package:flutter/material.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Center(
            child: Text(
              'Home Page',
              style: textStyle(40, Theme.of(context).colorScheme.inversePrimary,
                  FontWeight.bold, 1),
            ),
          ),
        ],
      ),
    );
  }
}
