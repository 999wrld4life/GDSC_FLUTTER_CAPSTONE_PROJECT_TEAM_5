import 'package:e_commerce_app/controllers/bottom_navigation_provider/bottom_navigation_provider.dart';
import 'package:e_commerce_app/views/components/bottom_navigation/bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, bottomNavigationProvider, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavigationItem(
                  onTap: () {
                    bottomNavigationProvider.pageIndex = 0;
                  },
                  icon: Ionicons.home,
                  color: bottomNavigationProvider.pageIndex == 0
                      ? const Color.fromRGBO(96, 85, 216, 1)
                      : Colors.grey,
                ),
                BottomNavigationItem(
                  onTap: () {
                    bottomNavigationProvider.pageIndex = 1;
                  },
                  icon: Ionicons.search,
                  color: bottomNavigationProvider.pageIndex == 1
                      ? const Color.fromRGBO(96, 85, 216, 1)
                      : Colors.grey,
                ),
                BottomNavigationItem(
                  onTap: () {
                    bottomNavigationProvider.pageIndex = 2;
                  },
                  icon: Ionicons.lock_closed,
                  color: bottomNavigationProvider.pageIndex == 2
                      ? const Color.fromRGBO(96, 85, 216, 1)
                      : Colors.grey,
                ),
                BottomNavigationItem(
                  onTap: () {
                    bottomNavigationProvider.pageIndex = 3;
                  },
                  icon: Ionicons.person,
                  color: bottomNavigationProvider.pageIndex == 3
                      ? const Color.fromRGBO(96, 85, 216, 1)
                      : Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
