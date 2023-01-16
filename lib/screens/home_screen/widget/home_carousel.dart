import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yatra/utils/colors.dart';

class HomeCarousel extends StatefulWidget {
  final List imagePaths;
  const HomeCarousel({super.key, required this.imagePaths});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: 200.h,
      width: MediaQuery.of(context).size.width.w,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.imagePaths.length,
          itemBuilder: ((context, index) {
            return Cards(imagePath: widget.imagePaths[index]);
          })),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  height: 100.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
