import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yatra/services/location_services.dart';

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
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
        elevation: 1,
        child: Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.sp),
                child: Image.asset(
                  imagePath,
                  height: 100.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Swayambhu"),
                  Text("4.5"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(PhosphorIcons.mapPin),
                  Text(context
                      .watch<LocationService>()
                      .placemark
                      .last
                      .locality
                      .toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
