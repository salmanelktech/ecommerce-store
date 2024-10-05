import 'package:flutter/material.dart';
import '../../../../../app_colors.dart';


class PaymentSuccessScreen extends StatelessWidget {
  PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [


            Expanded(
              flex: 1,
              child: SizedBox(),
            ),

            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Center(
                    child: Image.asset(
                      width: 400,
                      'assets/images/payment.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 20),


                  Center(
                    child: Text(
                      'Success',
                      style: const TextStyle(
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray01,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      'You  have successfully make payment. \n Keep patient for delivery',
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        color: AppColors.gray03,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              flex: 1,
              child: SizedBox(),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}