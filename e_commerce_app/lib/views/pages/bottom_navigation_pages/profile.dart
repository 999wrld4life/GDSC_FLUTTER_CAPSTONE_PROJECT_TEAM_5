import 'dart:io';

import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user!.photoURL ?? 'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.displayName!,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              user.email!,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EditProfile(),));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text('Profile'),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: const Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(width: 5),
                  Text('Settings'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: const Row(
                children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 5),
                  Text('Contact'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: const Row(
                children: [
                  const Icon(Icons.share),
                  const SizedBox(width: 5),
                  Text('Share App'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child:  Row(
                children: [
                   Icon(Icons.help_outline_outlined),
                   const SizedBox(width: 5),
                  Text('Help'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}
