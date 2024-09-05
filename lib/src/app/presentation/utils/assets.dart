class Assets {
  Assets._();

  static final images = _AssetsImages._();
  static final svg = _AssetsSvg._();
}

class _AssetsImages {
  _AssetsImages._();

  final universityBackgroundIMG = 'assets/images/background.jpg';
}

class _AssetsSvg {
  _AssetsSvg._();
  final appLogo = 'assets/svgs/app-logo.svg';

  final firstOnboardingSVG = "assets/svgs/onboarding-1.svg";
  final secondOnboardingSVG = "assets/svgs/onboarding-2.svg";
  final thirdOnboardingSVG = "assets/svgs/onboarding-3.svg";
}
