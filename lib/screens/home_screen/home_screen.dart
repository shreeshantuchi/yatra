import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:yatra/screens/home_screen/widget/home_carousel.dart';
import 'package:yatra/services/location_services.dart';
import 'package:yatra/utils/colors.dart';
import 'package:yatra/utils/routes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  List<String> imagePaths = ["assets/1.jpeg", "assets/2.jpeg", "assets/3.jpeg"];
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<LocationService>().determinePosition();
    context.read<LocationService>().listenToLocationChange();
  }

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
            HomeCarousel(imagePaths: widget.imagePaths)
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
            const CurrentLcoation()
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

class CurrentLcoation extends StatefulWidget {
  const CurrentLcoation({super.key});

  @override
  State<CurrentLcoation> createState() => _CurrentLcoationState();
}

class _CurrentLcoationState extends State<CurrentLcoation> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, MyRoutes.locationRoute),
      child: Row(
        children: [
          const Icon(
            PhosphorIcons.mapPinBold,
            color: MyColor.greyColor,
          ),
          SizedBox(
            width: 5.w,
          ),
          context.watch<LocationService>().placemark.isNotEmpty
              ? Text(
                  "${context.watch<LocationService>().placemark.last.locality} , ${context.watch<LocationService>().placemark.last.country}")
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
