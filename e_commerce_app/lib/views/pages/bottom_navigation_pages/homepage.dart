import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/models/user_model.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());
  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                   CircleAvatar(
                    // backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(user?.photoURL ?? 'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello,',
                      ),
                      Text(
                        user?.displayName ?? 'unknown',
                        style: textStyle(
                            20,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
