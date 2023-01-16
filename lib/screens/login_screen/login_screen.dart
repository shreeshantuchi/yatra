import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yatra/utils/colors.dart';
import 'package:yatra/utils/routes.dart';
import 'package:yatra/widget/custom-button/custom_button.dart';
import 'package:yatra/widget/custom_form.dart/cusstom_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Image.asset(
                "assets/login.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Login Now",
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Text(
                "Please enter the credential below to continue",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            const CustomForm(
              hintText: "Email",
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomForm(
              hintText: "Password",
              onscureText: true,
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
                        .bodyText2!
                        .copyWith(color: MyColor.primaryColor),
                  ),
                )
              ],
            ),
            CustomButton(
              radius: 30.sp,
              text: "Login",
              onTap: () => Navigator.pushNamed(context, MyRoutes.homeRoute),
            )
          ],
        ),
      ),
    ));
  }
}
