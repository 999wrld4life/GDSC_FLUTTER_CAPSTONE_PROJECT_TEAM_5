import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/views/pages/auth_pages/auth_page.dart';
import 'package:e_commerce_app/views/pages/login_and_register/forget_page.dart';
import 'package:e_commerce_app/views/pages/login_and_register/registerpage.dart';
import 'package:e_commerce_app/views/shared/buttons/button_with_icon.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:e_commerce_app/views/shared/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                } else if (state is AuthSuccessState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
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
                        onTap: () {
                          context.read<AuthBloc>().add(
                                LoginEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text),
                              );
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgetPage()));
                        },
                        child: Text(
                          'Forgot Password',
                          style: textStyle(
                              14.sp, Colors.blueAccent, FontWeight.bold, 1),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
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
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                            },
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
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
