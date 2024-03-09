import 'package:flutter/material.dart';
import 'package:gdsc_captone_project/services/email_password_auth/signout.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async => await EmailPasswordSignout.signOut(context),
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
