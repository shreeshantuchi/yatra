import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yatra/utils/colors.dart';
import 'package:yatra/utils/form_style.dart';
import 'package:yatra/utils/routes.dart';
import 'package:yatra/widget/background.dart';
import 'package:yatra/widget/custom-button/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return customBackground(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 66.h, bottom: 180.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          height: 95.h,
                          width: 235.5.h,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //   "Login Now",
                  //   style: Theme.of(context).textTheme.headline1,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 30.h),
                  //   child: Text(
                  //     "Please enter the credential below to continue",
                  //     style: Theme.of(context).textTheme.bodyText2,
                  //   ),
                  // ),
                  Text(
                    "Your Email Address",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: FormStyle.signUpStyle(
                        context: context, hintText: "example@gmail.com"),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Your Password",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyText1,
                    obscureText: true,
                    decoration: FormStyle.signUpStyle(
                        context: context, hintText: "password"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: MyColor.whiteColor),
                        ),
                      )
                    ],
                  ),
                  CustomButton(
                    radius: 30.sp,
                    text: "Conitinue",
                    textColor: MyColor.blackColor,
                    color: MyColor.whiteColor.withOpacity(0.5),
                    onTap: () =>
                        Navigator.pushNamed(context, MyRoutes.homeRoute),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.h,
                        width: 150.w,
                        color: MyColor.whiteColor.withOpacity(0.5),
                      ),
                      Text(" OR ",
                          style: Theme.of(context).textTheme.bodyText2),
                      Container(
                        height: 1.h,
                        width: 150.w,
                        color: MyColor.whiteColor.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    imgIcon: "assets/google.png",
                    radius: 30.sp,
                    borderEnabled: true,
                    text: "Sign up with Google",
                    textColor: MyColor.whiteColor,
                    color: Colors.transparent,
                    onTap: () =>
                        Navigator.pushNamed(context, MyRoutes.homeRoute),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  CustomButton(
                    imgIcon: "assets/apple.png",
                    borderEnabled: true,
                    radius: 30.sp,
                    text: "Sign up with Apple",
                    textColor: MyColor.whiteColor,
                    color: Colors.transparent,
                    onTap: () =>
                        Navigator.pushNamed(context, MyRoutes.homeRoute),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
