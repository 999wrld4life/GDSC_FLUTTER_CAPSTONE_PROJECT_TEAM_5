import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/shared/buttons/circular_back_button.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

void main() {
  runApp(const SettingsPage());
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: const CircularBackArrow(),
        title: Text('Settings',
            style: textStyle(
                20.sp,
                Theme.of(context).colorScheme.inversePrimary,
                FontWeight.bold,
                1)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Text('Account',
                style: textStyle(
                    16.sp,
                    Theme.of(context).colorScheme.inversePrimary,
                    FontWeight.bold,
                    1)),
            SizedBox(height: 5.h),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
              tileColor: Theme.of(context).colorScheme.background,
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Natty Tem',
                    style: textStyle(
                        16.sp,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1),
                  ),
                  Text(
                    'nattemmol@gmail.com',
                    style: textStyle(
                        12.sp,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 10.h),
            Divider(thickness: 2.h),
            SizedBox(height: 10.h),
            Text('Settings',
                style: textStyle(
                    16.sp,
                    Theme.of(context).colorScheme.inversePrimary,
                    FontWeight.bold,
                    1)),
            const SizedBox(height: 10.0),
            const ListTileRowWidget(
              icon: Icons.notifications,
              title: 'Notification',
            ),
            const ListTileRowWidget(
              icon: Icons.language_outlined,
              title: 'Language',
              trailingText: 'English',
            ),
            const ListTileRowWidget(
              icon: Icons.privacy_tip,
              title: 'Privacy',
            ),
            const ListTileRowWidget(
              icon: Icons.help_center,
              title: 'Help Center',
            ),
            const ListTileRowWidget(
              icon: Icons.info,
              title: 'About Us',
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;

  const ListTileRowWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.trailingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
        tileColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
          size: 30.sp,
        ),
        title: Text(
          title,
          style: textStyle(15.sp, Theme.of(context).colorScheme.inversePrimary,
              FontWeight.bold, 1),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: trailingText != null
              ? [
                  Text(
                    trailingText!,
                    style: textStyle(
                        14.sp,
                        Theme.of(context).colorScheme.inversePrimary,
                        FontWeight.bold,
                        1),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ]
              : const [Icon(Icons.arrow_forward_ios)],
        ),
      ),
    );
  }
}
