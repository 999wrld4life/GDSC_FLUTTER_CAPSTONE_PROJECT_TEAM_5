import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/views/pages/auth_pages/auth_page.dart';
import 'package:e_commerce_app/views/shared/buttons/button_with_icon.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:e_commerce_app/views/shared/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _username = TextEditingController();
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                      builder: (context) =>  const AuthPage(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Getting Started",
                        style: textStyle(
                            28.sp,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Create an account to continue!',
                        style: textStyle(
                            14.sp,
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
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      MyTextField(
                        controller: _username,
                        isBool: false,
                        icon: Icons.person_2_outlined,
                        text: 'Username',
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      MyTextField(
                        controller: _passwordController,
                        isBool: true,
                        icon: Icons.lock_outline,
                        text: 'Password',
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      MyTextField(
                        controller: _confirmPasswordController,
                        isBool: true,
                        icon: Icons.lock,
                        text: 'Confirm Password',
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: isChecked
                                ? Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      size: 13.0,
                                      color: Colors.black,
                                    ),
                                  )
                                : const Icon(
                                    Icons.check_box_outline_blank,
                                    size: 20.0,
                                    color: Colors.grey,
                                  ),
                          ),
                          SizedBox(width: 8.w),
                          Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: SizedBox(
                              width: 250.w,
                              child: RichText(
                                softWrap: true,
                                text: TextSpan(
                                  style: textStyle(10.sp, Colors.black,
                                      FontWeight.normal, 1),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text:
                                            'By creating an account, you agree to our '),
                                    TextSpan(
                                      text: 'Terms & Conditions',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      ButtonWithIcon(
                        icon: Icons.login,
                        text: 'Sign Up',
                        onTap: () {
                          if(_passwordController.text == _confirmPasswordController.text) {
                            context.read<AuthBloc>().add(
                                SignUpEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    name: _username.text),
                              );
                          }else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Passwords do not match!'),
                              ),
                            );
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: textStyle(
                                14.sp,
                                Theme.of(context).colorScheme.inversePrimary,
                                FontWeight.normal,
                                1),
                          ),
                          TextButton(
                            onPressed: widget.onPressed,
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
                      )
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
