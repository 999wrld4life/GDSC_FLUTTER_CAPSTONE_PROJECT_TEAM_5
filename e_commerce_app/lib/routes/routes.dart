import 'package:gdsc_captone_project/views/pages/auth_pages/auth_page.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/mainscreen.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/login_or_register_page.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/loginpage.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/registerpage.dart';
import 'package:get/get.dart';

class RouteClass {
  static String mainPage = '/';
  static String authPage = '/auth-page';
  static String registerPage = '/register-page';
  static String loginPage = '/login-page';
  static String loginOrRegisterPage = '/login-or-register-page';

  static String getMainRoute() => mainPage;
  static String getAuthRoute() => authPage;
  static String getLoginRoute() => loginPage;
  static String getRegisterRoute() => registerPage;
  static String getLoginOrRegisterRoute() => loginOrRegisterPage;

  static List<GetPage> routes = [
    GetPage(
      name: authPage,
      page: () => const AuthPage(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: mainPage,
      page: () => MainScreen(),
    ),
    GetPage(
      name: registerPage,
      page: () => const RegisterPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(
      name: loginOrRegisterPage,
      page: () => const LoginOrRegisterPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
