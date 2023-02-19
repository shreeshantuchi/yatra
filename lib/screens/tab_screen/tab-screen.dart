import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:yatra/screens/guide_screen/guide_screen.dart';
import 'package:yatra/screens/home_screen/home_screen.dart';
import 'package:yatra/screens/register_screen/register_screen.dart';
import 'package:yatra/utils/colors.dart';
import 'package:yatra/utils/routes.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<IconData> iconList = [Icons.home, Icons.feed, Icons.person, Icons.abc];

  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<Widget> _pages = [
    HomeScreen(),
    RegisterScreen(),
    GuidScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
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
        activeIndex: _currentIndex,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        //other params
      ),
    );
  }
}
