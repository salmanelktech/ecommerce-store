import 'package:eshop/src/app/presentation/components/app_logo_widget.dart';
import 'package:eshop/src/app/presentation/screens/splash/splash_services.dart';
import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SplashServices().isUserlogin(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: kPrimaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: AppLogoWidget(
                    height: size.height / 100 * 20,
                  ),
                ),
              ),
              const Text(
                "Your Shopping Solution",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
