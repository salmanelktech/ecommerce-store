import 'package:flutter/material.dart';
import '../../../../../app_colors.dart';


class OrderFailed extends StatelessWidget {
  const OrderFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [


            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Center(
                  child: Image.asset(
                    'assets/images/orderfail.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 20),


                const Center(
                  child: Text(
                    'Oops! Order Failed',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray01,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    'Something went wrong, Try Again',
                    style: TextStyle(
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


            const Expanded(
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
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: const Text(
                      'Back to Home',
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
            ),
          ],
        ),
      ),
    );
  }
}