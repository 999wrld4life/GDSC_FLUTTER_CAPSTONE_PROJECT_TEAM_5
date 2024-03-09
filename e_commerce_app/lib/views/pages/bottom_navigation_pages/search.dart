import 'package:flutter/material.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search Page',
          style: textStyle(40, Colors.black, FontWeight.bold, 1),
        ),
      ),
    );
  }
}
