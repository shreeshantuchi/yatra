import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:yatra/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final bool borderEnabled;
  final String? text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  final double radius;
  final String imgIcon;

  const CustomButton({
    super.key,
    this.color = MyColor.primaryColor,
    required this.text,
    required this.onTap,
    this.radius = 4,
    this.textColor = Colors.white,
    this.imgIcon = "",
    this.borderEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54.h,
        decoration: BoxDecoration(
            border:
                borderEnabled ? Border.all(color: textColor, width: 1) : null,
            borderRadius: BorderRadius.circular(radius),
            color: color),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imgIcon.isNotEmpty
                    ? Image.asset(imgIcon)
                    : SizedBox(
                        width: 0.w,
                      ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "$text",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
