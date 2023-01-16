import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:yatra/utils/routes.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250.0,
          child: AnimatedTextKit(
            totalRepeatCount: 3,
            onFinished: (() =>
                Navigator.pushNamed(context, MyRoutes.landRoute)),
            animatedTexts: [
              ColorizeAnimatedText(
                'Yatra',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ],
            isRepeatingAnimation: true,
          ),
        ),
      ),
    );
  }
}
