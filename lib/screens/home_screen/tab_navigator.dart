import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yatra/screens/home_screen/home_screen.dart';
import 'package:yatra/screens/login_screen/login_screen.dart';
import 'package:yatra/screens/register_screen/register_screen.dart';

class TavNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final String tabItem;
  const TavNavigator(
      {super.key, required this.tabItem, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    Widget child = RegisterScreen();

    if (tabItem == "Page1")
      child = HomeScreen();
    else if (tabItem == "Page2")
      child = LoginScreen();
    else if (tabItem == "Page3")
      child = HomeScreen();
    else if (tabItem == "Page4") child = HomeScreen();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSetting) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
