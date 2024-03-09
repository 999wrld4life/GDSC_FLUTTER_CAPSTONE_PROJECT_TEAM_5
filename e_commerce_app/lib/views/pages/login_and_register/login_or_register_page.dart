import 'package:flutter/material.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/loginpage.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/registerpage.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  //function to toggle between the login and register pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    //by default, we make the Login page the first page to appear
    if (showLoginPage) {
      //make sure to create a function variable and require it in the Login page
      return LoginPage(onPressed: togglePages);
    } else {
      return RegisterPage(
        onPressed: togglePages,
      );
    }
  }
}
