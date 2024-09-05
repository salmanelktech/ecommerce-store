// ignore_for_file: library_private_types_in_public_api

import 'package:eshop/src/app/presentation/screens/onboarding/widgets/control_button.dart';
import 'package:eshop/src/app/presentation/screens/onboarding/widgets/semi_circle.dart';
import 'package:eshop/src/app/presentation/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingCarrusel extends StatefulWidget {
  const OnboardingCarrusel({super.key});

  @override
  _OnboardingCarruselState createState() => _OnboardingCarruselState();
}

class _OnboardingCarruselState extends State<OnboardingCarrusel> {
 
 
 
 
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final int totalItems = 3;

  bool showNextButton = false;

  List<String> descriptions = [
    "Biggest Sell at Your Fingerprint",
    "Pay Secure Payment Gateway",
    "Get Faster and Safe Delivery"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                        if (_current > 0) {
                          showNextButton = true;
                        } else {
                          showNextButton = false;
                        }
                      });
                    },
                  ),
                  items: [
                    Assets.svg.firstOnboardingSVG,
                    Assets.svg.secondOnboardingSVG,
                    Assets.svg.thirdOnboardingSVG
                  ].map((item) {
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
                  }).toList(),
                ),
              ),
            ),
            ControlButton(
              current: _current,
              showNextButton: showNextButton,
              controller: _controller,
              totalItems: totalItems,
            ),
          ],
        ),
      ),
    );
  }
}
