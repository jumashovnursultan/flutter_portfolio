import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
// import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:my_portfolio_app/const/custom_scroll_behavior.dart';

class LastProjectsCarouselSliderWidget extends StatelessWidget {
  const LastProjectsCarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SizedBox(
        height: 450,
        child: InfiniteCarousel.builder(
          itemCount: 3,
          itemExtent: 400,
          center: false,
          anchor: 0.08,
          velocityFactor: 0.2,
          onIndexChanged: (index) {
            // setState(() {
            //   activeIndex = index;
            // });
          },
          axisDirection: Axis.horizontal,
          loop: false,
          itemBuilder: (context, itemIndex, realIndex) {
            return InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: Container(
                width: 200,
                height: 701,

                margin: const EdgeInsets.symmetric(horizontal: 40),
                // padding: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // double getAdaptiveViewPortFraction(BuildContext context) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   if (screenWidth >= 1400) {
  //     return 0.25;
  //   } else if (screenWidth >= 1200) {
  //     return 0.3;
  //   } else if (screenWidth >= 800) {
  //     return 0.35;
  //   } else if (screenWidth >= 700) {
  //     return 0.45;
  //   } else if (screenWidth >= 600) {
  //     return 0.5;
  //   } else if (screenWidth >= 500) {
  //     return 0.6;
  //   } else if (screenWidth >= 400) {
  //     return 0.8;
  //   } else if (screenWidth >= 300) {
  //     return 0.9;
  //   } else if (screenWidth >= 200) {
  //     return 1.2;
  //   } else {
  //     return 1.3;
  //   }
  // }
  //
}
