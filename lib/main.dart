import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yatra/screens/home_screen/home_screen.dart';
import 'package:yatra/screens/landing_screen/landing_screen.dart';
import 'package:yatra/screens/login_screen/login_screen.dart';
import 'package:yatra/screens/splash_screen/splash_screen.dart';
import 'package:yatra/utils/colors.dart';
import 'package:yatra/utils/routes.dart';
import 'package:yatra/utils/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Yatra',
            theme: ThemeData(
                scaffoldBackgroundColor: MyColor.backgroundColor,
                appBarTheme: AppBarTheme(
                    backgroundColor: MyColor.backgroundColor,
                    elevation: 0,
                    iconTheme: IconThemeData(color: MyColor.greyColor)),
                textTheme: Styles.data,
                backgroundColor: MyColor.backgroundColor),
            themeMode: ThemeMode.light,
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
            ),
            initialRoute: "/",
            routes: {
              MyRoutes.splashScreenRoute: (context) => const SplashScreen(),
              MyRoutes.landRoute: ((context) => const LandingScreen()),
              MyRoutes.loginRoute: (context) => const LoginScreen(),
              MyRoutes.homeRoute: ((context) => const HomeScreen())
            },
          );
        });
  }
}
