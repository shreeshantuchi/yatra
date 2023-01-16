import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:yatra/screens/home_screen/widget/home_carousel.dart';
import 'package:yatra/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagePaths = ["assets/1.jpeg", "assets/2.jpeg", "assets/3.jpeg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.h),
        child: Column(
          children: [
            WelcomeHeadingText(),
            SizedBox(height: 20.h),
            const SearchForm(),
            SizedBox(height: 20.h),
            HomeCarousel(imagePaths: imagePaths)
          ],
        ),
      ),
    );
  }
}

class WelcomeHeadingText extends StatelessWidget {
  final String user;
  WelcomeHeadingText({super.key, this.user = "Nancy"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeText(context),
            SizedBox(
              height: 5.h,
            ),
            currentLocation(
              context,
            ),
          ],
        ),
        menuIcons(context),
      ],
    );
  }

  Widget welcomeText(BuildContext context) {
    return Row(
      children: [
        Text(
          "Welcome, $user ",
          style: Theme.of(context).textTheme.headline6,
        ),
        const Icon(
          PhosphorIcons.handWavingFill,
          color: Colors.amber,
        ),
      ],
    );
  }

  Widget currentLocation(BuildContext context) {
    return Row(
      children: [
        const Icon(
          PhosphorIcons.mapPinBold,
          color: MyColor.greyColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "Kathamandu, Nepal",
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }

  Widget menuIcons(BuildContext context) {
    return Row(
      children: [
        const Icon(PhosphorIcons.bellBold),
        SizedBox(
          width: 20.w,
        ),
        const Icon(PhosphorIcons.dotsThreeOutlineVerticalBold)
      ],
    );
  }
}

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.1)),
      child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: const Icon(PhosphorIcons.slidersHorizontalBold),
            prefixIcon: const Icon(PhosphorIcons.magnifyingGlassBold),
            contentPadding: EdgeInsets.symmetric(vertical: 10.w),
            hintText: "Search",
            hintStyle: Theme.of(context).textTheme.bodyText2,
            border: InputBorder.none),
      ),
    );
  }
}
