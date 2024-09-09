import 'package:eshop/src/app/presentation/routes/routes_navigator.dart';
import 'package:eshop/src/app/presentation/screens/auth/log_in.dart';
import 'package:eshop/src/app/presentation/utils/custom_back_button.dart';
import 'package:eshop/src/app/presentation/utils/custom_button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                        color: Color(0xFF13544E),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
              ),
              const SizedBox(height: 120),
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF34C98E),
                ),
                child: const Icon(
                  Icons.check,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: 0.2,
                  color: Color(0xFF13544E),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'You have successfully completed\nyour registration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.42,
                  color: Color(0xFF828B9A),
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  RouteNavigator.route(context, const SignInScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
