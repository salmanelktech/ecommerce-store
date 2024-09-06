import 'package:eshop/src/app/presentation/screens/onboarding/widgets/control_button.dart';
import 'package:eshop/src/app/presentation/screens/onboarding/widgets/semi_circle.dart';
import 'package:eshop/src/app/presentation/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingCarrusel extends StatefulWidget {
  const OnboardingCarrusel({super.key});

  @override
  _OnboardingCarruselState createState() => _OnboardingCarruselState();
}

class _OnboardingCarruselState extends State<OnboardingCarrusel> {
  int _current = 0;
  final PageController _pageController = PageController();
  final int totalItems = 3;

  bool showNextButton = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: totalItems,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                      showNextButton = _current <
                          totalItems -
                              1; // Show button on pages except the last one
                    });
                  },
                  itemBuilder: (context, index) {
                    String item = [
                      Assets.svg.firstOnboardingSVG,
                      Assets.svg.secondOnboardingSVG,
                      Assets.svg.thirdOnboardingSVG
                    ][index];
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  item,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: -190,
                                  left: 0,
                                  right: 0,
                                  child: CustomPaint(
                                    size: MediaQuery.of(context).size,
                                    painter: SemiCircle(),
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  },
                ),
              ),
            ),
            ControlButton(
              current: _current,
              showNextButton: showNextButton,
              pageController: _pageController,
              totalItems: totalItems,
            ),
          ],
        ),
      ),
    );
  }
}
