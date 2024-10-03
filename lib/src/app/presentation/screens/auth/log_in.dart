import 'package:eshop/src/app/presentation/screens/auth/sign_up.dart';
import 'package:eshop/src/app/presentation/screens/home/main_navigtaion_screen.dart';
import 'package:eshop/src/app/presentation/utils/app_text_styles.dart';
import 'package:eshop/src/app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

// SignInScreen
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isEmailValid = false;

  final String _emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = RegExp(_emailPattern).hasMatch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.horizontalPadding,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    'Sign In',
                    style: AppTextStyles.titleTextStyle(screenWidth),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: AppTextStyles.labelTextStyle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Email TextFormField with rounded borders and external error text
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => _validateEmail(value),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      filled: true,
                      fillColor: AppColors.inputFillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: const TextStyle(color: AppColors.errorColor),
                      suffixIcon: _isEmailValid
                          ? const Icon(Icons.check_circle,
                              color: AppColors.primaryColor)
                          : null,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else if (!_isEmailValid) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: AppTextStyles.labelTextStyle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Password TextFormField with rounded borders and external error text
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      filled: true,
                      fillColor: AppColors.inputFillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: const TextStyle(color: AppColors.errorColor),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: AppTextStyles.forgotPasswordTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  SizedBox(
                    width: screenWidth * 0.8,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen()),
                          );
                        }
                      },
                      child: const Text(
                        'Sign In',
                        style: AppTextStyles.buttonTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.inputFillColor, // updated color
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Or sign in with',
                          style: AppTextStyles.socialButtonTextStyle,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.inputFillColor, // updated color
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: screenWidth * 0.4,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppColors
                                  .inputFillColor, // Change to grey color
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook,
                                  color: AppColors.facebookColor),
                              SizedBox(width: 8),
                              Text(
                                'Facebook',
                                style: AppTextStyles.socialButtonTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: screenWidth * 0.4,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppColors
                                  .inputFillColor, // Change to grey color
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google_icon.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Google',
                                style: AppTextStyles.socialButtonTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFB9C1CC), // Grey 4 color
                          height: 1.42,
                        ),
                      ),
                      // Clickable "Sign Up" text button in green
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor, // Green color
                            height: 1.42,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
