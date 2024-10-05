import 'package:flutter/material.dart';

import '../../../../app_colors.dart';
import 'constants.dart'; // Ensure you import your constants

class AppTextStyles {
  static TextStyle titleTextStyle(double screenWidth) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: screenWidth * 0.06,
      fontWeight: FontWeight.w500,
      height: 1.1,
      letterSpacing: 0.2,
      color: AppColors.gray03, // Ensure your custom color is applied
    );
  }

  static const TextStyle labelTextStyle = TextStyle(
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

  static const TextStyle forgotPasswordTextStyle = TextStyle(
    color: Colors.grey,
  );

  static const TextStyle signUpTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20, // Font size
    fontWeight: FontWeight.w500, // Font weight
    height: 1.1, // Line height (22px / 20px = 1.1)
    letterSpacing: 0.2, // Letter spacing
    color: Color(0xff343434), // Text color (same as primary color)
    textBaseline:
        TextBaseline.alphabetic, // This should be within the TextStyle
  );
}

// constants.dart
class AppDimensions {
  static const double signUpTextWidth =
      78.0; // Width of the "Sign Up" text container
  static const double signUpTextHeight =
      22.0; // Height of the "Sign Up" text container
  static const double signUpTextTop =
      13.0; // Top position of the "Sign Up" text container
}
