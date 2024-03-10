import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/controllers/bottom_navigation_provider/bottom_navigation_provider.dart';
import 'package:e_commerce_app/controllers/theme_provider/theme_provider.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(repo: AuthRepo()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Provider.of<ThemeProvider>(context).themeData,
        initialRoute: RouteClass.getAuthRoute(),
        getPages: RouteClass.routes,
      ),
    );
  }
}
