import 'package:eshop/src/app/presentation/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.svg.appLogo,
      height: height,
    );
  }
}
