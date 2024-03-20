import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/onboarding/onboarding_screen.dart';
import 'package:e_commerce_app/views/pages/admin/add_new_product_page.dart';
import 'package:e_commerce_app/views/pages/admin/admin_screen.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/mainscreen.dart';
import 'package:e_commerce_app/views/pages/login_and_register/login_or_register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          final user = snapshot.data!;
          print('################################################################');
          print(user.email);
          return FutureBuilder<String>(
            future: _authBloc.repo.getUserRole(user: user),
            builder: (context, userRoleSnapshot) {
              if (userRoleSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                );
              } else if (userRoleSnapshot.hasData) {
                final userRole = userRoleSnapshot.data!;
                if (userRole == 'user') {
                  print('----------Debugging Inside user --------------------------------');
                  print(userRole);
                  print('----------Debugging Inside user --------------------------------');
                  return MainScreen();
                } else if (userRole == 'admin') {
                  print('----------Debugging Inside admin--------------------------------');
                  print(userRole);
                  print('----------Debugging Inside admin--------------------------------');
                  return const AdminScreen();
                } else {
                  print('----------Debugging Outside both roll--------------------------------');
                  print(userRole);
                  print('----------Debugging Outside both roll--------------------------------');
                  return Center(
                    child: Text('Error has occured: userRole is $userRole'),
                  );
                }
              } else {
                // Handle error or empty userRole
                return const Text('Error retrieving user role');
              }
            },
          );
        } else {
          return OnboardingScreen();
        }
      },
    );
  }
}
