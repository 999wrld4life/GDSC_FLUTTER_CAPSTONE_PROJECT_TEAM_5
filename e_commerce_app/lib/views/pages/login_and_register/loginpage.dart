import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/services/email_password_auth/signin.dart';
import 'package:gdsc_captone_project/views/shared/buttons/button_with_icon.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';
import 'package:gdsc_captone_project/views/shared/textfield/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onPressed});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 25.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's Sign You In",
                      style: textStyle(
                          30.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.bold,
                          1),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Welcome Back',
                      style: textStyle(
                          16.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.normal,
                          1),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    MyTextField(
                      controller: _emailController,
                      isBool: false,
                      icon: Icons.email_outlined,
                      text: 'Username',
                      // labelText: 'Username or Email',
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    MyTextField(
                      controller: _passwordController,
                      isBool: true,
                      icon: Icons.lock_outline,
                      text: 'Password',
                      // labelText: 'Password',
                    ),
                  ],
                ),
                SizedBox(
                  height: 200.h,
                ),
                ButtonWithIcon(
                  icon: Icons.login,
                  text: 'Sign in',
                  onTap: () async {
                    await EmailPasswordSignin.signInUser(
                        context, _emailController, _passwordController);
                  },
                  paddingLeft: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: textStyle(
                          14.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.normal,
                          1),
                    ),
                    TextButton(
                      onPressed: onPressed,
                      child: Text(
                        'Sign up',
                        style: textStyle(
                            14.sp,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
