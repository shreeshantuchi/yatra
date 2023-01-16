import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:yatra/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  final double radius;

  const CustomButton({
    super.key,
    this.color = MyColor.primaryColor,
    required this.text,
    required this.onTap,
    this.radius = 4,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: color),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
          child: Center(
            child: Text(
              "$text",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
