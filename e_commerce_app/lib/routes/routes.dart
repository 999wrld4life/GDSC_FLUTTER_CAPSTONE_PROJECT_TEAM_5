import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/views/pages/auth_pages/auth_page.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/edit_profile.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/mainscreen.dart';
import 'package:e_commerce_app/views/pages/bottom_navigation_pages/profile.dart';
import 'package:e_commerce_app/views/pages/login_and_register/login_or_register_page.dart';
import 'package:e_commerce_app/views/pages/login_and_register/loginpage.dart';
import 'package:e_commerce_app/views/pages/login_and_register/registerpage.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteClass {
  static String mainPage = '/';
  static String authPage = '/auth-page';
  static String registerPage = '/register-page';
  static String loginPage = '/login-page';
  static String loginOrRegisterPage = '/login-or-register-page';
  static String editProfilePage = '/edit-profile-page';
  static String profilePage = '/profile-page';

  static String getMainRoute() => mainPage;
  static String getAuthRoute() => authPage;
  static String getLoginRoute() => loginPage;
  static String getRegisterRoute() => registerPage;
  static String getLoginOrRegisterRoute() => loginOrRegisterPage;
  static String getEditProfileRoute() => editProfilePage;
  static String getProfileRoute() => profilePage;

  static List<GetPage> routes = [
    GetPage(
      name: authPage,
      page: () => BlocProvider(
        create: (context) => AuthBloc(repo: AuthRepo()),
        child: const AuthPage(),
      ),
      // transition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: mainPage,
      page: () => MainScreen(),
    ),
    GetPage(
      name: registerPage,
      page: () => BlocProvider(
        create: (context) => AuthBloc(repo: AuthRepo()),
        child: const RegisterPage(),
      ),
      // transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(
      name: loginPage,
      page: () => BlocProvider(
        create: (context) => AuthBloc(repo: AuthRepo()),
        child: LoginPage(),
      ),
      // transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(
      name: loginOrRegisterPage,
      page: () =>  BlocProvider(
        create: (context) => AuthBloc(repo: AuthRepo()),
        child: const LoginOrRegisterPage(),
      ),
      // transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: profilePage,
      page: () =>  BlocProvider(
        create: (context) => AuthBloc(repo: AuthRepo()),
        child: const ProfilePage(),
      ),
      // transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: editProfilePage,
      page: () =>  BlocProvider(
        create: (context) => AuthBloc(repo: AuthRepo()),
        child: const EditProfile(),
      ),
      // transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
