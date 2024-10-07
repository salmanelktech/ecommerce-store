import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:eshop/src/app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../app_colors.dart';

class ButtonNext extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const ButtonNext(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kSecondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: kPadding * 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius * 3),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
