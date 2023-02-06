import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yatra/utils/routes.dart';
import 'package:yatra/widget/background.dart';

const colorizeColors = [Colors.yellow, Colors.amber, Colors.black];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool selected = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), (() {
      setState(() {
        selected = false;
      });
    }));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return customBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: GestureDetector(
            onTap: (() {
              setState(() {
                selected = !selected;
              });
            }),
            child: AnimatedContainer(
              height: selected ? 20.h : 96.h,
              width: selected ? 20.h : 235.5.w,
              duration: const Duration(seconds: 2),
              onEnd: (() {
                Future.delayed(
                    const Duration(seconds: 2),
                    (() => Navigator.popAndPushNamed(
                        context, MyRoutes.loginRoute)));
              }),
              child: Image.asset(
                "assets/logo.png",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
