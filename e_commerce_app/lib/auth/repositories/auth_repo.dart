import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/auth/models/user_model.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/views/pages/login_and_register/login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _cloud = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  late TaskSnapshot pic;
  File? _image;
  late MyUser myUser;
  late String url;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Future<int> getNumberOfAuthenticatedUsers() async {
  //   try {
  //     // Fetch the list of users from Firebase Authentication
  //     // var userRecords = await _auth.listUsers();
  //     // Return the number of users
  //     // return userRecords.users.length;
  //   } catch (e) {
  //     // Handle errors
  //     print('Error fetching user data: $e');
  //     return 0;
  //   }
  // }

  Future<int> getNumberOfUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await _cloud.collection('users').get();
      return querySnapshot.size;
    } catch (e) {
      print('Error fetching document count: $e');
      return 0;
    }
  }

  Future<int> getNumberOfOrders() async {
    try {
      QuerySnapshot querySnapshot =
          await _cloud.collectionGroup('order')
          .get();
      return querySnapshot.size;
    } catch (e) {
      print('Error fetching document count: $e');
      return 0;
    }
  }




  Future<String> getUserRole({required User user}) async{
  try {
    final userQuery = await _cloud
        .collection('users')
        .where('uid', isEqualTo: user.uid)
        .get();

    if (userQuery.docs.isEmpty) {
      return 'User not found'; 
    }

    final userData = userQuery.docs[0].data();
    if (!userData.containsKey('roll')) {
      return 'Role not found'; 
    }

    return userData['roll'];
  } catch (e) {
    print(e);
    throw Exception('Failed to retrieve user role');
  }
}


  Future<MyUser?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential usercred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      MyUser myUser = MyUser(
          uid: usercred.user!.uid,
          name: usercred.user!.displayName ?? '',
          email: email);
      return myUser;
    } catch (e) {
      print('Error during sign-in: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => const LoginOrRegisterPage()),
    );
    } catch (e) {
      print('Error during sign-out: $e');
    }
  }

  Future<MyUser?> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      myUser = MyUser(
        uid: userCred.user!.uid,
        email: email,
        name: name,
        imageUrl:
            'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png',
      );
      await _auth.currentUser!.updateDisplayName(name);
      await _auth.currentUser!.updatePhotoURL(
          'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png');
      await _cloud.collection('users').add(myUser.toMap());
      return myUser;
    } catch (e) {
      print('Error during sign-up: $e');
      return null;
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      print('Error during forgot password: $e');
    }
  }

  Future<void> uploadImage({required MyUser user, File? image}) async {
    try {
      final userQuery = await _cloud
          .collection('users')
          .where('uid', isEqualTo: user.uid)
          .get();
      final refDoc = await _storage
          .ref()
          .child('pic ${_auth.currentUser!.uid}')
          .putFile(image!);
      url = await refDoc.ref.getDownloadURL();
      await _auth.currentUser!.updatePhotoURL(url);
      await _cloud.collection('users').doc(userQuery.docs[0].id).update({
        'imageUrl': url,
      });
    } catch (e) {
      print('Error during upload image: $e');
    }
  }
}
