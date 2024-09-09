import 'package:eshop/src/app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.greyShade700,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
