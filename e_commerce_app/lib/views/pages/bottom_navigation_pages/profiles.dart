import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/routes/routes.dart';
import 'package:gdsc_captone_project/views/pages/subpages/profile/setting.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';
import 'package:gdsc_captone_project/views/shared/profile/profile_widget.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              const ProfileWidget(
                  radius: 50,
                  name: 'Natty',
                  email: 'natty@gmail.com',
                  imagePath: 'imagePath'),
              SizedBox(height: 20.h),
              SizedBox(height: 10.h),
              Column(
                children: List.generate(
                  5,
                  (index) => Column(
                    children: [
                      ColoredBox(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: GestureDetector(
                          onTap: () {
                            if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SettingsPage(),
                                  ));
                            }
                          },
                          child: ListTileWidget(
                            icon: _getIconForIndex(index),
                            title: _getTitleForIndex(index),
                            onPressed: () {
                              if (index == 1) {
                                Get.toNamed(RouteClass.settingsPage);
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              GestureDetector(
                onTap: () {
                  // Add sign-out functionality
                },
                child: Text('Sign Out',
                    style: textStyle(20, Colors.orange, FontWeight.bold, 1.2)),
              ),
            ]),
      ),
    );
  }

  static IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.person;
      case 1:
        return Icons.settings;
      case 2:
        return Icons.message;
      case 3:
        return Icons.share;
      case 4:
        return Icons.help;
      default:
        return Icons.help; // Default to help icon
    }
  }

  static String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Profile';
      case 1:
        return 'Settings';
      case 2:
        return 'Contact';
      case 3:
        return 'Share App';
      case 4:
        return 'Help';
      default:
        return 'Help'; // Default to help title
    }
  }
}

class ListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const ListTileWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 30.sp,
      ),
      title: Text(
        title,
        style: textStyle(14.sp, Theme.of(context).colorScheme.inversePrimary,
            FontWeight.bold, 1),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_forward),
        color: Colors.grey.shade600,
      ),
    );
  }
}
