import 'package:flutter/material.dart';

class LastProjectsCarouselSliderWidget extends StatelessWidget {
  const LastProjectsCarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: getAdaptiveViewPortFraction(context),
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: index == 0
                  ? Colors.red
                  : index == 1
                      ? Colors.green
                      : Colors.blue,
            ),
            height: 1,
          );
        },
      ),
    );
  }

  double getAdaptiveViewPortFraction(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return 0.3;
    } else if (screenWidth >= 800) {
      return 0.4;
    } else if (screenWidth >= 600) {
      return 0.5;
    } else {
      return 0.8;
    }
  }
}
