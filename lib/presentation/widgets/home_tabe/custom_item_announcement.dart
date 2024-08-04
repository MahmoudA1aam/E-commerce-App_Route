import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemAnnouncement extends StatelessWidget {
  CustomItemAnnouncement({super.key});

  List<String> imageSlider = [
    "assets/images/Group 13.png",
    "assets/images/Property 1=Default.png",
    "assets/images/unsplash_PDX_a_82obo.png"
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: 398.w,
      height: 200.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ImageSlideshow(
          initialPage: 0,
          width: 398.w,
          height: 200.h,
          indicatorColor: theme.primaryColor,
          indicatorBackgroundColor: Colors.white,
          indicatorBottomPadding: 15.h,
          indicatorRadius: 4,
          disableUserScrolling: false,
          autoPlayInterval: 3000,
          isLoop: true,
          children: imageSlider.map(
            (e) {
              return Image.asset(
                e,
                fit: BoxFit.fill,
                width: 398.w,
                height: 200.h,
              );
            },
          ).toList()),
    );
  }
}
