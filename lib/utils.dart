import 'package:flutter/material.dart';

double getHorizontalPaddingValue(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth >= 1290) {
    return 200;
  } else if (screenWidth >= 1100) {
    return 150;
  } else if (screenWidth >= 900) {
    return 100;
  } else if (screenWidth >= 700) {
    return 50;
  } else {
    return 20;
  }
}
