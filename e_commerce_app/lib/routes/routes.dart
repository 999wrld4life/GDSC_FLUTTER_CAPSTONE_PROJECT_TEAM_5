import 'package:gdsc_captone_project/Lealem/admin.dart';
import 'package:gdsc_captone_project/Wende/add_product.dart';
import 'package:gdsc_captone_project/Wende/edit_product.dart';
import 'package:gdsc_captone_project/views/pages/auth_pages/auth_page.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/cart.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/mainscreen.dart';
import 'package:gdsc_captone_project/views/pages/bottom_navigation_pages/profiles.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/login_or_register_page.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/loginpage.dart';
import 'package:gdsc_captone_project/views/pages/login_and_register/registerpage.dart';
import 'package:gdsc_captone_project/views/pages/splashscreen_and_onboarding/onboardingpage.dart';
import 'package:gdsc_captone_project/views/pages/subpages/homepage/see_all.dart';
import 'package:gdsc_captone_project/views/pages/subpages/profile/setting.dart';
import 'package:get/get.dart';

class RouteClass {
  static String mainPage = '/';
  static String authPage = '/auth-page';
  static String registerPage = '/register-page';
  static String loginPage = '/login-page';
  static String loginOrRegisterPage = '/login-or-register-page';
  static String profilePage = '/profile-page';
  static String settingsPage = '/settings-page';
  static String onBoardingPage = '/on-boarding-page';
  static String seeAllPage = '/see-all-page';
  static String adminPageOne = '/admin-page-one';
  static String addProductPage = '/add-product-page';
  static String editProductPage = '/edit-product-page';
  static String cartPage = '/cart-page';

  static String getMainRoute() => mainPage;
  static String getAuthRoute() => authPage;
  static String getLoginRoute() => loginPage;
  static String getRegisterRoute() => registerPage;
  static String getLoginOrRegisterRoute() => loginOrRegisterPage;
  static String getProfileRoute() => profilePage;
  static String getSettingsRoute() => settingsPage;
  static String getOnboradingRoute() => onBoardingPage;
  static String getSeeAllRoute() => seeAllPage;
  static String getAdminPageOneRoute() => adminPageOne;
  static String getAddProductRoute() => addProductPage;
  static String getEditProductRoute() => editProductPage;
  static String getCartRoute() => cartPage;

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
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: loginOrRegisterPage,
      page: () => const LoginOrRegisterPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: profilePage,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: settingsPage,
      page: () => const SettingsPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: onBoardingPage,
      page: () => OnBoardingPage(),
    ),
    GetPage(
      name: seeAllPage,
      page: () => const SeeAllPage(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: adminPageOne,
      page: () => AdminPage(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: addProductPage,
      page: () => const AddProducts(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: editProductPage,
      page: () => const EditProducts(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: cartPage,
      page: () => const CartPage(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 2),
    ),
  ];
}
