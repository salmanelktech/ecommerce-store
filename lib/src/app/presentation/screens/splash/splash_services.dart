// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:eshop/src/app/presentation/routes/routes_navigator.dart';
import 'package:eshop/src/app/presentation/screens/auth/log_in.dart';
import 'package:eshop/src/app/presentation/screens/onboarding/onboarding_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  isUserlogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? isViewed = prefs.getInt('onboarding');

    await Future.delayed(const Duration(seconds: 2));
    final String? userId = prefs.getString('username');
    log("username $userId");

    RouteNavigator.pushandremoveroute(context,
        isViewed != 0 ? const OnboardingScreen() : const SignInScreen());
  }
}
