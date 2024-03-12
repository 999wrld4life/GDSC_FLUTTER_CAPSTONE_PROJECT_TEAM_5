import 'package:flutter/material.dart';
import 'package:gdsc_captone_project/controllers/bottom_navigation_provider/bottom_navigation_provider.dart';
import 'package:gdsc_captone_project/controllers/theme_provider/theme_provider.dart';
import 'package:gdsc_captone_project/services/email_password_auth/signout.dart';
import 'package:gdsc_captone_project/views/components/bottom_navigation/bottom_navigation.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/cart.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/homepage.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/profiles.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/search.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pages = [
    HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, bottomNavigationProvider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: pages[bottomNavigationProvider.pageIndex],
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                color: Theme.of(context).colorScheme.inversePrimary,
                icon: const Icon(Icons.dark_mode_outlined),
              ),
              IconButton(
                onPressed: () async =>
                    await EmailPasswordSignout.signOut(context),
                icon: const Icon(Icons.logout_outlined),
                color: Theme.of(context).colorScheme.inversePrimary,
              )
            ],
          ),
          bottomNavigationBar: const BottomNavigation(),
        );
      },
    );
  }
}
