import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:yatra/screens/home_screen/tab_navigator.dart';
import 'package:yatra/utils/colors.dart';
import 'package:yatra/utils/routes.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<IconData> iconList = [Icons.home, Icons.feed, Icons.person, Icons.abc];
  String currentPage = "Page1";
  int currentIndex = 0;
  List<String> pageKeys = ["Page1", "Page2", "Page3", "Page4"];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if (tabItem == currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentPage = pageKeys[index];
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentPage != "Page1") {
            _selectTab("Page1", 1);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: [
          _buildOffStageNavigator("Page1"),
          _buildOffStageNavigator("Page2"),
          _buildOffStageNavigator("Page3"),
          _buildOffStageNavigator("Page4"),
        ]),
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColor.redColor,
          child: Icon(PhosphorIcons.mapPinBold),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.locationRoute);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Colors.black54,
          inactiveColor: Colors.white.withOpacity(0.5),
          activeColor: Colors.white,
          icons: iconList,
          activeIndex: currentIndex,
          gapLocation: GapLocation.end,
          notchSmoothness: NotchSmoothness.smoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 0,
          onTap: (index) => _selectTab(pageKeys[index], index),
          //other params
        ),
      ),
    );
  }

  Widget _buildOffStageNavigator(String tabItem) {
    return Offstage(
      offstage: currentPage != tabItem,
      child: TavNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
