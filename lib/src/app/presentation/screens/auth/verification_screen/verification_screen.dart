import 'package:eshop/src/app/presentation/routes/routes_navigator.dart';
import 'package:eshop/src/app/presentation/screens/auth/verification_screen/success_Screen.dart';
import 'package:eshop/src/app/presentation/utils/app_text_styles.dart';
import 'package:eshop/src/app/presentation/utils/constants.dart';
import 'package:eshop/src/app/presentation/utils/custom_back_button.dart';
import 'package:eshop/src/app/presentation/utils/custom_button.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  bool _areFieldsComplete() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
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
              const SizedBox(height: 100),
              Text(
                'Verification',
                style: AppTextStyles.titleTextStyle(screenWidth),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter the 4-digit code sent to your phone number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.42,
                  color: AppColors.greyShade700,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCodeInputField(context, 0),
                  _buildCodeInputField(context, 1),
                  _buildCodeInputField(context, 2),
                  _buildCodeInputField(context, 3),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'I didn’t receive the code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyShade700,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Resend code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              CustomButton(
                text: 'Verify',
                onPressed: () {
                  if (_areFieldsComplete()) {
                    RouteNavigator.route(context, const SuccessScreen());
                  } else {
                    // Show a snackbar or alert indicating that all fields must be filled
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please enter all 4 digits'),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeInputField(BuildContext context, int index) {
    return SizedBox(
      width: 40,
      child: Column(
        children: [
          TextField(
            controller: _controllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.greyShade700,
            ),
            maxLength: 1,
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: "",
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 3) {
                FocusScope.of(context).nextFocus();
              } else if (value.length == 0 && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
          Container(
            height: 2,
            color: AppColors.greyShade700,
          ),
        ],
      ),
    );
  }
}
