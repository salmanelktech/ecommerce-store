import 'package:eshop/src/app/presentation/routes/routes_navigator.dart';
import 'package:eshop/src/app/presentation/screens/auth/log_in.dart';
import 'package:eshop/src/app/presentation/screens/onboarding/widgets/button.dart';
import 'package:eshop/src/app/presentation/screens/onboarding/widgets/description.dart';
import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:eshop/src/app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    Key? key,
    required int current,
    required this.showNextButton,
    required this.pageController,
    required this.totalItems,
  })  : _current = current,
        super(key: key);

  final int _current;
  final bool showNextButton;
  final PageController pageController;
  final int totalItems;

  _storeOnBoarding() async {
    int isViewed = 0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('onboarding', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          DescriptionWidget(
            index: _current,
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    RouteNavigator.pushandremoveroute(
                      context,
                      const SignInScreen(),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kLightGreyColor,
                    ),
                  ),
                ),
                const Spacer(),
                for (int i = 0; i < 3; i++)
                  Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: kPadding),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == i
                            ? kSecondaryColor
                            : kSecondaryColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                const Spacer(),
                ButtonNext(
                  buttonText: "Next",
                  onPressed: () {
                    if (_current == totalItems - 1) {
                      _storeOnBoarding();
                      RouteNavigator.pushandremoveroute(
                        context,
                        const SignInScreen(),
                      );
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
