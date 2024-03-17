import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/views/pages/auth_pages/auth_page.dart';
import 'package:e_commerce_app/views/pages/login_and_register/login_or_register_page.dart';
import 'package:e_commerce_app/views/pages/login_and_register/loginpage.dart';
import 'package:e_commerce_app/views/shared/buttons/button_with_icon.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:e_commerce_app/views/shared/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPage extends StatelessWidget {
  ForgetPage({super.key});
  final _emailController = TextEditingController();
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                } else if (state is ForgotPasswordState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginOrRegisterPage(),
                      ));
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
                            "Forgot Password",
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
                            'Enter your email to receive an email to reset your password',
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
                            text: 'Email',
                            // labelText: 'Username or Email',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200.h,
                      ),
                      ButtonWithIcon(
                        icon: Icons.send,
                        text: 'Send',
                        onTap: () {
                          if (_emailController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Please enter an email'),
                              ),
                            );
                          } else {
                            context.read<AuthBloc>().add(
                                  ForgotPasswordEvent(
                                    email: _emailController.text,
                                  ),
                                );
                            // _emailController.clear();
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account?",
                            style: textStyle(
                                14.sp,
                                Theme.of(context).colorScheme.inversePrimary,
                                FontWeight.normal,
                                1),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
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
