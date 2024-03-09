import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdsc_captone_project/services/email_password_auth/signin.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/mainscreen.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          // User is logged in, handle navigation based on user role
          User? user = snapshot.data;
          if (user != null) {
            EmailPasswordSignin.handleSignIn(context, user);
          }
          // Return an empty widget while handling navigation
          return const SizedBox();
        } else {
          // User is not logged in, show login or register page
          return const LoginOrRegisterPage();
        }
      },
    );
  }
}
