import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yatra/utils/colors.dart';

class Styles {
  static TextTheme data = TextTheme(
    headline1: GoogleFonts.poppins(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.8)),
    bodyText1:
        GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.bold),
    headline6: const TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: GoogleFonts.poppins(fontSize: 13.sp, color: MyColor.greyColor),
  );
}
