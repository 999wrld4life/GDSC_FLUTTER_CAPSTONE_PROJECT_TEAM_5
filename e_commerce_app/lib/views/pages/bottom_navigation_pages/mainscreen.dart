import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/controllers/bottom_navigation_provider/bottom_navigation_provider.dart';
import 'package:e_commerce_app/controllers/theme_provider/theme_provider.dart';
import 'package:e_commerce_app/views/components/bottom_navigation/bottom_navigation.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/cart.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/homepage.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/profile.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, bottomNavigationProvider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: pages[bottomNavigationProvider.pageIndex],
          appBar: AppBar(
            title: const Text('Main Screen'),
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
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                },
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
