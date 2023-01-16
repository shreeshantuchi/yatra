import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yatra/screens/landing_screen/widgets/card.dart';
import 'package:yatra/utils/colors.dart';
import 'package:yatra/utils/routes.dart';
import 'package:yatra/widget/custom-button/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('hello');
    const List<String> imagePaths = [
      "assets/1.jpeg",
      "assets/2.jpeg",
      "assets/3.jpeg"
    ];
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LandingCarousel(imagePaths: imagePaths),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  Text(
                    "Travel Anywhere in Nepal Without Any Hassle",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "If you like to travel alot, This is your place! Here you can travel with your favourite tour and enjoy...",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: "Skip",
                        onTap: () {},
                        radius: 10,
                        color: Colors.transparent,
                        textColor: MyColor.greyColor,
                      ),
                      CustomButton(
                        text: "Next",
                        onTap: () {
                          Navigator.pushNamed(context, MyRoutes.loginRoute);
                        },
                        radius: 10,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
