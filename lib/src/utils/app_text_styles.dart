import 'package:eshop/src/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle titleTextStyle(double screenWidth) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: screenWidth * 0.06,
      fontWeight: FontWeight.w500,
      height: 1.1,
      letterSpacing: 0.2,
      textBaseline: TextBaseline.alphabetic,
    );
  }

  static TextStyle labelTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle dividerTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14,
  );

  static const TextStyle socialButtonTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  static const TextStyle signUpTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
  );

  static const TextStyle forgotPasswordTextStyle = TextStyle(
    color: Colors.grey,
  );
}
