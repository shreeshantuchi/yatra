import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yatra/widget/custom-button/custom_button.dart';
import 'package:yatra/widget/custom_form.dart/cusstom_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomForm(
            hintText: "Email",
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomForm(
            hintText: "Password",
            onscureText: true,
          ),
          SizedBox(
            height: 30.h,
          ),
          const CustomButton(text: "Login")
        ],
      ),
    ));
  }
}
